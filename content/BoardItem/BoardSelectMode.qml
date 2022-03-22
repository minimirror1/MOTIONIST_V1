import QtQuick 2.15
import QtQuick.Controls 2.15

import "."
import "../MyColor"

Item {
    id: item1
    width: 1280
    height: 720

    Row {
        id: row1
        height: 400
        anchors.verticalCenter: parent.verticalCenter
        anchors.left: parent.left
        anchors.right: parent.right
        spacing: (row1.width-(1*4))/4

        Rectangle {
            id: rectangle
            width: 1
            height: 300
            color: "#00bfbfbf"
            anchors.verticalCenter: parent.verticalCenter
        }

        Rectangle {
            id: rectangle1
            width: 1
            height: 300
            color: "#d1cdc8"
            anchors.verticalCenter: parent.verticalCenter
        }

        Rectangle {
            id: rectangle2
            width:rectangle1.width+1
            height: rectangle1.height
            color: rectangle1.color
            anchors.verticalCenter: parent.verticalCenter
        }

        Rectangle {
            id: rectangle3
            width:rectangle1.width
            height: rectangle1.height
            color: rectangle1.color
            anchors.verticalCenter: parent.verticalCenter
        }

        Rectangle {
            id: rectangle4
            width:rectangle.width
            height: rectangle.height
            color: rectangle.color
            anchors.verticalCenter: parent.verticalCenter
        }

    }

    function btnClickedSlot(num){
        console.log("모드선택 : " + num)
        mode = num
    }

    Row {
        id: row
        height: 400
        anchors.verticalCenter: parent.verticalCenter
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.leftMargin: 50
        anchors.rightMargin: 50
        spacing: (row.width-(170*4))/3

        BoardSelectModeBtn{
            anchors.verticalCenter: parent.verticalCenter
            btnImg.source: "../images/Board/BASE.png"
            btnImg_on.source: "../images/Board/BASE_on.png"
            btnImg_pre.source: "../images/Board/BASE_pre.png"
            text1.text : qsTr("BASE BOARD")
            text2.text : qsTr(" ")

            btnNum : 2

            Component.onCompleted :{
                btnClick.connect(btnClickedSlot)
            }
        }

        BoardSelectModeBtn {
            anchors.verticalCenter: parent.verticalCenter
            btnImg.source: "../images/Board/RC.png"
            btnImg_on.source: "../images/Board/RC_on.png"
            btnImg_pre.source: "../images/Board/RC_pre.png"
            text1.text : qsTr("RC BOARD")
            text2.text : qsTr(" ")

            btnNum : 3

            Component.onCompleted :{
                btnClick.connect(btnClickedSlot)
            }
        }

        BoardSelectModeBtn {
            anchors.verticalCenter: parent.verticalCenter
            btnImg.source: "../images/Board/DY.png"
            btnImg_on.source: "../images/Board/DY_on.png"
            btnImg_pre.source: "../images/Board/DY_pre.png"
            text1.text : qsTr("DYNAMIC CELL BOARD")
            text2.text : qsTr("TTL")

            btnNum : 4

            Component.onCompleted :{
                btnClick.connect(btnClickedSlot)
            }
        }

        BoardSelectModeBtn {
            anchors.verticalCenter: parent.verticalCenter
            btnImg.source: "../images/Board/DY.png"
            btnImg_on.source: "../images/Board/DY_on.png"
            btnImg_pre.source: "../images/Board/DY_pre.png"
            text1.text : qsTr("DYNAMIC CELL BOARD")
            text2.text : qsTr("RS-485")

            btnNum : 5

            Component.onCompleted :{
                btnClick.connect(btnClickedSlot)
            }
        }
    }

    Text {
        id: text1
        color : MyColors.textMainColor
        text: qsTr("SELECT BOARD TYPE")
        anchors.top: parent.top
        font.pixelSize: 36
        horizontalAlignment: Text.AlignHCenter
        style: Text.Outline
        layer.smooth: true
        font.family: "HelveticaRounded-Black"
        anchors.topMargin: 50
        anchors.horizontalCenter: parent.horizontalCenter
    }

}
