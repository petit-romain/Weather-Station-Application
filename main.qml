import QtQuick 2.11
import QtQuick.Controls 2.4
import QtQuick.Window 2.11

//Splashscreen {}

Item {
    visible: false

    Splashscreen {}

    Window {
        id: mainWindow
        x: (Screen.width - width) / 2
        y: (Screen.height - height) / 2
        width: 1280
        height: 720
        title: "Weather Station"

        Rectangle {
            x: -border.width
            width: parent.width + 2 * border.width
            height: 0.05 * parent.height
            border.width: 1

            Text {
                anchors.centerIn: parent
                text: informations.currentDate
                font.pixelSize: 21
            }
        }
    }
}
