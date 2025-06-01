import QtQuick
import QtQuick.Layouts
import Quickshell.Hyprland
import Quickshell.Wayland

import "../Data/" as Dat
import "../Generics/" as Gen

Rectangle {
  id: root

  // Function to convert a number to Roman numeral
  function toRoman(num) {
    if (isNaN(num) || num < 1 || num > 3999) return num.toString(); // Return original if not a valid number for Roman conversion
    var roman = { M: 1000, CM: 900, D: 500, CD: 400, C: 100, XC: 90, L: 50, XL: 40, X: 10, IX: 9, V: 5, IV: 4, I: 1 };
    var str = '';
    for (var i of Object.keys(roman)) {
      var q = Math.floor(num / roman[i]);
      num -= q * roman[i];
      str += i.repeat(q);
    }
    return str;
  }

  clip: true
  color: Dat.Colors.primary_container
  height: 20
  implicitWidth: workRow.width + 8
  radius: 20

  Behavior on implicitWidth {
    NumberAnimation {
      duration: Dat.MaterialEasing.standardDecelTime
      easing.bezierCurve: Dat.MaterialEasing.standardDecel
    }
  }

  RowLayout {
    id: workRow

    anchors.bottom: parent.bottom
    anchors.left: parent.left
    anchors.top: parent.top
    spacing: 5

    Rectangle {
      color: Dat.Colors.primary
      implicitHeight: 20
      implicitWidth: Math.max(30, workspaceNumText.contentWidth + 10)
      radius: 20

      Text {
        id: workspaceNumText

        anchors.centerIn: parent
        color: Dat.Colors.on_primary
        font.family: Dat.Globals.notchFontFamily
        font.pointSize: 10
        text: toRoman(Hyprland.focusedWorkspace?.id ?? 0)
      }
    }

    Text {
      id: windowNameText

      readonly property Toplevel activeWindow: ToplevelManager.activeToplevel

      Layout.maximumWidth: 100
      color: Dat.Colors.on_primary_container
      elide: Text.ElideRight
      font.family: Dat.Globals.notchFontFamily
      font.pointSize: 11
      text: Dat.Globals.actWinName
    }
  }

  Gen.MouseArea {
    layerColor: Dat.Colors.on_primary_container
    layerRadius: 20

    onClicked: {
      if (Dat.Globals.notchState == "FULLY_EXPANDED" && Dat.Globals.swipeIndex == 2) {
        Dat.Globals.notchState = "EXPANDED";
      } else {
        Dat.Globals.notchState = "FULLY_EXPANDED";
        Dat.Globals.swipeIndex = 2;
      }
    }
  }
}
