{ ... }: {
  "global/wm" = {
    # Adjust the _NET_WM_STRUT_PARTIAL top value
    # Used for top aligned bars
    margin-bottom = 0;

    # Adjust the _NET_WM_STRUT_PARTIAL bottom value
    # Used for bottom aligned bars
    margin-top = 0;

    # include-file = "~/.config/polybar/colors.ini";
    include-file = [
      "~/.config/polybar/modules.ini" 
      "~/.config/polybar/custom_modules.ini"
      ];
  };

  "colors" = {
    dark0_hard = "#121715";
    dark0_soft = "#27332e";
    light0_hard = "#ffffc8";
    light0_soft = "#e8d499";
    faded_red = "#CF9722";
    faded_green = "#7B8438";
    faded_yellow = "#D8AA32";
    faded_blue = "#CF9925";
    faded_purple = "#9F984A";
    faded_aqua = "#AF8925";
    bright_red = "#ffc91c";
    bright_green = "#a9b73c";
    bright_yellow = "#ffe42f";
    bright_blue = "#ffcc20";
    bright_purple = "#ddd251";
    bright_aqua = "#f1b822";
  };

  # Bar Settings

  "bar/main" = {
    # Use either of the following command to list available outputs:
    # If unspecified, the application will pick the first one it finds.
    # $ polybar -m | cut -d ':' -f 1
    # $ xrandr -q | grep " connected" | cut -d ' ' -f1
    monitor = "eDP-1";

    # Use the specified monitor as a fallback if the main one is not found.
    # monitor-fallback = "HDMI-2"

    # Require the monitor to be in connected state
    # XRandR sometimes reports my monitor as being disconnected (when in use)
    monitor-strict = false;

    # Tell the Window Manager not to configure the window.
    # Use this to detach the bar if your WM is locking its size/position.
    override-redirect = false;

    # Put the bar at the bottom of the screen
    bottom = false;

    # Prefer fixed center position for the `modules-center` block
    # When false, the center position will be based on the size of the other blocks.
    fixed-center = true;

    # Dimension defined as pixel value (e.g. 35) or percentage (e.g. 50%),
    # the percentage can optionally be extended with a pixel offset like so:
    # 50%:-10, this will result in a width or height of 50% minus 10 pixels
    width = "100%";
    height = 42;

    # Offset defined as pixel value (e.g. 35) or percentage (e.g. 50%)
    # the percentage can optionally be extended with a pixel offset like so:
    # 50%:-10, this will result in an offset in the x or y direction 
    # of 50% minus 10 pixels
    offset-x = 0;
    offset-y = 0;

    # Background ARGB color (e.g. #f00, #ff992a, #ddff1023)
    background = "\${colors.dark0_hard}";

    # Foreground ARGB color (e.g. #f00, #ff992a, #ddff1023)
    foreground = "\${colors.light0_soft}";

    # overline-size = 5
    border-size = 0;

    border-bottom-size = 0;
    border-bottom-color = "\${colors.dark0_hard}";
    border-top-size = 0;
    border-top-color = "\${colors.dark0_hard}";

    border-left-size = 0;
    border-left-color = "\${colors.dark0_hard}";

    border-right-size = 8;
    border-right-color = "\${colors.dark0_hard}";

    padding-left = 0;
    padding-right = 0;

    module-margin-left = 0;
    module-margin-right = 0;

    # Fonts are defined using <font-name>;<vertical-offset>
    # Font names are specified using a fontconfig pattern.
    #   font-0 = NotoSans-Regular:size=8;2
    #   font-1 = MaterialIcons:size=10
    #   font-2 = Termsynu:size=8;-1
    #   font-3 = FontAwesome:size=10
    # See the Fonts wiki page for more details

    # Modules are added to one of the available blocks
    #   modules-left = cpu ram
    #   modules-center = xwindow xbacklight
    #   modules-right = ipc clock

    ## Available modules

    #alsa backlight battery
    #bspwm cpu date
    #filesystem github i3
    #memory mpd wired-network
    #network pulseaudio temperature
    #keyboard title workspaces

    ## User modules
    #checknetwork updates window_switch launcher powermenu sysmenu menu style

    # Bars
    #cpu_bar memory_bar filesystem_bar mpd_bar 
    #volume brightness battery_bar 

    modules-left = "i3";
    modules-center = "custom_time";
    modules-right = "healthbar dunst_indicator net_indicator bluetooth_speaker volume tresorit_indicator";

    # The separator will be inserted between the output of each module
    #separator = 

    # This value is used to add extra spacing between elements
    # @deprecated: This parameter will be removed in an upcoming version
    # spacing = 0

    # Opacity value between 0.0 and 1.0 used on fade in/out
    dim-value = 1;

    # Value to be used to set the WM_NAME atom
    # If the value is empty or undefined, the atom value
    # will be created from the following template: polybar-[BAR]_[MONITOR]
    # NOTE: The placeholders are not available for custom values
    wm-name = "i3"; 

    # Locale used to localize various module data (e.g. date)
    # Expects a valid libc locale, for example: sv_SE.UTF-8
    #locale = 

    # Position of the system tray window
    # If empty or undefined, tray support will be disabled
    # NOTE: A center aligned tray will cover center aligned modules
    tray-position = "none";

    # If true, the bar will not shift its
    # contents when the tray changes
    # tray-detached = false

    # Tray icon max size
    # tray-maxsize = 16

    # Tray offset defined as pixel value (e.g. 35) or percentage (e.g. 50%)
    # tray-offset-x = 0
    # tray-offset-y = 0

    # Pad the sides of each tray icon
    # tray-padding = 0

    # Scale factor for tray clients
    # tray-scale = 1.0

    # Restack the bar window and put it above the
    # selected window manager's root

    # Fixes the issue where the bar is being drawn
    # on top of fullscreen window's

    # Currently supported WM's:
    #   bspwm
    #   i3 (requires: `override-redirect = true`)
    # wm-restack =

    # Set a DPI values used when rendering text
    # This only affects scalable fonts
    # dpi = 

    # Enable support for inter-process messaging
    # See the Messaging wiki page for more details.
    enable-ipc = true;

    # Fallback click handlers that will be called if
    # there's no matching module handler found.
    #click-left = 
    #click-middle = 
    #click-right =
    #scroll-up =
    #scroll-down =
    #double-click-left =
    #double-click-middle =
    #double-click-right =

    # Requires polybar to be built with xcursor support (xcb-util-cursor)
    # Possible values are:
    # - default   : The default pointer as before, can also be an empty string (default)
    # - pointer   : Typically in the form of a hand
    # - ns-resize : Up and down arrows, can be used to indicate scrolling
    #cursor-click = 
    #cursor-scroll = 

    ## WM Workspace Specific

    # bspwm
    ##scroll-up = bspwm-desknext
    ##scroll-down = bspwm-deskprev
    ##scroll-up = bspc desktop -f prev.local
    ##scroll-down = bspc desktop -f next.local

    # i3
    scroll-up = "i3wm-wsnext";
    scroll-down = "i3wm-wsprev";
    #scroll-up = "i3-msg workspace next_on_output";
    #scroll-down = "i3-msg workspace prev_on_output";
  };

  ## Application Settings

  "settings" = {
    # The throttle settings lets the eventloop swallow up til X events
    # if they happen within Y millisecond after first event was received.
    # This is done to prevent flood of update event.

    # For example if 5 modules emit an update event at the same time, we really
    # just care about the last one. But if we wait too long for events to swallow
    # the bar would appear sluggish so we continue if timeout
    # expires or limit is reached.
    throttle-output = 5;
    throttle-output-for = 10;

    # Time in milliseconds that the input handler will wait between processing events
    throttle-input-for = 30;

    # Reload upon receiving XCB_RANDR_SCREEN_CHANGE_NOTIFY events
    screenchange-reload = true;

    # Compositing operators
    # @see: https://www.cairographics.org/manual/cairo-cairo-t.html#cairo-operator-t
    compositing-background = "source";
    compositing-foreground = "over";
    compositing-overline = "over";
    compositing-underline = "over";
    compositing-border = "over";

    # Define fallback values used by all module formats
    #format-foreground = 
    #format-background = 
    #format-underline =
    #format-overline =
    #format-spacing =
    #format-padding =
    #format-margin =
    #format-offset =
  };
}
