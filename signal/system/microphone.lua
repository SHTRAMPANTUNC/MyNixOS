local awful = require("awful")

local muted_old = -1
local function emit()
	awful.spawn.easy_async_with_shell("wpctl get-volume @DEFAULT_AUDIO_SOURCE@", function(out)
		local muted = out:match('MUTED')
		if muted ~= muted_old then
			awesome.emit_signal('signal::microphone', muted)
			muted_old = muted
		end
	end)
end

emit()

local subscribe = [[ bash -c "LANG=C pactl subscribe 2> /dev/null | grep --line-buffered \"Event 'change' on source\"" ]]

awful.spawn.easy_async({ 'pkill', '--full', '--uid', os.getenv('USER'), '^pactl subscribe' }, function()
	awful.spawn.with_line_callback(subscribe, {
		stdout = function() emit() end
	})
end)