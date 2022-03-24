import QtQuick 2.15
import QtQuick.Controls 2.15

Item {
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
        id: item1
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: boardSettingTitle.bottom
        anchors.bottom: parent.bottom

        GridView {
            id: gridView
            anchors.fill: parent
            flow: GridView.FlowTopToBottom
            keyNavigationWraps: false
            anchors.rightMargin: 20
            anchors.leftMargin: 20
            anchors.bottomMargin: 20
            anchors.topMargin: 20
            delegate: Item {
                x: 5
                height: 50
                Column {
                    spacing: 5
                    Rectangle {
                        width: 40
                        height: 40
                        color: colorCode
                        anchors.horizontalCenter: parent.horizontalCenter
                    }

                    Text {
                        x: 5
                        text: name
                        anchors.horizontalCenter: parent.horizontalCenter
                        font.bold: true
                    }
                }
            }
            cellWidth: 70
            cellHeight: 70
            model: ListModel {
                ListElement {
                    name: "Grey"
                    colorCode: "grey"
                }

                ListElement {
                    name: "Red"
                    colorCode: "red"
                }

                ListElement {
                    name: "Blue"
                    colorCode: "blue"
                }

                ListElement {
                    name: "Green"
                    colorCode: "green"
                }
            }
        }


    }

}