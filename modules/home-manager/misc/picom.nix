{ colors
, pkgs
, ...
}:

{
  services.picom = {
    enable = true;
    package = pkgs.picom.overrideAttrs (oldAttrs: {
      pname = "compfy";
      buildInputs = [
        pkgs.pcre2
      ]
      ++
      oldAttrs.buildInputs;
      src = pkgs.fetchFromGitHub {
        owner = "allusive-dev";
        repo = "compfy";
        rev = "1.7.2";
        hash = "sha256-7hvzwLEG5OpJzsrYa2AaIW8X0CPyOnTLxz+rgWteNYY=";
      };
      postInstall = '''';
    });
  };
  home.file.".config/compfy/compfy.conf".text = ''

wm-support = "awesome";

#################################
#         ANIMATIONS            #
#################################

animations = true;
animation-stiffness = 120;
animation-window-mass = 0.3;
animation-dampening = 12;
animation-clamping = true;
animation-for-open-window = "zoom";
animation-for-unmap-window = "zoom";

#################################
#           Corners             #
#################################

corner-radius = 6;

rounded-corners-exclude = [
  "window_type = 'dock'",
  "name = 'Notification area'"
];

#################################
#             Shadows           #
#################################

shadow = true;
shadow-radius = 16;
shadow-opacity = 0.2;
shadow-offset-x = -8;
shadow-offset-y = -8;

shadow-exclude = [
  "name = 'Notification'",
  "class_g != 'awesome' && !_COMPTON_SHADOW@:32c",
  "_GTK_FRAME_EXTENTS@:c"
]

#################################
#           Fading              #
#################################

fading = true;
fade-in-step = 0.04;
fade-out-step = 0.04;
fade-delta = 8


#################################
#   Transparency / Opacity      #
#################################


inactive-opacity = 1.0;
frame-opacity = 1.0;
inactive-opacity-override = false;
active-opacity = 1.0;

opacity-rule = [
  "85:class_g = 'awesome'",
];


#################################
#     Background-Blurring       #
#################################

blur-background = true;

blur: {
	method = "dual_kawase";
	strength = 10;
	deviation = 1;
	background-frame = true;
	background-fixed = true;
	kern = "11x11gaussian";
}
blur-strength = 8;

blur-whitelist = true;

blur-include = [
  "class_g ?= 'kitty'",
  "class_g = 'awesome' && !_NET_WM_WINDOW_TYPE@:32a = '_NET_WM_WINDOW_TYPE_UTILITY'"
];


#################################
#       General Settings        #
#################################

backend = "glx";
vsync = false;
log-level = "info";

#################################
#           ADVANCED            #
#################################

wintypes:
{
 popup_menu = { opacity = 0.95; animation = "none";}
 utility = { animation = "none"; };
};
  '';
}
