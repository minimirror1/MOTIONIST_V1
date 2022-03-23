import QtQuick 2.15
import QtQuick.Controls 2.15

import "../MyColor"
Item {
    id: item3
    width: 1280
    height: 144

    Item {
        id: item1
        width: 300
        height: back.height
        anchors.left: parent.left
        anchors.top: parent.top
        anchors.topMargin: 0
        anchors.leftMargin: 0

        property color textColor : MyColors.textMainColor

        Image {
            id: back
            anchors.verticalCenter: parent.verticalCenter
            anchors.left: parent.left
            source: "../images/Board/Base/back.png"
            anchors.leftMargin: 10
            fillMode: Image.PreserveAspectFit
        }

        Text {
            id: text2
            color : parent.textColor
            text: qsTr("Select Board Type")
            anchors.left: back.right
            anchors.top: parent.top
            anchors.bottom: parent.bottom
            font.pixelSize: 16
            horizontalAlignment: Text.AlignLeft
            verticalAlignment: Text.AlignVCenter
            anchors.leftMargin: 10 + offset
            anchors.topMargin: 0
            property int offset : 0
        }

        MouseArea{
            anchors.fill: parent
            hoverEnabled: true
            onEntered: {
                back.source = "../images/Board/Base/back_on.png"
                text2.color = MyColors.textHoverColor_pink
            }
            onExited: {
                back.source = "../images/Board/Base/back.png"
                text2.color = parent.textColor
            }
            onPressed: {
                back.source = "../images/Board/Base/back_pre.png"
                text2.color = MyColors.textPressedColor_pink

                text2.offset = 2
            }
            onReleased: {
                if(containsMouse )
                {
                    back.source = "../images/Board/Base/back_on.png"
                    text2.color = MyColors.textHoverColor_pink
                }
                else
                {
                    back.source = "../images/Board/Base/back.png"
                    text2.color = parent.textColor
                }
                text2.offset = 0
            }
            onClicked: {
                mode = 1
            }
        }
    }

    Item {
        id: item4
        width: 150
        height: save.height
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.topMargin: 0

        property color textColor : MyColors.textMainColor

        Image {
            id: save
            x: 20
            anchors.verticalCenter: parent.verticalCenter
            anchors.right: text4.left
            source: "../images/Board/Base/save.png"
            anchors.rightMargin: 10
            fillMode: Image.PreserveAspectFit
        }

        Text {
            id: text4
            color : parent.textColor
            text: qsTr("Save")
            anchors.right: parent.right
            anchors.top: parent.top
            anchors.bottom: parent.bottom
            font.pixelSize: 16
            horizontalAlignment: Text.AlignLeft
            verticalAlignment: Text.AlignVCenter
            anchors.rightMargin: 20 - offset
            anchors.topMargin: 0
            property int offset : 0
        }

        MouseArea{
            anchors.fill: parent
            hoverEnabled: true
            onEntered: {
                save.source = "../images/Board/Base/save_on.png"
                text4.color = MyColors.textHoverColor_green
            }
            onExited: {
                save.source = "../images/Board/Base/save.png"
                text4.color = parent.textColor
            }
            onPressed: {
                save.source = "../images/Board/Base/save_pre.png"
                text4.color = MyColors.textPressedColor_green
                text4.offset = 2
            }
            onReleased: {
                if(containsMouse ){
                    save.source = "../images/Board/Base/save_on.png"
                    text4.color = MyColors.textHoverColor_green
                }
                else{
                    save.source = "../images/Board/Base/save.png"
                    text4.color = parent.textColor
                }
                text4.offset = 0
            }
        }


    }

    Text {
        id: boardTypeText
        color : MyColors.textMainColor
        text: qsTr("BOARD TYPE")
        anchors.verticalCenter: item1.verticalCenter
        font.pixelSize: 30
        anchors.horizontalCenter: parent.horizontalCenter


        Component.onCompleted:{
            text = Qt.binding(function(){
                if(mode === 2)
                    return qsTr("BASE BOARD")
                else if(mode === 3)
                    return qsTr("RC BOARD")
                else if(mode === 4)
                    return qsTr("DYNAMIC CELL TTL BOARD")
                else if(mode === 5)
                    return qsTr("DYNAMIC CELL 485 BOARD")
                else
                    return qsTr(" ")
            })
        }
    }

    Text {
        id: groupNumText
        color : MyColors.textMainColor
        text: qsTr("Group 0")
        anchors.bottom: groupNameText.top
        font.pixelSize: 30
        anchors.bottomMargin: 10
        font.family: "HelveticaRounded"
        anchors.horizontalCenterOffset: 0
        anchors.horizontalCenter: parent.horizontalCenter
    }

    TextInput {
        id: groupNameText
        y: 106
        width: 200
        height: 30
        color : MyColors.textMainColor
        text: qsTr("Text Input")
        anchors.bottom: parent.bottom
        font.pixelSize: 26
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        anchors.bottomMargin: 10
        cursorVisible: true
        anchors.horizontalCenter: parent.horizontalCenter
    }

    Item {
        id: item2
        x: 518
        width: minus.width
        height: minus.height
        anchors.verticalCenter: groupNumText.verticalCenter
        anchors.right: groupNumText.left
        anchors.rightMargin: 30

        Image {
            id: minus
            anchors.verticalCenter: parent.verticalCenter
            source: "../images/Board/Base/minus.png"
            anchors.horizontalCenter: parent.horizontalCenter
            fillMode: Image.PreserveAspectFit
        }

        MouseArea{
            anchors.fill: parent
            hoverEnabled: true
            onEntered: {
                minus.source = "../images/Board/Base/minus_on.png"
            }
            onExited: {
                minus.source = "../images/Board/Base/minus.png"
            }
            onPressed: {
                minus.source = "../images/Board/Base/minus_pre.png"
            }
            onReleased: {
                if(containsMouse )
                    minus.source = "../images/Board/Base/minus_on.png"
                else
                    minus.source = "../images/Board/Base/minus.png"
            }
        }
    }

    Item {
        id: item5
        width: add.width
        height: add.height
        anchors.verticalCenter: groupNumText.verticalCenter
        anchors.left: groupNumText.right
        anchors.leftMargin: 30

        Image {
            id: add
            anchors.verticalCenter: parent.verticalCenter
            source: "../images/Board/Base/add.png"
            anchors.horizontalCenter: parent.horizontalCenter
            fillMode: Image.PreserveAspectFit
        }
        MouseArea{
            anchors.fill: parent
            hoverEnabled: true
            onEntered: {
                add.source = "../images/Board/Base/add_on.png"
            }
            onExited: {
                add.source = "../images/Board/Base/add.png"
            }
            onPressed: {
                add.source = "../images/Board/Base/add_pre.png"
            }
            onReleased: {
                if(containsMouse )
                    add.source = "../images/Board/Base/add_on.png"
                else
                    add.source = "../images/Board/Base/add.png"
            }
        }
    }
}

/*##^##
Designer {
    D{i:0;formeditorZoom:0.75}D{i:2}D{i:3}D{i:1}D{i:6}D{i:5}D{i:9}D{i:10}D{i:11}D{i:13}
D{i:12}D{i:16}D{i:15}
}
##^##*/