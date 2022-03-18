import QtQuick 2.15
import QtQuick.Controls 2.15

import "BoardItem"
import "./MyColor"

Item {
    id: item3
    width: 1536
    height: 864

    //Connection---------------------------------------------------------------
    function groupAddSlot()
    {
        modelGroup.append({
                              setIndex: modelGroup.count,
                              setMode : 0,
                              setSelected : 0
                          })
    }
    function selectSlot(myIndex){
        console.log("selectSlot : " + myIndex)
    }

    ListModel{
        id : modelGroup
        ListElement{
            setIndex : 0
            setMode : 0
            setSelected : 0
        }
    }

    Item {
        id: item1
        width: parent.width/4
        anchors.left: parent.left
        anchors.top: parent.top
        anchors.bottom: parent.bottom

        Text {
            id: text1
            color: MyColors.textMainColor
            text: qsTr("GROUP")
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.top: parent.top
            font.pixelSize: 30
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            font.family: "HelveticaRounded"
            anchors.rightMargin: 49
            anchors.leftMargin: 50
            anchors.topMargin: 50
        }

        ListView {
            id: listView
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.top: text1.bottom
            anchors.bottom: parent.bottom
            anchors.topMargin: 50

            cacheBuffer: 65535

            spacing : 10
            delegate:  BoardGroupAddBtn {
                id : boardGroupAddBtn
                anchors.left: parent.left
                anchors.right: parent.right
                anchors.margins: parent.width/5
                height: width / 3.5

                Component.onCompleted: {
                    groupAddSignal.connect(groupAddSlot)
                    selectSignal.connect(selectSlot)
                }
            }

            model: modelGroup
        }
    }

    Item {
        id: item2
        anchors.left: item1.right
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.bottom: parent.bottom

        BoardSelectType {
            id: boardSelectType
            height: parent.height * 0.9
            width: parent.width *0.9

            anchors.fill: parent
            anchors.topMargin: parent.height *0.05
            anchors.bottomMargin:  parent.height *0.05
            anchors.leftMargin:  parent.width *0.05
            anchors.rightMargin:  parent.width *0.05
        }


    }


}

/*##^##
Designer {
    D{i:0;formeditorZoom:0.5}D{i:2}D{i:1}D{i:4}D{i:3}
}
##^##*/
