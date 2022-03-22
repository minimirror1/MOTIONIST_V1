import QtQuick 2.15
import QtQuick.Controls 2.15

import "./MyColor"

Item {
    width: 1920
    height: 60

    Rectangle {
        id: rectangle
        color: MyColors.bgColor
        anchors.fill: parent

        Text {
            id: text1
            width: 520
            color: "#c4c4c4"
            text: qsTr("MOTIONIST")
            anchors.left: parent.left
            anchors.top: parent.top
            anchors.bottom: parent.bottom
            font.pixelSize: 41
            verticalAlignment: Text.AlignVCenter
            font.family: "HelveticaRounded"
            leftPadding: 30
            font.bold: true
        }
    }

    property int previousX
    property int previousY

    MouseArea {
        anchors {
            top: parent.top
            bottom: parent.bottom
            left: parent.left
            right: parent.right
        }

        onPressed: {
            previousX = mouseX
            previousY = mouseY
        }

        onMouseXChanged: {
            var dx = mouseX - previousX
            mainWindow.setX(mainWindow.x + dx)
        }

        onMouseYChanged: {
            var dy = mouseY - previousY
            mainWindow.setY(mainWindow.y + dy)
        }
    }

    Button {
        id: button
        anchors.right: parent.right
        x: 1837
        y: 6
        text: qsTr("x")
        onClicked: {
            mainWindow.close()
        }
    }
}

/*##^##
Designer {
    D{i:0;formeditorZoom:0.33}D{i:2}D{i:1}
}
##^##*/
