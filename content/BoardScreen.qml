import QtQuick 2.15
import QtQuick.Controls 2.15

import "BoardItem"
import "./MyColor"

Item {
    id: boardScreen
    width: 1536
    height: 864

    property int oldIndex : 0
    property int moveIndex : 0

    //Connection---------------------------------------------------------------
    function groupAddSlot()
    {
        modelGroup.append({
                              index: modelGroup.count,
                              mode : 0,
                              selected : 0
                          })

        for(var i = 0; i< modelGroup.count; i++)
        {
            if(i !== modelGroup.count )
            {
                modelGroup.set(i,{ selected : 0})
                console.log("index : "+ modelGroup.get(i).index + "   selected :" + modelGroup.get(i).selected)
            }
        }



        newSelectEvent()

        if(modelGroup.count >= 2){
            oldIndex = pathView.currentIndex
            pathView.currentIndex = modelGroup.count - 2

            moveIndex = Math.abs(oldIndex - pathView.currentIndex)

            if(moveIndex > modelGroup.count/2)
                moveIndex = modelGroup.count/2
        }

        console.log("new current index : " + pathView.currentIndex +"  moveing : " + moveIndex)
    }
    function selectSlot(myIndex){
        console.log("selectSlot : " + myIndex)




        for(var i = 0; i< modelGroup.count; i++)
        {
            if(i !== myIndex)
            {
                modelGroup.set(i,{ selected : 0})
                console.log("index : "+ modelGroup.get(i).index + "   selected :" + modelGroup.get(i).selected)
            }
        }
        newSelectEvent()

        oldIndex = pathView.currentIndex
        pathView.currentIndex = myIndex

        moveIndex = Math.abs(oldIndex - pathView.currentIndex)

        if(moveIndex > modelGroup.count/2)
            moveIndex = modelGroup.count/2

        console.log("new select index : " + pathView.currentIndex+"  moveing : " + moveIndex)
    }

    signal newSelectEvent()//새로운 선택 발생




    ListModel{
        id : modelGroup
        ListElement{
            index : 0
            mode : 0
            selected : 0
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

            model: modelGroup

            cacheBuffer: 65535

            spacing : 10
            delegate:  BoardGroupAddBtn {
                id : boardGroupAddBtn
                anchors.left: parent.left
                anchors.right: parent.right
                anchors.margins: parent.width/5
                height: width / 3.5

                //boardTypeText.text : changeModeText()

                Component.onCompleted: {
                    groupAddSignal.connect(groupAddSlot)
                    selectSignal.connect(selectSlot)
                }
            }




        }
    }

    Item {
        id: item2
        anchors.left: item1.right
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.bottom: parent.bottom


        PathView {
                id: pathView
                anchors.fill: item2
                model: modelGroup

                cacheItemCount : 65535

                interactive: false
                //interactive: true

                delegate: BoardSelectType {
                        id: boardSelectType
                        height: parent.height * 0.9
                        width: parent.width *0.9

//                        anchors.fill: parent
//                        anchors.topMargin: parent.height *0.05
//                        anchors.bottomMargin:  parent.height *0.05
//                        anchors.leftMargin:  parent.width *0.05
//                        anchors.rightMargin:  parent.width *0.05
                        opacity : PathView.opacity
                        scale: PathView.itemscale
                        z: PathView.z


                    }


                pathItemCount: 5
                preferredHighlightEnd: 0.5
                preferredHighlightBegin: 0.5

                highlightMoveDuration : 1000 // 전환속도
                //highlightMoveDuration : moveIndex * 500 // 전환속도





                path: Path {
                    startX: item2.width * 0.5
                    startY: 250

                    PathAttribute { name: "opacity"; value: 0.05 }
                    PathAttribute { name: "z"; value: 50 }
                    PathAttribute { name: "itemscale"; value: 0.7 }

                    PathLine {
                        x: item2.width * 0.5
                        y: item2.height * 0.5
                    }

                    PathAttribute { name: "opacity"; value: 1 }
                    PathAttribute { name: "z"; value: 100 }
                    PathAttribute { name: "itemscale"; value: 1 }

                    PathLine {
                        x: item2.width *0.5
                        y: item2.height-250
                    }

                    PathAttribute { name: "opacity"; value: 0.05 }
                    PathAttribute { name: "z"; value: 50 }
                    PathAttribute { name: "itemscale"; value: 0.7 }
                }
            }
    }
}

/*##^##
Designer {
    D{i:0;formeditorZoom:0.5}D{i:2}D{i:1}D{i:4}D{i:3}
}
##^##*/
