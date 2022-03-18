import QtQuick 2.15
import QtQuick.Controls 2.15


import "../MyColor"

/*
  mode 0 : add
  mode 1 : board select wait
  mode 2 : board select ok
*/

Item {
    width: 200
    height: 100


    property var index : setIndex
    property var mode : setMode
    property var selected : setSelected


    signal groupAddSignal()
    signal selectSignal(var myIndex)

    Component.onCompleted:{
        console.log("index : " + index)
    }

    Rectangle {
        id: rectangle
        color: MyColors.buttonMainColor
        radius: 10
        anchors.fill: parent

        Text {
            id: text1
            color: MyColors.textMainColor
            text: qsTr("+")
            visible : (mode === 0)? true:false
            anchors.verticalCenter: parent.verticalCenter
            font.pixelSize: 50
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            anchors.verticalCenterOffset: -5
            anchors.horizontalCenter: parent.horizontalCenter
            font.family: "HelveticaRounded-Black"
        }

        Text {
            id: groupText
            y: parent.height /3 -10
            color: MyColors.textMainColor
            text: qsTr("Group ")
            visible : (mode >= 1)? true:false
            font.pixelSize: 16
            anchors.horizontalCenter: parent.horizontalCenter
            font.family: "HelveticaRounded"
        }

        Text {
            id: boardTypeText
            y: parent.height /3*2 -10
            color: MyColors.textMainColor
            text: qsTr("BASE BOARD")
            visible : (mode >= 2)? true:false
            font.pixelSize: 12
            anchors.horizontalCenterOffset: 0
            font.family: "Helvetica-Light"
            anchors.horizontalCenter: parent.horizontalCenter
        }

        MouseArea{
            anchors.fill: parent
            hoverEnabled: true

            onEntered: {
                rectangle.color = MyColors.buttonHoverColor
            }
            onExited: {
                rectangle.color = MyColors.buttonMainColor
            }
            onPressed: {
                rectangle.color = MyColors.buttonPressedColor
            }
            onReleased: {
                rectangle.color = MyColors.buttonHoverColor
            }
            onClicked: {
                if(mode === 0)
                {
                    mode = 1
                    selected = 1
                    console.log("group add")
                    groupAddSignal()
                }
                else if(mode === 1)
                {
                    selectSignal(index)
                }
            }
        }
    }
}

/*##^##
Designer {
    D{i:0;formeditorZoom:2}D{i:2}D{i:3}D{i:4}D{i:1}
}
##^##*/
