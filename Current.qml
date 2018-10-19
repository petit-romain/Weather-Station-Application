import QtQuick 2.11
import QtQuick.Layouts 1.3
import QtGraphicalEffects 1.0
import "./Fonts"

Item {
    anchors.top: parent.top
    anchors.right: parent.right
    width: 0.75 * parent.width
    height: 0.5 * parent.height

    Item {
        id: dateAndTime
        anchors.top: parent.top
        anchors.right: parent.right
        width: parent.width
        height: 0.5 * parent.height - middleBar.height / 2

        Text  {
            anchors.top: parent.top
            anchors.topMargin: parent.height / 3 - paintedHeight / 2
            anchors.left: parent.left
            anchors.leftMargin: (0.8 * parent.width - paintedWidth) / 2
            font.pixelSize: 40
            color: "green"
            text: informations.currentDate
        }

        Text {
            anchors.bottom: parent.bottom
            anchors.bottomMargin: parent.height / 3 - paintedHeight / 2
            anchors.left: parent.left
            anchors.leftMargin: (0.8 * parent.width - paintedWidth) / 2
            font.pixelSize: 40
            color: "green"
            text: informations.currentTime
        }

        Image {
            property int currentClimate: informations.climates[6]
            anchors.top: parent.top
            anchors.topMargin: 0.05 * parent.height
            anchors.right: parent.right
            anchors.rightMargin: 0.1 * parent.width
            source: {
                switch(currentClimate) {
                case 0:
                    return "Images/Sun.svg"
                case 1:
                    return "Images/Cloud.svg"
                case 2:
                    return "Images/Rain.svg"
                default:
                    return ""
                }
            }
            sourceSize.width: 0.2 * parent.width
            sourceSize.height: 0.9 * parent.height

            ColorOverlay {
                anchors.fill: parent
                source: parent
                color: {
                    switch(parent.currentClimate) {
                    case 0:
                        return "yellow"
                    case 1:
                        return "grey"
                    case 2:
                        return "steelblue"
                    default:
                        return "transparent"
                    }
                }
            }
        }
    }

    Rectangle {
        id: middleBar
        anchors.verticalCenter: parent.verticalCenter
        width: parent.width
        height: 3
        color: "green"
    }

    Item {
        id: currentInformations
        anchors.top: parent.top
        anchors.topMargin: 0.5 * parent.height + middleBar.height / 2
        anchors.right: parent.right
        width: parent.width
        height: 0.5 * parent.height - 1.5 * middleBar.height

        GridLayout {
            anchors.fill: parent
            rows: 2
            columns: 3

            Item {
                Layout.fillHeight: true
                Layout.fillWidth: true

                Text {
                    id: titlePressure
                    anchors.top: parent.top
                    anchors.topMargin: 0.05 * parent.height
                    anchors.horizontalCenter: parent.horizontalCenter
                    font.pixelSize: 19
                    color: "green"
                    text: "Pressure (hPa)"
                }

                Text {
                    anchors.top: parent.top
                    anchors.topMargin: (parent.height - titlePressure.anchors.topMargin + titlePressure.paintedHeight - paintedHeight) / 2
                    anchors.horizontalCenter: parent.horizontalCenter
                    font.family: fontStgs.digital7FontName
                    font.pixelSize: 43
                    color: "green"
                    text: informations.pressures[6].toPrecision(5)
                }
            }

            Item {
                Layout.fillHeight: true
                Layout.fillWidth: true

                Text {
                    id: titleSunrise
                    anchors.top: parent.top
                    anchors.topMargin: 0.05 * parent.height
                    anchors.horizontalCenter: parent.horizontalCenter
                    font.pixelSize: 19
                    color: "green"
                    text: "Sunrise (hh:mm)"
                }

                Text {
                    anchors.top: parent.top
                    anchors.topMargin: (parent.height - titleSunrise.anchors.topMargin + titleSunrise.paintedHeight - paintedHeight) / 2
                    anchors.horizontalCenter: parent.horizontalCenter
                    font.pixelSize: 53
                    font.family: fontStgs.digital7FontName
                    color: "green"
                    text: informations.currentSunrise
                }
            }

            Item {
                Layout.fillHeight: true
                Layout.fillWidth: true

                Text {
                    id: titleInsideTemp
                    anchors.top: parent.top
                    anchors.topMargin: 0.05 * parent.height
                    anchors.horizontalCenter: parent.horizontalCenter
                    font.pixelSize: 19
                    color: "green"
                    text: "Inside temperature (°C)"
                }

                Text {
                    anchors.top: parent.top
                    anchors.topMargin: (parent.height - titleInsideTemp.anchors.topMargin + titleInsideTemp.paintedHeight - paintedHeight) / 2
                    anchors.horizontalCenter: parent.horizontalCenter
                    font.family: fontStgs.digital7FontName
                    font.pixelSize: 43
                    color: "green"
                    text: informations.temperatures[6].toPrecision(5)
                }
            }

            Item {
                Layout.fillHeight: true
                Layout.fillWidth: true

                Text {
                    id: titleHumidity
                    anchors.top: parent.top
                    anchors.topMargin: 0.05 * parent.height
                    anchors.horizontalCenter: parent.horizontalCenter
                    font.pixelSize: 19
                    color: "green"
                    text: "Humidity (%)"
                }

                Text {
                    anchors.top: parent.top
                    anchors.topMargin: (parent.height - titleHumidity.anchors.topMargin + titleHumidity.paintedHeight - paintedHeight) / 2
                    anchors.horizontalCenter: parent.horizontalCenter
                    font.family: fontStgs.digital7FontName
                    font.pixelSize: 43
                    color: "green"
                    text: informations.humidities[6].toPrecision(4)
                }
            }

            Item {
                Layout.fillHeight: true
                Layout.fillWidth: true

                Text {
                    id: titleSunset
                    anchors.top: parent.top
                    anchors.topMargin: 0.05 * parent.height
                    anchors.horizontalCenter: parent.horizontalCenter
                    font.pixelSize: 19
                    color: "green"
                    text: "Sunset (hh:mm)"
                }

                Text {
                    anchors.top: parent.top
                    anchors.topMargin: (parent.height - titleSunset.anchors.topMargin + titleSunset.paintedHeight - paintedHeight) / 2
                    anchors.horizontalCenter: parent.horizontalCenter
                    font.family: fontStgs.digital7FontName
                    font.pixelSize: 53
                    color: "green"
                    text: informations.currentSunset
                }
            }

            Item {
                Layout.fillHeight: true
                Layout.fillWidth: true

                Text {
                    id: titleOutsideTemp
                    anchors.top: parent.top
                    anchors.topMargin: 0.05 * parent.height
                    anchors.horizontalCenter: parent.horizontalCenter
                    font.pixelSize: 19
                    color: "green"
                    text: "Outside temperature (°C)"
                }

                Text {
                    anchors.top: parent.top
                    anchors.topMargin: (parent.height - titleOutsideTemp.anchors.topMargin + titleOutsideTemp.paintedHeight - paintedHeight) / 2
                    anchors.horizontalCenter: parent.horizontalCenter
                    font.family: fontStgs.digital7FontName
                    font.pixelSize: 43
                    color: "green"
                    text: informations.outdoorTemperature.toPrecision(5)
                }
            }
        }

    }

    Rectangle {
        id: bottomBar
        anchors.bottom: parent.bottom
        width: parent.width
        height: 3
        color: "green"
    }
}
