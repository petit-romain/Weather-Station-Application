import QtQuick 2.11
import QtQuick.Controls 2.4
import QtQuick.Layouts 1.3
import QtQuick.Window 2.11
import QtGraphicalEffects 1.0
import "./Fonts"

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
        color: "black"

        FontSettings { id: fontStgs }

        RainfallWind { id: rainFallWind }

        Current { id: current }

        Week { id: week }
    }
}
