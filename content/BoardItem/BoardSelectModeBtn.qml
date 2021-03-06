import QtQuick 2.15
import QtQuick.Controls 2.15

import "../MyColor"
import Qt5Compat.GraphicalEffects 6.0

Item {
    id: item1
    width: 170
    height: 250
    property alias btnImg: btnImg
    property alias btnImg_on: btnImg_on
    property alias btnImg_pre: btnImg_pre

    property alias text1: text1//text1
    property alias text2: text2//text2

    property color textColor : MyColors.textMainColor

    property int btnNum



    signal btnClick(int num)


//    DropShadow {
//            anchors.fill: item1
//            source: item1
//            horizontalOffset: 2
//            verticalOffset: 2
//            color: "#000000"//"#80000000"
//            radius: 1
//     }

    Image {
        id: btnImg
        width: 136
        source: "../images/Board/BASE.png"
        anchors.topMargin: 50
        anchors.horizontalCenter: parent.horizontalCenter
//        sourceSize.width: btnImg.width * 2/3
//        sourceSize.height: btnImg.height * 2/3
        fillMode: Image.PreserveAspectFit
        visible: true
        anchors.top: parent.top
    }
    Image {
        id: btnImg_on
        width: 136
        source: "../images/Board/BASE_on.png"
        anchors.topMargin: 50
        anchors.horizontalCenter: parent.horizontalCenter
        fillMode: Image.PreserveAspectFit
        visible: false
        anchors.top: parent.top
    }
    Image{
        id: btnImg_pre
        width: 136
        source: "../images/Board/BASE_pre.png"
        anchors.topMargin: 50
        anchors.horizontalCenter: parent.horizontalCenter
        fillMode: Image.PreserveAspectFit
        visible: false
        anchors.top: parent.top
    }

    Text {
        id: text1
        x: 0
        color: textColor
        text: qsTr("Text")
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: parent.top
        font.pixelSize: 16
        horizontalAlignment: Text.AlignHCenter
        styleColor: MyColors.textOutlineColor
        layer.smooth: true
        anchors.topMargin: 170
        style: Text.Outline
        font.family: "HelveticaRounded"
    }

    Text {
        id: text2
        x: 9
        color: textColor
        text: qsTr("Text")
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: text1.bottom
        font.pixelSize: 16
        horizontalAlignment: Text.AlignHCenter
        styleColor: MyColors.textOutlineColor
        layer.smooth: true
        anchors.topMargin: 5
        style: Text.Outline
        font.family: "HelveticaRounded"
    }

    MouseArea{
        id: mouseArea
        anchors.fill: parent

        property bool mouseEvent : true

        hoverEnabled: mouseEvent

        Component.onCompleted: {
            mouseEvent = Qt.binding(function(){
            if(pathView.currentIndex === index)
                return true
            else
                return false
            })
        }


        onEntered: {
            btnImg.visible = false
            btnImg_on.visible = true
            btnImg_pre.visible = false
            textColor = MyColors.textHoverColor
        }
        onExited: {
            btnImg.visible = true
            btnImg_on.visible = false
            btnImg_pre.visible = false
            textColor = MyColors.textMainColor
        }
        onPressed: {
            btnImg.visible = false
            btnImg_on.visible = false
            btnImg_pre.visible = true
            textColor = MyColors.textPressedColor

        }
        onReleased: {
            btnImg.visible = true
            btnImg_on.visible = false
            btnImg_pre.visible = false
            textColor = MyColors.textMainColor
        }
        onClicked: {
            if(mouseEvent)
                btnClick(btnNum)
        }
    }


}

/*##^##
Designer {
    D{i:0;formeditorZoom:2}
}
##^##*/
