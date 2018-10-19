import QtQuick 2.11
import QtQuick.Controls 2.4
import QtQuick.Window 2.11
import "./Custom"

Window {
    id: wdwSplashScreen
    flags: Qt.SplashScreen
    x: (Screen.width - imgSplashScreen.width) / 2
    y: (Screen.height - imgSplashScreen.height) / 2
    width: imgSplashScreen.width
    height: imgSplashScreen.height + 1.5 * ctmProgBar.height

    Image {
        id: imgSplashScreen
        source: "./Images/Splashscreen.png"
    }

    Timer {
        id: timSplashScreen
//        interval: 0
        interval: 3100
        running: true
        repeat: false
        onTriggered: {
            wdwSplashScreen.visible = false
            mainWindow.visible = true
            week.timerUpdate.running = true
        }
    }

    Timer {
        id: timProgBar
        interval: 30
        running: true
        repeat: true
        onTriggered: {
            ctmProgBar.value += 1
        }
    }

    CustomProgressBar {
        id: ctmProgBar
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 0.25 * height
        anchors.horizontalCenter: parent.horizontalCenter
        height: 17
        width: 0.7 * imgSplashScreen.width
        from: 0
        to: 100
    }

    Component.onCompleted: visible = true
}
