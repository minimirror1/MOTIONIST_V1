import QtQuick 2.15
import QtQuick.Controls 2.15


import "../MyColor"

Item {
    id : midiAxisBox
    width: 200
    height: 50

    Image {
        id: axisboxShadow
        anchors.fill: parent
        source: "../images/Midi/axisboxShadow.png"
        fillMode: Image.PreserveAspectFit
    }

    Rectangle {
        id: rectangle
        color: MyColors.boxBgColor
        radius: 5
        anchors.fill: parent
        anchors.rightMargin: 8
        anchors.leftMargin: 8
        anchors.bottomMargin: 8
        anchors.topMargin: 8

        Text {
            id: text1
            width: 50
            color: "#ffffff"
            text: qsTr("1-10")
            anchors.left: parent.left
            anchors.top: parent.top
            anchors.bottom: parent.bottom
            font.pixelSize: 20
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            font.family: "HelveticaRounded-Black"
        }

        Text {
            id: text3
            color: "#ffffff"
            text: qsTr("AAAAAAAAAA")
            anchors.left: text1.right
            anchors.right: parent.right
            anchors.top: parent.top
            anchors.bottom: parent.bottom
            font.pixelSize: 15
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            anchors.topMargin: 0
            font.family: "HYGothic-Extra"
        }
    }




    function update()
    {
        //console.log(Math.round(x) + " x "+ Math.round(y))
        //mouseChangeXYsignal(midiAxisBox.x, midiAxisBox.y+100)

        mouseChangeXYsignal(midiAxisBox.x + dragMouse.mouseX, midiAxisBox.y+ dragMouse.mouseY+100)

        //mouseChangeXYsignal(dragMouse.mouse.x, dragMouse.mouse.y)//+100)
    }
    Component.onCompleted: update()
    onXChanged: update()
    onYChanged: update()

    MouseArea
    {
        id : dragMouse
        anchors.fill: parent
        drag.target: parent
        property real origenX
        property real origenY

        propagateComposedEvents  : true

        onPressed: {
            origenX = parent.x
            origenY = parent.y
        }
        onReleased: {
            parent.x = origenX
            parent.y = origenY
        }
    }


}

/*##^##
Designer {
    D{i:0;formeditorZoom:1.66}D{i:1}D{i:3}D{i:4}D{i:2}
}
##^##*/
