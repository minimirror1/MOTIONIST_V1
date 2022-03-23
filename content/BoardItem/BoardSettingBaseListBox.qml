import QtQuick 2.15
import QtQuick.Controls 2.15

import "../MyColor"

Item {
    id: item1
    width: 960
    height: 30


    Rectangle{
        id : rectangle
        anchors.fill: parent
        color: MyColors.listBgColor
    }

    Text {
        id: text1
        width: 50
        text: qsTr("3-1")
        color : MyColors.textMainColor
        anchors.left: parent.left
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        font.pixelSize: 18
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        anchors.leftMargin: 20
        font.family: "HelveticaRounded"
    }



    Item {
        id: item2
        width: 200
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        anchors.horizontalCenter: parent.horizontalCenter

        ListView {
            id: listView
            anchors.left: previous.right
            anchors.right: next.left
            anchors.top: parent.top
            anchors.bottom: parent.bottom
            orientation: ListView.Horizontal
            layoutDirection: Qt.LeftToRight

            interactive: false

            delegate: Item {
                id : boardSel
                width: listView.width
                height: listView.height

                Text {
                    text: name
                    anchors.fill: boardSel
                    color : colorCode
                    anchors.verticalCenter: parent.verticalCenter
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    font.pixelSize: 18
                    font.family: "HelveticaRounded"

                }

            }
            model: ListModel {
                ListElement {
                    name: "AC"
                    colorCode: "#02ed87"
                }

                ListElement {
                    name: "BLDC"
                    colorCode: "#00c8f1"
                }

                ListElement {
                    name: "  "
                    colorCode: "#00000000"
                }
            }
        }

        Rectangle {
            id: backGroundColor1
            width: item2.width
            color: MyColors.listBgColor
            anchors.left: next.left
            anchors.top: parent.top
            anchors.bottom: parent.bottom
            anchors.topMargin: 0
        }

        Rectangle {
            id: backGroundColor2
            width: item2.width
            color: MyColors.listBgColor
            anchors.right: previous.right
            anchors.top: parent.top
            anchors.bottom: parent.bottom
            anchors.topMargin: 0
        }

        Image {
            id: next
            x: 149
            anchors.verticalCenter: parent.verticalCenter
            anchors.right: parent.right
            source: "../images/Board/Base/next.png"
            fillMode: Image.PreserveAspectFit

            MouseArea{
                anchors.fill: parent
                hoverEnabled: true
                onEntered: {
                    next.source = "../images/Board/Base/next_on.png"
                }
                onExited: {
                    next.source = "../images/Board/Base/next.png"
                }
                onPressed: {
                    next.source = "../images/Board/Base/next_pre.png"
                }
                onReleased: {
                    if(containsMouse)
                        next.source = "../images/Board/Base/next_on.png"
                    else
                        next.source = "../images/Board/Base/next.png"
                }
                onClicked: {
                    if(listView.currentIndex < 2)
                       listView.currentIndex += 1
                }
            }
        }


        Image {
            id: previous
            anchors.verticalCenter: parent.verticalCenter
            anchors.left: parent.left
            source: "../images/Board/Base/previous.png"
            fillMode: Image.PreserveAspectFit

            MouseArea{
                anchors.fill: parent
                hoverEnabled: true
                onEntered: {
                    previous.source = "../images/Board/Base/previous_on.png"
                }
                onExited: {
                    previous.source = "../images/Board/Base/previous.png"
                }
                onPressed: {
                    previous.source = "../images/Board/Base/previous_pre.png"
                }
                onReleased: {
                    if(containsMouse)
                        previous.source = "../images/Board/Base/previous_on.png"
                    else
                        previous.source = "../images/Board/Base/previous.png"
                }
                onClicked: {
                    if(listView.currentIndex !== 0)
                       listView.currentIndex -= 1
                }
            }
        }

    }
    TextInput {
        id: textInput
        x: 83
        width: 200
        color: MyColors.textMainColor
        text: qsTr("Text Input")
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        font.pixelSize: 18
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        font.styleName: "Bold"
        font.family: "HelveticaRounded"
    }

    Image {
        id: ac
        x: 783
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        source: "../images/Board/Base/AC.png"
        anchors.topMargin: 2
        anchors.bottomMargin: 2
        anchors.rightMargin: 50
        fillMode: Image.PreserveAspectFit
        visible: false
        Component.onCompleted: {
            visible = Qt.binding(function(){
                if(listView.currentIndex ===0)
                    return true
                else
                    return false
            })
        }
    }

    Image {
        id: bldc
        x: 783
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        source: "../images/Board/Base/BLDC.png"
        fillMode: Image.PreserveAspectFit
        anchors.topMargin: 2
        anchors.rightMargin: 50
        anchors.bottomMargin: 2
        visible: false
        Component.onCompleted: {
            visible = Qt.binding(function(){
                if(listView.currentIndex ===1)
                    return true
                else
                    return false
            })
        }
    }
}

/*##^##
Designer {
    D{i:0;formeditorZoom:0.9}D{i:11}D{i:12}
}
##^##*/
