import QtQuick 2.11
import QtQuick.Controls 2.4
import QtQuick.Layouts 1.3
import QtCharts 2.2
import QtGraphicalEffects 1.0

Item {
    property var timerUpdate: updateChartviews
    property int chartViewIndex: 0
    anchors.bottom: parent.bottom
    anchors.right: parent.right
    width: 0.75 * parent.width
    height: 0.5 * parent.height

    Rectangle {
        anchors.top: parent.top
        anchors.topMargin: 0.05 * parent.height
        anchors.left: parent.left
        width: 0.5 * parent.width
        height: 0.9 * parent.height
        color: "transparent"

        GridLayout {
            anchors.fill: parent
            columns: 7
            rows: 6

            Repeater {
                model: informations.currentWeek

                Item {
                    Layout.fillWidth: true
                    Layout.fillHeight: true

                    Text {
                        anchors.centerIn: parent
                        font.pixelSize: 19
                        color: "green"
                        text: modelData
                    }
                }
            }

            Repeater {
                model: informations.climates

                Item {
                    Layout.fillWidth: true
                    Layout.fillHeight: true

                    Image {
                        source: {
                            switch(modelData) {
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
                        sourceSize.width: parent.width
                        sourceSize.height: parent.height

                        ColorOverlay {
                            anchors.fill: parent
                            source: parent
                            color: {
                                switch(modelData) {
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
            }

            Repeater {
                model: informations.temperatures

                Item {
                    Layout.fillWidth: true
                    Layout.fillHeight: true

                    Column {
                        anchors.centerIn: parent

                        Text {
                            anchors.horizontalCenter: parent.horizontalCenter
                            font.family: fontStgs.digital7FontName
                            font.pixelSize: 23
                            color: "green"
                            text: modelData.toPrecision(5)
                        }

                        Text {
                            anchors.horizontalCenter: parent.horizontalCenter
                            font.pixelSize: 15
                            color: "green"
                            text: " °C"
                        }
                    }
                }
            }

            Repeater {
                model: informations.humidities

                Item {
                    Layout.fillWidth: true
                    Layout.fillHeight: true

                    Column {
                        anchors.centerIn: parent

                        Text {
                            anchors.horizontalCenter: parent.horizontalCenter
                            font.family: fontStgs.digital7FontName
                            font.pixelSize: 23
                            color: "green"
                            text: modelData.toPrecision(4)
                        }

                        Text {
                            anchors.horizontalCenter: parent.horizontalCenter
                            font.pixelSize: 15
                            color: "green"
                            text: " %"
                        }
                    }
                }
            }

            Repeater {
                model: informations.windVelocities

                Item {
                    Layout.fillWidth: true
                    Layout.fillHeight: true

                    Column {
                        anchors.centerIn: parent

                        Text {
                            anchors.horizontalCenter: parent.horizontalCenter
                            font.family: fontStgs.digital7FontName
                            font.pixelSize: 23
                            color: "green"
                            text: modelData.toPrecision(4)
                        }

                        Text {
                            anchors.horizontalCenter: parent.horizontalCenter
                            font.pixelSize: 15
                            color: "green"
                            text: " km/h"
                        }
                    }
                }
            }

            Repeater {
                model: informations.pressures

                Item {
                    Layout.fillWidth: true
                    Layout.fillHeight: true

                    Column {
                        anchors.centerIn: parent

                        Text {
                            anchors.horizontalCenter: parent.horizontalCenter
                            font.family: fontStgs.digital7FontName
                            font.pixelSize: 23
                            color: "green"
                            text: modelData.toPrecision(5)
                        }

                        Text {
                            anchors.horizontalCenter: parent.horizontalCenter
                            font.pixelSize: 15
                            color: "green"
                            text: " hPa"
                        }
                    }
                }
            }
        }
    }

    Item {
        anchors.verticalCenter: parent.verticalCenter
        anchors.right: parent.right
        anchors.rightMargin: 0.01 * parent.width
        width: 0.5 * parent.width
        height: 0.8 * parent.height

        ChartView {
            id: cvWindVelocities
            anchors.fill: parent
            antialiasing: true
            legend { visible: false }
            margins { top: 7; bottom: 13; left: 7; right: 7 }
            backgroundColor: "transparent"

            BarSeries {
                axisX: BarCategoryAxis {
                    labelsColor: "green"
                    labelsAngle: 45
                    categories: informations.currentWeek
                }

                axisY: ValueAxis {
                    labelsColor: "green"
                    min: {
                        switch(chartViewIndex) {
                        case 0:
                            return -20
                        case 1:
                            return 0
                        case 2:
                            return 0
                        case 3:
                            return 900
                        }
                    }
                    max: {
                        switch(chartViewIndex) {
                        case 0:
                            return 50
                        case 1:
                            return 100
                        case 2:
                            return 150
                        case 3:
                            return 1300
                        }
                    }
                }

                BarSet {
                    color: {
                        switch(chartViewIndex) {
                        case 0:
                            return "orange"
                        case 1:
                            return "cornflowerblue"
                        case 2:
                            return "white"
                        case 3:
                            return "grey"
                        }
                    }
                    values: {
                        switch(chartViewIndex) {
                        case 0:
                            return informations.temperatures
                        case 1:
                            return informations.humidities
                        case 2:
                            return informations.windVelocities
                        case 3:
                            return informations.pressures
                        }
                    }
                }
            }
        }

        Text {
            anchors.bottom: parent.bottom
            anchors.horizontalCenter: parent.horizontalCenter
            color: {
                switch(chartViewIndex) {
                case 0:
                    return "orange"
                case 1:
                    return "cornflowerblue"
                case 2:
                    return "white"
                case 3:
                    return "grey"
                }
            }
            text: {
                switch(chartViewIndex) {
                case 0:
                    return "Temperature (°C)"
                case 1:
                    return "Humidities (%)"
                case 2:
                    return "Wind velocities (km/h)"
                case 3:
                    return "Pressures (hPa)"
                }
            }
        }
    }

    Timer {
        id: updateChartviews
        interval: 3000
        running: false
        repeat: true
        onTriggered: {
            switch(chartViewIndex) {
            case 0:
                chartViewIndex = 1
                break
            case 1:
                chartViewIndex = 2
                break
            case 2:
                chartViewIndex = 3
                break
            case 3:
                chartViewIndex = 0
                break
            }
        }
    }
}
