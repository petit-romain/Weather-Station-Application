import QtQuick 2.11
import QtQuick.Controls 2.4
import QtGraphicalEffects 1.0

Item {
    anchors.top: parent.top
    anchors.left: parent.left
    width: 0.25 * parent.width
    height: parent.height

    Item {
        anchors.top: parent.top
        anchors.left: parent.left
        height: parent.height / 4 - firstBar.height / 2
        width: parent.width

        Text {
            id: titleWindDirection
            anchors.top: parent.top
            anchors.topMargin: 0.05 * parent.height
            anchors.horizontalCenter: parent.horizontalCenter
            font.pixelSize: 19
            color: "green"
            text: "Wind direction"
        }

        Image {
            anchors.top: parent.top
            anchors.topMargin: 2 * titleWindDirection.anchors.topMargin + titleWindDirection.paintedHeight
            anchors.horizontalCenter: parent.horizontalCenter
            source: "Images/Compass.png"
            sourceSize.width: parent.width
            sourceSize.height: parent.height - anchors.topMargin - 1 * titleWindDirection.anchors.topMargin

            ColorOverlay {
                anchors.fill: parent
                source: parent
                color: "green"
            }

            Image {
                anchors.verticalCenter: parent.verticalCenter
                anchors.left: parent.left
                anchors.leftMargin: 0.45 * parent.width
                source: "Images/Arrow.svg"
                sourceSize.width: 0.13 * parent.width
                sourceSize.height: 0.5 * parent.height
                rotation: informations.windDirection

                ColorOverlay {
                    anchors.fill: parent
                    source: parent
                    color: "lightgrey"
                }
            }
        }
    }

    Rectangle {
        id: firstBar
        anchors.top: parent.top
        anchors.topMargin: parent.height / 4 - height / 2
        anchors.horizontalCenter: parent.horizontalCenter
        width: 0.7 * parent.width
        height: 7
        radius: 11
        color: "transparent"
        border.width: 3
        border.color: "green"
    }

    Item{
        anchors.top: parent.top
        anchors.topMargin: parent.height / 4 + firstBar.height / 2
        anchors.left: parent.left
        height: parent.height / 4 - secondBar.height
        width: parent.width

        Text {
            id: titleWindVelocity
            anchors.top: parent.top
            anchors.topMargin: 0.05 * parent.height
            anchors.horizontalCenter: parent.horizontalCenter
            font.pixelSize: 19
            color: "green"
            text: "Wind velocity"
        }

        Text {
            anchors.centerIn: parent
            font.family: fontStgs.digital7FontName
            font.pixelSize: 61
            color: "green"
            text: informations.windVelocities[6].toPrecision(4)

            Text {
                anchors.top: parent.bottom
                anchors.topMargin: titleWindVelocity.anchors.topMargin
                anchors.horizontalCenter: parent.horizontalCenter
                font.pixelSize: 17
                color: "green"
                text: "km/h"
            }
        }
    }

    Rectangle {
        id: secondBar
        anchors.top: parent.top
        anchors.topMargin: parent.height / 2 - height / 2
        anchors.horizontalCenter: parent.horizontalCenter
        width: 0.7 * parent.width
        height: 7
        radius: 11
        color: "transparent"
        border.width: 3
        border.color: "green"
    }

    Item {
        anchors.bottom: parent.bottom
        anchors.bottomMargin: parent.height / 4 + thirdBar.height
        anchors.left: parent.left
        height: parent.height / 4 - 1.5 * thirdBar.height
        width: parent.width

        Text {
            id: titleRainfallHour
            anchors.top: parent.top
            anchors.topMargin: 0.05 * parent.height
            anchors.horizontalCenter: parent.horizontalCenter
            font.pixelSize: 19
            color: "green"
            text: "Current hour rainfall"
        }

        Text {
            anchors.centerIn: parent
            font.family: fontStgs.digital7FontName
            font.pixelSize: 61
            color: "green"
            text: informations.rainFallHour.toPrecision(4)

            Text {
                anchors.top: parent.bottom
                anchors.topMargin: titleWindVelocity.anchors.topMargin
                anchors.horizontalCenter: parent.horizontalCenter
                font.pixelSize: 17
                color: "green"
                text: "mm"
            }
        }
    }

    Rectangle {
        id: thirdBar
        anchors.bottom: parent.bottom
        anchors.bottomMargin: parent.height / 4
        anchors.horizontalCenter: parent.horizontalCenter
        width: 0.7 * parent.width
        height: 7
        radius: 11
        color: "transparent"
        border.width: 3
        border.color: "green"
    }

    Item {
        anchors.bottom: parent.bottom
        anchors.left: parent.left
        height: parent.height / 4
        width: parent.width

        Text {
            id: titleRainfallDay
            anchors.top: parent.top
            anchors.topMargin: 0.05 * parent.height
            anchors.horizontalCenter: parent.horizontalCenter
            font.pixelSize: 19
            color: "green"
            text: "Current day rainfall"
        }

        Text {
            anchors.centerIn: parent
            font.family: fontStgs.digital7FontName
            font.pixelSize: 61
            color: "green"
            text: informations.rainFallDay.toPrecision(4)

            Text {
                anchors.top: parent.bottom
                anchors.topMargin: titleWindVelocity.anchors.topMargin
                anchors.horizontalCenter: parent.horizontalCenter
                font.pixelSize: 17
                color: "green"
                text: "mm"
            }
        }
    }
}
