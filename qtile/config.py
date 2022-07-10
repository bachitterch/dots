import os
import subprocess

from libqtile import bar, layout, widget, qtile
from libqtile.config import Click, Drag, Group, Key, Match, Screen
from libqtile.lazy import lazy
from libqtile import hook
from libqtile.backend.wayland import InputConfig


wl_input_rules = {}


mod = "mod4"
terminal = "alacritty"
colors = {
        "background": "#282a36",
        "current": "#44475a",
        "selection": "44475a",
        "foreground": "#f8f8f2",
        "comment": "#6272a4",
        "cyan": "#8be9fd",
        "green": "#50fa7b",
        "orange": "#ff79c6",
        "pink": "#ff79c6",
        "purple": "#bd93f9",
        "red": "#ff5555",
        "yellow": "#f1fa8c"
        }

decor = {
        "borderwidth": 3,
        "highlight_method": "text",
        "rounded": "True",
        "disable_drag": True,
        "inactive": colors["comment"],
        "active": colors["foreground"],
        "hightlight_color": colors["background"],
        "this_current_screen_border": colors["red"],
        "block_hightlight_text_color": colors["red"]
        }


keys = [
    # Switch between windows
    Key([mod], "h", lazy.layout.left()),
    Key([mod], "l", lazy.layout.right()),
    Key([mod], "j", lazy.layout.down()),
    Key([mod], "k", lazy.layout.up()),
    # Move window between different coloumns
    Key([mod, "shift"], "h", lazy.layout.shuffle_left()),
    Key([mod, "shift"], "l", lazy.layout.shuffle_right()),
    Key([mod, "shift"], "j", lazy.layout.shuffle_down()),
    Key([mod, "shift"], "k", lazy.layout.shuffle_up()),
    # Change window size
    Key([mod, "control"], "h", lazy.layout.grow_left()),
    Key([mod, "control"], "l", lazy.layout.grow_right()),
    Key([mod, "control"], "j", lazy.layout.grow_down()),
    Key([mod, "control"], "k", lazy.layout.grow_up()),
    # Launch terminal
    Key([mod], "Return", lazy.spawn(terminal)),
    # Toggle layouts
    Key([mod], "Tab", lazy.next_layout()),
    # Close focused window
    Key([mod], "w", lazy.window.kill()),
    # Reload qtile config
    Key([mod, "shift"], "r", lazy.reload_config()),
    # Restart qtile
    Key([mod, "shift"], "e", lazy.restart()),
    # Launch rofi
    Key([mod], "d", lazy.spawn("rofi -show drun -theme '~/.config/rofi/config.rasi'")),
    # Take screenshot(Scrot)
    Key([mod], "Print", lazy.spawn("flameshot full")),
    Key([], "Print", lazy.spawn("flameshot gui"))
]

groups = [Group(i) for i in "123456"]

for i in groups:
    keys.extend(
        [
            Key([mod], i.name, lazy.group[i.name].toscreen()),
            Key([mod, "shift"], i.name, lazy.window.togroup(i.name, switch_group=True)),
        ]
    )

layouts = [
    layout.MonadTall(border_focus=colors["purple"],
        border_normal=colors["background"],margin=5, border_width=3,
        border_on_single=True),
    layout.Max(),
]

widget_defaults = dict(
    font="JetBrains Mono Nerd Font",
    fontsize=11,
    padding=5,
    foreground=colors["foreground"]
)
extension_defaults = widget_defaults.copy()

screens = [
    Screen(
        wallpaper="Pictures/wallpapers/72w5pv.png",
        wallpaper_mode="fill",
        top=bar.Bar(
            [
                widget.Sep(linewidth=0, padding=5),
                widget.TextBox(text="🐍", fontsize=16),
                widget.Sep(linewidth=0, padding=5),
                widget.GroupBox(**decor),
                widget.Sep(linewidth=0, padding=5),
                widget.WindowName(),
                widget.Sep(linewidth=0, padding=5),
                widget.CPU(format="CPU {load_percent}%"),
                widget.Sep(linewidth=0, padding= 5),
                widget.Volume(fmt="VOL: {}"),
                widget.Sep(linewidth=0, padding=5),
                widget.Battery(show_short_text= False, format="BAT {percent:2.0%}"),
                widget.Sep(linewidth=0, padding=5),
                widget.Systray(icon_size=16, padding=5),
                widget.Sep(linewidth=0, padding=5),
                widget.Clock(format="%B,%d %I:%M"),
                widget.Sep(linewidth=0, padding=5),
            ],
            24,
            margin=[0,0,5,0],
            background=colors["background"],
            foreground=colors["foreground"]
        ),
        bottom=bar.Gap(5),
        left=bar.Gap(5),
        right=bar.Gap(5)
    )
]

# Drag floating layouts.
mouse = [
    Drag([mod], "Button1", lazy.window.set_position_floating(), start=lazy.window.get_position()),
    Drag([mod], "Button3", lazy.window.set_size_floating(), start=lazy.window.get_size()),
    Click([mod], "Button2", lazy.window.bring_to_front()),
]

dgroups_key_binder = None
dgroups_app_rules = []
follow_mouse_focus = True
bring_front_click = False
cursor_warp = False
floating_layout = layout.Floating(
    float_rules=[
        # Run the utility of `xprop` to see the wm class and name of an X client.
        *layout.Floating.default_float_rules,
        Match(wm_class="confirmreset"),  # gitk
        Match(wm_class="makebranch"),  # gitk
        Match(wm_class="maketag"),  # gitk
        Match(wm_class="ssh-askpass"),  # ssh-askpass
        Match(title="branchdialog"),  # gitk
        Match(title="pinentry"),  # GPG key password entry
        Match(wm_class="fig_desktop"),
        Match(title="fig_desktop")
        ]
)
auto_fullscreen = True
focus_on_window_activation = "smart"
reconfigure_screens = True
auto_minimize = True
wl_input_rules = None
wmname = "Qtile"
