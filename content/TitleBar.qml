import QtQuick 2.15
import QtQuick.Controls 2.15

import "./MyColor"
Item {
    id: item1
    width: 1920
    height: 40

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
            font.pixelSize: 26
            verticalAlignment: Text.AlignVCenter
            font.family: "GentleMonster"
            leftPadding: 10
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

//    Button {
//        id: button
//        anchors.right: parent.right
//        anchors.rightMargin: 75
//        x: 1781
//        y: 0
//        text: qsTr("x")
//        onClicked: {
//            mainWindow.close()
//        }
//    }

    Image {
        id: exitBtn
        anchors.right: parent.right
        anchors.top: parent.top
        width: 30
        source: "images/Home/x.png"
        anchors.rightMargin: 5
        anchors.topMargin: 5
        fillMode: Image.PreserveAspectFit

        MouseArea{
            anchors.fill : parent
            hoverEnabled: true

            onEntered: {
                exitBtn.source = "images/Home/x_hover.png"
            }
            onExited: {
                exitBtn.source = "images/Home/x.png"
            }
            onClicked: {
                mainWindow.close()
            }
        }
    }
}



/*##^##
Designer {
    D{i:0;formeditorZoom:1.66}D{i:4}
}
##^##*/
