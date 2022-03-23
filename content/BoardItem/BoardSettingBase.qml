import QtQuick 2.15
import QtQuick.Controls 2.15

import "."
Item {
    id: item1
    width: 1280
    height: 720

    BoardSettingTitle {
        id: boardSettingTitle
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.topMargin: 20
        anchors.rightMargin: 20
        anchors.leftMargin: 20
    }

    Item {
        id: item2
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: boardSettingTitle.bottom
        anchors.bottom: parent.bottom

        BoardSettingBaseListBox {
            id: boardSettingBaseListBox
            y: 35
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.rightMargin: 20
            anchors.leftMargin: 20
        }
    }


}

/*##^##
Designer {
    D{i:0;formeditorZoom:0.66}D{i:1}D{i:3}D{i:2}
}
##^##*/
