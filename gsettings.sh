#!/usr/bin/env bash

set -e

if ! which tilix > /dev/null; then
  echo "tilix not installed, install it then try again"
  exit 1
fi

desktop_schema='org.gnome.desktop.wm.keybindings'
mutter_schema='org.gnome.mutter.keybindings'
shell_schema='org.gnome.shell.keybindings'
tilix_schema='com.gexperts.Tilix.Keybindings'

for i in {1..9}
do
  gsettings set "${shell_schema}" "switch-to-application-$i" "[]"
  gsettings set "${desktop_schema}" "switch-to-workspace-$i" "['<Super>$i']"
  gsettings set "${tilix_schema}" "session-switch-to-terminal-$i" "disabled"
  gsettings set "${tilix_schema}" "win-switch-to-session-$i" "<Alt>$i"
done


gsettings set "${tilix_schema}" "session-switch-to-terminal-0" "disabled"
gsettings set "${tilix_schema}" "win-switch-to-session-0" "<Alt>0"
gsettings set "${tilix_schema}" "session-switch-to-terminal-down" "<Alt>j"
gsettings set "${tilix_schema}" "session-switch-to-terminal-left" "<Alt>h"
gsettings set "${tilix_schema}" "session-switch-to-terminal-right" "<Alt>l"
gsettings set "${tilix_schema}" "session-switch-to-terminal-up" "<Alt>k"
gsettings set "${tilix_schema}" "session-synchronize-input" '<Shift><Alt>i'
gsettings set "${tilix_schema}" "session-add-down" '<Shift><Alt>d'
gsettings set "${tilix_schema}" "session-add-right" '<Alt>d'

gsettings set "${desktop_schema}" "switch-to-workspace-right" "[]"
gsettings set "${desktop_schema}" "switch-to-workspace-left" "[]"
gsettings set "${desktop_schema}" "unmaximize" "[]"
gsettings set "${desktop_schema}" "move-to-monitor-up" "['<Primary><Shift><Super>Up']"
gsettings set "${desktop_schema}" "move-to-monitor-down" "['<Primary><Shift><Super>Down']"
gsettings set "${desktop_schema}" "switch-to-workspace-up" "['<Primary><Super>Up']"
gsettings set "${desktop_schema}" "switch-to-workspace-down" "['<Primary><Super>Down']"

gsettings set "${mutter_schema}" "toggle-tiled-right" "['<Super>Right']"
gsettings set "${mutter_schema}" "toggle-tiled-left" "['<Super>Left']"

gsettings set "${desktop_schema}" "toggle-maximized" "['<Super>Up']"

gsettings set "${desktop_schema}" "move-to-workspace-1" "['<Shift><Super>exclaim']"
gsettings set "${desktop_schema}" "move-to-workspace-2" "['<Shift><Super>at']"
gsettings set "${desktop_schema}" "move-to-workspace-3" "['<Shift><Super>numbersign']"
gsettings set "${desktop_schema}" "move-to-workspace-4" "['<Shift><Super>dollar']"
gsettings set "${desktop_schema}" "move-to-workspace-5" "['<Shift><Super>percent']"
gsettings set "${desktop_schema}" "move-to-workspace-6" "['<Shift><Super>asciicircum']"
gsettings set "${desktop_schema}" "move-to-workspace-7" "['<Shift><Super>ampersand']"
gsettings set "${desktop_schema}" "move-to-workspace-8" "['<Shift><Super>asterisk']"
gsettings set "${desktop_schema}" "move-to-workspace-9" "['<Shift><Super>parenleft']"

gsettings set "${desktop_schema}" "switch-to-workspace-10" "['<Super>0']"
gsettings set "${desktop_schema}" "move-to-workspace-10" "['<Shift><Super>parenright']"

gsettings set "org.gnome.desktop.default-applications.terminal" exec tilix

