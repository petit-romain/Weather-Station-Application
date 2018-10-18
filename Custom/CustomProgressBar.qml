import QtQuick 2.6
import QtQuick.Controls 2.1

ProgressBar {
    id: control

    background: Rectangle {
        color: "transparent"
        radius: 3
        border.width: 1.5
        border.color: "lightgrey"
    }

    contentItem: Item {
        implicitWidth: control.width
        implicitHeight: control.height

        Rectangle {
            x: 1.5
            y: 1.5
            width: control.visualPosition * parent.width - 3
            height: parent.height - 3
            color: "#17a81a"
        }

        Text {
            anchors.centerIn: parent
            font.pixelSize: 13
            text: control.value + " %"
        }
    }
}
