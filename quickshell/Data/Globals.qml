pragma Singleton
import QtQuick
import Quickshell
import Quickshell.Io
import Quickshell.Wayland

Singleton {
  id: root

  // Font Configuration
  readonly property string fontFamily: "JetBrainsMono Nerd Font"
  readonly property string monoFontFamily: "JetBrainsMono Nerd Font Mono"
  readonly property string notchFontFamily: "JetBrainsMono Nerd Font"

  property string actWinName: activeWindow?.activated ? activeWindow?.appId : "desktop"
  readonly property Toplevel activeWindow: ToplevelManager.activeToplevel
  property string hostName: "Computer"
  property real mprisDotRotation: 0
  property bool notchHovered: false

  // one of "COLLAPSED", "EXPANDED", "FULLY_EXPANDED"
  property string notchState: (reservedShell) ? "EXPANDED" : "COLLAPSED"
  property bool reservedShell: false

  // SettingsView State
  // 0 => Power
  // 1 => Audio
  // 2 => Network
  property int settingsTabIndex: 0

  // Central Panel SwipeView stuff
  // 0 => Home
  // 1 => Calendar
  // 2 => System
  // 3 => Mpris
  // 4 => SettingsView
  property int swipeIndex: 0

  onActWinNameChanged: {
    if (reservedShell) {
      return;
    }
    if (root.actWinName == "desktop" && root.notchState == "COLLAPSED") {
      root.notchState = "EXPANDED";
    } else if (root.notchState == "EXPANDED" && !root.notchHovered) {
      root.notchState = "COLLAPSED";
    }
  }
}
