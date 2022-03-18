import QtQuick 2.15
import QtQuick.Controls 2.15

import "../MyColor"

Item {
    id: item1
    width: 250
    height: 500
    property alias image: image
    property alias image_on: image_on

    property alias text1: text1
    property alias text2: text2



    Rectangle {
        id: btn_bg1
        color: MyColors.bgColor
        radius: 5
        border.color: MyColors.buttonMainColor
        border.width: 1
        anchors.fill: parent
        anchors.leftMargin: 10
        anchors.topMargin: 10
        anchors.rightMargin: 0
        anchors.bottomMargin: 0
    }

    Rectangle {
        id: btn_bg
        color : MyColors.buttonMainColor
        radius: 5
        anchors.fill: parent
        anchors.bottomMargin: 10
        anchors.rightMargin: 10

        Text {
            id: text1
            y: 369
            width: 170
            height: 35
            color: MyColors.textMainColor
            text: qsTr("NEW ")
            font.pixelSize: 30
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            anchors.horizontalCenter: parent.horizontalCenter
            textFormat: Text.RichText
            font.family: "HelveticaRounded"
        }

        Text {
            id: text2
            y: 410
            width: 170
            height: 35
            color: MyColors.textMainColor
            text: qsTr("PROJECT")
            font.pixelSize: 30
            horizontalAlignment: Text.AlignHCenter
            anchors.horizontalCenterOffset: 0
            textFormat: Text.RichText
            font.family: "HelveticaRounded"
            anchors.horizontalCenter: parent.horizontalCenter
        }

        MouseArea{
            anchors.fill: parent
            hoverEnabled: true

            onEntered: {
                image.visible = false
                image_on.visible = true
                btn_bg.color = MyColors.buttonHoverColor
                text1.color = MyColors.textHoverColor
                text2.color = MyColors.textHoverColor

            }
            onExited: {
                image.visible = true
                image_on.visible = false
                btn_bg.color = MyColors.buttonMainColor
                text1.color = MyColors.textMainColor
                text2.color = MyColors.textMainColor
            }
            onPressed: {
                image.visible = true
                image_on.visible = false
                btn_bg.color = MyColors.buttonPressedColor
                text1.color = MyColors.textPressedColor
                text2.color = MyColors.textPressedColor
            }
            onReleased: {
                image.visible = false
                image_on.visible = true
                btn_bg.color = MyColors.buttonHoverColor
                text1.color = MyColors.textHoverColor
                text2.color = MyColors.textHoverColor
            }
        }
    }

    Image {
        id: image
        y: 129
        width: 100
        height: 100
        source: "../images/Home/openproject.png"
        anchors.horizontalCenter: parent.horizontalCenter
        fillMode: Image.PreserveAspectFit
    }


    Image {
        id: image_on
        y: 129
        width: 100
        height: 100
        source: "../images/Home/openproject_on.png"
        anchors.horizontalCenter: parent.horizontalCenter
        fillMode: Image.PreserveAspectFit
        visible: false
    }

}

/*##^##
Designer {
    D{i:0;formeditorZoom:1.33}D{i:1}D{i:3}D{i:4}D{i:2}D{i:6}
}
##^##*/
