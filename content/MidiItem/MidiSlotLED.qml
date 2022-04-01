import QtQuick 2.15
import QtQuick.Controls 2.15

Item {
    id: item1
    width: 150
    height: 550

    Image {
        id: bar_led
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        source: "../images/Midi/bar_led.png"
        anchors.rightMargin: 100
        anchors.bottomMargin: 22
        anchors.leftMargin: 20
        anchors.topMargin: 278
        fillMode: Image.PreserveAspectFit
    }

    Image {
        id: rot_led
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        source: "../images/Midi/rot_led.png"
        anchors.rightMargin: 0
        anchors.leftMargin: 0
        anchors.bottomMargin: 400
        anchors.topMargin: 0
        fillMode: Image.PreserveAspectFit
    }

    Image {
        id: screen_led
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        source: "../images/Midi/screen_led.png"
        anchors.bottomMargin: 289
        anchors.rightMargin: -25
        anchors.leftMargin: -26
        anchors.topMargin: 141
        fillMode: Image.PreserveAspectFit
    }

}
