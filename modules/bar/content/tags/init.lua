local tags

if config.bar.tags.style == "default" then
    tags = require "modules.bar.content.tags.default"
elseif config.bar.tags.style == "flat" then
    tags = require "modules.bar.content.tags.flat"
elseif config.bar.tags.style == "dots" then
    tags = require "modules.bar.content.tags.dots"
elseif config.bar.tags.style == "cube" then
    tags = require "modules.bar.content.tags.cube"
else
    tags = require "modules.bar.content.tags.default"
end

return tags