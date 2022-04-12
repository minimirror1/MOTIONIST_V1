import QtQuick 2.15
import QtQuick.Controls 2.15

import "../MyColor"
import Qt5Compat.GraphicalEffects 6.0


Item {
    id: item1
    width: 250
    height: 500
    property alias mouseArea: mouseArea
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
        anchors.leftMargin: 5
        anchors.topMargin: 5
        anchors.rightMargin: 0
        anchors.bottomMargin: 0
    }

    Rectangle {
        id: btn_bg
        color : MyColors.buttonMainColor
        radius: 5
        anchors.fill: parent
        anchors.bottomMargin: 5
        anchors.rightMargin: 5





        Text {
            id: text1
            y: (text2.text === " ")? 317 :303
            width: 170
            height: 35
            color: MyColors.textMainColor
            text: qsTr("NEW ")
            font.pixelSize: 24
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            rightPadding: 0
            anchors.horizontalCenterOffset: 0
            anchors.horizontalCenter: parent.horizontalCenter
            textFormat: Text.RichText
            font.family: "HelveticaRounded"



        }
        DropShadow {
                anchors.fill: text1
                source: text1
                horizontalOffset: 2
                verticalOffset: 2
                color: "#000000"//"#80000000"
                radius: 1
         }


        Text {
            id: text2
            width: 170
            height: 35
            color: MyColors.textMainColor
            text: qsTr("PROJECT")
            anchors.top: text1.bottom
            font.pixelSize: 24
            horizontalAlignment: Text.AlignHCenter
            anchors.topMargin: -5
            rightPadding: 0
            anchors.horizontalCenterOffset: 0
            textFormat: Text.RichText
            font.family: "HelveticaRounded"
            anchors.horizontalCenter: parent.horizontalCenter

        }
        DropShadow {
                anchors.fill: text2
                source: text2
                horizontalOffset: 2
                verticalOffset: 2
                color: "#000000"//"#80000000"
                radius: 1
         }



        MouseArea{
            id: mouseArea
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
                image.visible = true
                image_on.visible = false
                btn_bg.color = MyColors.buttonMainColor
                text1.color = MyColors.textMainColor
                text2.color = MyColors.textMainColor
                /*
                btn_bg.color = MyColors.buttonHoverColor
                text1.color = MyColors.textHoverColor
                text2.color = MyColors.textHoverColor
                */
            }
        }

    }

    Image {
        id: image
        y: 130
        width: 80
        height: 80
        source: "../images/Home/openproject.png"
        anchors.horizontalCenter: parent.horizontalCenter
        fillMode: Image.PreserveAspectFit
    }


    Image {
        id: image_on
        y: image.y
        width: 80
        height: 80
        source: "../images/Home/openproject_on.png"
        anchors.horizontalCenterOffset: 0
        anchors.horizontalCenter: parent.horizontalCenter
        fillMode: Image.PreserveAspectFit
        visible: false
    }

}

/*##^##
Designer {
    D{i:0;formeditorZoom:0.75}
}
##^##*/
