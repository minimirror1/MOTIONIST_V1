import QtQuick 2.15
import QtQuick.Controls 2.15

import "../MyColor"

Item {
    id: titleItem
    width: 1536
    height: 100

    function groupNumChange(order){


        if(order === 1)//plus
        {
            console.log("plus order")

            if(++currentGroupIndex >= setGroupIndex.length)
                currentGroupIndex = 0
        }
        else if(order === -1)
        {
            console.log("minus order")

            if(--currentGroupIndex < 1)
                currentGroupIndex = setGroupIndex.length - 1

        }
        groupId = modelGroup.get(setGroupIndex[currentGroupIndex]).groupId

        toggle = true

        currentModel = []
        currentModel = modelGroup.get(setGroupIndex[currentGroupIndex])
    }



    Item {
        id: item1
        width: parent.width/4
        anchors.left: parent.left
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        anchors.topMargin: 0
        anchors.bottomMargin: 0


        Text {
            id: groupNumText
            width: 100
            color : MyColors.textMainColor
            text: qsTr("Group ") + groupId
            anchors.verticalCenter: parent.verticalCenter
            //anchors.bottom: groupNameText.top
            font.pixelSize: 30
            horizontalAlignment: Text.AlignHCenter
            anchors.bottomMargin: 10
            font.family: "HelveticaRounded"
            anchors.horizontalCenterOffset: 0
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
                id: groupMinus
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
                onClicked: {
                    groupNumChange(-1)
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
                id: groupPlus
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
                onClicked: {
                    groupNumChange(1)
                }
            }
        }

    }

    Item {
        id: item8
        anchors.left: item1.right
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.bottom: parent.bottom

        TextInput {
            id: groupNameText
            width: 200
            height: 30
            color : MyColors.textMainColor
            text: (!findFlag)?" ": (currentModel.groupName.length===0)?" ":currentModel.groupName
            anchors.verticalCenter: parent.verticalCenter
            anchors.left: parent.left
            font.pixelSize: 26
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            anchors.leftMargin: isoMargin
            cursorVisible: true
            onActiveFocusChanged: {
                if(activeFocus)
                {
                    selectAll()
                }
                else
                {
                    currentModel.groupName = text
                }
            }
            Component.onCompleted: {

            }
        }
    }

    Rectangle {
        id: rectangle
        x: parent.width/4
        width: 1

        color: "#ffffff"
        anchors.top: parent.top
        anchors.bottom: parent.bottom
    }



}

/*##^##
Designer {
    D{i:0;formeditorZoom:1.25}D{i:1}D{i:10}D{i:9}D{i:11}
}
##^##*/
