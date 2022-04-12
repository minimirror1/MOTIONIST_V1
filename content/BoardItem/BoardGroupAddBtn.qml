import QtQuick 2.15
import QtQuick.Controls 2.15


import "../MyColor"

/*
  mode 0 : add
  mode 1 : board select wait
  mode 2 : board select ok
*/

Item {
    width: 200
    height: 100


//    property var index : index
//    property var mode : mode
//    property var selected_1 : selected

    property color textColor : MyColors.textMainColor

    property alias mouseArea : mouseArea

    property alias boardTypeText : boardTypeText

    signal groupAddSignal()
    signal selectSignal(var myIndex)


    Connections
    {
        target: boardScreen
        onNewSelectEvent:{
            rectangle.color = MyColors.buttonMainColor
            textColor = MyColors.textMainColor
        }
    }



    Rectangle {
        id: rectangle
        color: MyColors.buttonMainColor
        radius: 5
        anchors.fill: parent

        Text {
            id: text1
            color: textColor
            text: qsTr("+")
            visible : (mode === 0)? true:false
            anchors.verticalCenter: parent.verticalCenter
            font.pixelSize: 30
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            anchors.verticalCenterOffset: -3
            anchors.horizontalCenter: parent.horizontalCenter
            font.family: "HelveticaRounded-Black"
        }

        Text {
            id: groupText
            y: parent.height /3 -10
            color: textColor
            text: qsTr("GROUP ")
            visible : (mode >= 1)? true:false
            font.pixelSize: 16
            font.bold: true
            anchors.horizontalCenter: parent.horizontalCenter
            font.family: "Helvetica 55 Roman"

            Component.onCompleted: {
                groupText.text = Qt.binding(function(){
                    if(groupId === 0)
                        return qsTr("GROUP ")
                    else
                        return qsTr("GROUP ") + Number(groupId)
                })
            }
        }

        Text {
            id: boardTypeText
            y: parent.height /3*2 -10
            color: textColor
            text : qsTr(" ")
            //text:  (mode === 2)? qsTr("BASE TYPE"): (mode === 3)? qsTr("RC TYPE") : (mode === 4)? qsTr("DY TTL TYPE") : (mode === 5)? qsTr("DY 485 TYPE") : qsTr(" ")

            visible : (mode >= 2)? true:false
            font.pixelSize: 12
            anchors.horizontalCenterOffset: 0
            font.family: "HelveticaRounded"
            anchors.horizontalCenter: parent.horizontalCenter

            Component.onCompleted: {
                text = Qt.binding(function() {
                    if(mode === 2)
                        return qsTr("BASE BOARD")
                    else if(mode === 3)
                        return qsTr("RC BOARD")
                    else if(mode === 4)
                        return qsTr("DYNAMIC TTL BOARD")
                    else if(mode === 5)
                        return qsTr("DYNAMIC 485 BOARD")
                    else
                        return qsTr(" ")
               })
            }
        }

        MouseArea{
            id : mouseArea
            anchors.fill: parent
            hoverEnabled: true

            onEntered: {
                if(selected === 1)
                {
                    textColor = MyColors.textSelectColor
                    rectangle.color = MyColors.buttonHoverColor
                }
                else
                {
                    textColor = MyColors.textMainColor
                    rectangle.color = MyColors.buttonHoverColor
                }
                //console.log("index : " + index + ",sel : "+  selected)
            }
            onExited: {
                if(selected === 1)
                {
                    textColor = MyColors.textSelectColor
                    rectangle.color = MyColors.buttonSelectColor
                }
                else
                {
                    textColor = MyColors.textMainColor
                    rectangle.color = MyColors.buttonMainColor
                }
            }
            onPressed: {
                if(selected === 1)
                {
                    textColor = MyColors.textSelectColor
                    rectangle.color = MyColors.buttonPressedColor
                }
                else
                {
                    textColor = MyColors.textMainColor
                    rectangle.color = MyColors.buttonPressedColor
                }
            }
            onReleased: {
                if(selected === 1)
                {
                    textColor = MyColors.textSelectColor
                    rectangle.color = MyColors.buttonSelectColor
                }
                else
                {
                    textColor = MyColors.textMainColor
                    rectangle.color = MyColors.buttonMainColor
                }
            }
            onClicked: {
                if(mode === 0)
                {
                    mode = 1

                    console.log("group add")
                    groupAddSignal()

                    selected = 1
                    textColor = MyColors.textSelectColor
                    rectangle.color = MyColors.buttonSelectColor
                }
                else if(mode >= 1)
                {
                    selectSignal(index)

                    selected = 1
                    textColor = MyColors.textSelectColor
                    rectangle.color = MyColors.buttonSelectColor
                }
            }
        }
    }
}

/*##^##
Designer {
    D{i:0;formeditorZoom:2}
}
##^##*/
