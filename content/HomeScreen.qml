import QtQuick 2.15
import QtQuick.Controls 2.15

//import "MyColor.qml"
import "HomeItem"
import "./MyColor"

Item {
    width: 1920
    height: 1080 - 120

    Rectangle {
        id: rectangle
        color: MyColors.bgColor
        anchors.fill: parent

        Row {
            id: row
            y: 270
            height: 500
            anchors.left: parent.left
            anchors.right: parent.right
            spacing: 100
            anchors.rightMargin: 300
            anchors.leftMargin: 300

            HomeButton {
                id: newProjectButton
                text1.text : qsTr("NEW")
                text2.text : qsTr("PROJCET")
                image.source: "../images/Home/newproject.png"
                image_on.source: "../images/Home/newproject_on.png"
            }

            HomeButton {
                id: openProjectButton
                text1.text : qsTr("OPEN")
                text2.text : qsTr("PROJCET")
                image.source: "../images/Home/openproject.png"
                image_on.source: "../images/Home/openproject_on.png"
            }

            HomeButton {
                id: settingButton
                text1.text : qsTr("SETTING")
                text2.text : qsTr(" ")
                image.source: "../images/Home/setting.png"
                image_on.source: "../images/Home/setting_on.png"
            }

            HomeButton {
                id: eManualButton
                text1.text : qsTr("e-MANUAL")
                text2.text : qsTr(" ")
                image.source: "../images/Home/emanual.png"
                image_on.source: "../images/Home/emanual_on.png"
            }
        }
    }


}

/*##^##
Designer {
    D{i:0;formeditorZoom:0.5}
}
##^##*/
