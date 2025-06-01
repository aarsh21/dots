pragma Singleton
import Quickshell
import Quickshell.Io
import QtQuick

Singleton {
  id: root

  // Pywal16 Dynamic Colors
  // Automatically reads colors from pywal cache and updates the theme

  property var pywalColors: ({})
  readonly property bool pywalLoaded: Object.keys(pywalColors).length > 0

  // Core pywal colors (mapped from the 16-color palette)
  readonly property color background: pywalLoaded ? pywalColors.special?.background || "#0e0e0d" : "#121318"
  readonly property color foreground: pywalLoaded ? pywalColors.special?.foreground || "#c2c2c2" : "#e3e1e9"
  
  // Primary colors (using pywal color1-color6 for main accents)
  readonly property color primary: pywalLoaded ? pywalColors.colors?.color4 || "#238a93" : "#b6c4ff"
  readonly property color primary_container: pywalLoaded ? pywalColors.colors?.color0 || "#0e0e0d" : "#354479"
  readonly property color on_primary: pywalLoaded ? pywalColors.special?.background || "#0e0e0d" : "#1d2d61"
  readonly property color on_primary_container: pywalLoaded ? pywalColors.colors?.color12 || "#2FB9C4" : "#dce1ff"
  
  // Secondary colors (using pywal color2, color10 for secondary accents)
  readonly property color secondary: pywalLoaded ? pywalColors.colors?.color2 || "#22838a" : "#c2c5dd"
  readonly property color secondary_container: pywalLoaded ? pywalColors.colors?.color8 || "#6b6b57" : "#424659"
  readonly property color on_secondary: pywalLoaded ? pywalColors.special?.background || "#0e0e0d" : "#2b3042"
  readonly property color on_secondary_container: pywalLoaded ? pywalColors.colors?.color10 || "#2EAFB8" : "#dee1f9"
  
  // Tertiary colors (using pywal color3, color11 for tertiary accents)
  readonly property color tertiary: pywalLoaded ? pywalColors.colors?.color6 || "#429497" : "#e3bada"
  readonly property color tertiary_container: pywalLoaded ? pywalColors.colors?.color8 || "#6b6b57" : "#5b3d57"
  readonly property color on_tertiary: pywalLoaded ? pywalColors.special?.background || "#0e0e0d" : "#432740"
  readonly property color on_tertiary_container: pywalLoaded ? pywalColors.colors?.color14 || "#58C6CA" : "#ffd7f5"

  // Surface colors (based on background with slight variations)
  readonly property color surface: background
  readonly property color surface_bright: pywalLoaded ? pywalColors.colors?.color8 || "#6b6b57" : "#38393f"
  readonly property color surface_container: pywalLoaded ? Qt.darker(background, 1.1) : "#1e1f25"
  readonly property color surface_container_high: pywalLoaded ? Qt.lighter(background, 1.2) : "#292a2f"
  readonly property color surface_container_highest: pywalLoaded ? Qt.lighter(background, 1.4) : "#34343a"
  readonly property color surface_container_low: pywalLoaded ? Qt.darker(background, 1.05) : "#1a1b21"
  readonly property color surface_container_lowest: pywalLoaded ? Qt.darker(background, 1.2) : "#0d0e13"
  readonly property color surface_dim: pywalLoaded ? Qt.darker(background, 1.1) : "#121318"
  readonly property color surface_tint: primary
  readonly property color surface_variant: pywalLoaded ? pywalColors.colors?.color8 || "#6b6b57" : "#45464f"

  // Text colors
  readonly property color on_background: foreground
  readonly property color on_surface: foreground
  readonly property color on_surface_variant: pywalLoaded ? pywalColors.colors?.color7 || "#978c8c" : "#c6c5d0"

  // Error colors (using bright accent from pywal)
  readonly property color error: pywalLoaded ? pywalColors.colors?.color9 || "#1E97A5" : "#ffb4ab"
  readonly property color error_container: pywalLoaded ? pywalColors.colors?.color1 || "#16717b" : "#93000a"
  readonly property color on_error: background
  readonly property color on_error_container: pywalLoaded ? pywalColors.colors?.color9 || "#1E97A5" : "#ffdad6"

  // Outline colors
  readonly property color outline: pywalLoaded ? pywalColors.colors?.color8 || "#6b6b57" : "#90909a"
  readonly property color outline_variant: pywalLoaded ? Qt.darker(pywalColors.colors?.color8 || "#6b6b57", 1.3) : "#45464f"

  // Fixed colors (brighter versions)
  readonly property color primary_fixed: pywalLoaded ? pywalColors.colors?.color12 || "#2FB9C4" : "#dce1ff"
  readonly property color primary_fixed_dim: primary
  readonly property color secondary_fixed: pywalLoaded ? pywalColors.colors?.color10 || "#2EAFB8" : "#dee1f9"
  readonly property color secondary_fixed_dim: secondary
  readonly property color tertiary_fixed: pywalLoaded ? pywalColors.colors?.color14 || "#58C6CA" : "#ffd7f5"
  readonly property color tertiary_fixed_dim: tertiary

  // Fixed variant colors
  readonly property color on_primary_fixed: background
  readonly property color on_primary_fixed_variant: pywalLoaded ? pywalColors.colors?.color1 || "#16717b" : "#354479"
  readonly property color on_secondary_fixed: background
  readonly property color on_secondary_fixed_variant: pywalLoaded ? pywalColors.colors?.color1 || "#16717b" : "#424659"
  readonly property color on_tertiary_fixed: background
  readonly property color on_tertiary_fixed_variant: pywalLoaded ? pywalColors.colors?.color1 || "#16717b" : "#5b3d57"

  // Inverse colors
  readonly property color inverse_on_surface: background
  readonly property color inverse_primary: pywalLoaded ? pywalColors.colors?.color12 || "#2FB9C4" : "#4d5c92"
  readonly property color inverse_surface: foreground

  // Utility colors
  readonly property color scrim: "#000000"
  readonly property color shadow: "#000000"

  // File reader for pywal colors
  property FileView pywalReader: FileView {
    id: pywalReader
    path: Quickshell.env("HOME") + "/.cache/wal/colors.json"

    function updateColors() {
      try {
        const text = pywalReader.text();
        if (text) {
          const jsonData = JSON.parse(text);
          root.pywalColors = jsonData;
          console.log("Pywal colors loaded successfully");
        }
      } catch (e) {
        console.log("Failed to parse pywal colors:", e);
        // Fallback to default colors if pywal fails
        root.pywalColors = {};
      }
    }

    onLoaded: updateColors()
  }

  Component.onCompleted: {
    // Load initial pywal colors
    pywalReader.reload();
  }

  function withAlpha(color: color, alpha: real): color {
    return Qt.rgba(color.r, color.g, color.b, alpha);
  }

  // Helper function to refresh colors manually
  function refreshPywalColors() {
    pywalReader.reload();
  }
}
