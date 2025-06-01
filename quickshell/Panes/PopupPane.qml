import QtQuick
import QtQuick.Layouts
import QtQuick.Controls
import "../Data/" as Dat
import "../Generics/" as Gen

Rectangle {
  id: popupRect

  property alias closeTimer: popupClose
  property bool closed: true
  property var currentNotif: stack.currentItem

  Component.onCompleted: {
    stack.depthChanged.connect(() => {
      if (stack.depth == 0) {
        popupClose.running = false;
      }
    });
  }

  StackView {
    id: stack

    anchors.fill: parent
    clip: true
    initialItem: null

    pushEnter: Transition {
      ParallelAnimation {
        YAnimator {
          duration: Dat.MaterialEasing.standardDecelTime
          easing.bezierCurve: Dat.MaterialEasing.standardDecel
          from: 100
          to: 0
        }
      }
    }
    pushExit: Transition {
      ParallelAnimation {
        YAnimator {
          duration: Dat.MaterialEasing.standardAccelTime
          easing.bezierCurve: Dat.MaterialEasing.standardAccel
          from: 0
          to: -100
        }

        NumberAnimation {
          duration: Dat.MaterialEasing.standardAccelTime
          easing.bezierCurve: Dat.MaterialEasing.standardAccel
          from: 1
          property: "opacity"
          to: 0
        }
      }
    }
  }

  Timer {
    id: popupClose

    interval: 3500

    onTriggered: {
      popupRect.closed = true;
    }
  }

  Timer {
    id: stackClearTimer

    interval: 500

    onTriggered: stack.clear()
  }
} 