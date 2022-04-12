import QtQuick 2.15
import QtQuick.Controls 2.15

import "../MyColor"

Item {
    id: midiSlotText
    width: 95
    height: 72
    property alias text_id: text_id
    property alias text_name: text_name


    Text {
        id: text_id
        color : MyColors.textHoverColor
        text: qsTr("Text")
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: text_name.bottom
        anchors.bottom: parent.bottom
        font.pixelSize: 16
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        fontSizeMode: Text.FixedSize
    }


    //    MouseArea
    //    {
//        anchors.fill: parent
//        hoverEnabled : true
//        preventStealing : true
//        onEntered: {
//            text_id.color = MyColors.textMainColor
//        }
//        onExited: {
//            text_id.color = MyColors.textHoverColor
//        }
//        onPressed: {
//            console.log("owwowowow")
//        }
//    }

//    Rectangle
//    {
//        color: "#7300ff12"
//        border.color: "#000000"
//        anchors.fill: parent

//    }
    Text {
        id: text_name
        height: 36
        color : MyColors.textHoverColor
        text: qsTr("Textddddssssss")
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: parent.top
        font.pixelSize: 20
        fontSizeMode: Text.Fit
        minimumPixelSize: 10
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
    }
}

/*##^##
Designer {
    D{i:0;formeditorZoom:1.75}D{i:1}D{i:2}
}
##^##*/
