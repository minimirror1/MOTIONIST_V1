import QtQuick 2.15
import QtQuick.Controls 2.15

import "MidiItem"
import "./MyColor"

Item {
    id: midiScreen
    width: 1536
    height: 864


    signal newWHValuesignal()
    signal mouseChangeXYsignal(var posiX, var posiY)

    function mouseChangeXYslot(posiX, posiY){
        console.log("slot : " + posiX+"  x  "+posiY)
    }

    Component.onCompleted: {
        mouseChangeXYsignal.connect(mouseChangeXYslot)
    }


    function changeScreenSlot(){
        newWHValuesignal()
    }

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

        currentModel = []
        currentModel = modelGroup.get(setGroupIndex[currentGroupIndex])
    }




    Item {
        id: item2
        anchors.left: item1.right
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.bottom: parent.bottom

//        Rectangle{
//            anchors.fill: parent
//            color: "#555555"
//        }


        PathView {
            id: pathView
            anchors.fill: item2
            model: modelGroup

            cacheItemCount : 65535

            //interactive: false
            //interactive: true

            delegate: MidiListBox {
                id: midiListBox
                height: parent.height * 0.9
                width: parent.width *0.9

                opacity : PathView.opacity
                scale: PathView.itemscale
                z: PathView.z

                Component.onCompleted: {
                    newWHValuesignal.connect(newWHValueslot)
                }


            }


            pathItemCount: (modelGroup.count <= 4)?3:5
            preferredHighlightEnd: 0.5
            preferredHighlightBegin: 0.5

            highlightRangeMode: PathView.StrictlyEnforceRange
            highlightMoveDuration : 1000 // 전환속도

            path: Path {
                startX: item2.width * 0.5
                startY: (modelGroup.count <= 4)?-550:-1200

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
                    y: item2.height+((modelGroup.count <= 4)?550:1200)
                }

                PathAttribute { name: "opacity"; value: 0.05 }
                PathAttribute { name: "z"; value: 50 }
                PathAttribute { name: "itemscale"; value: 0.7 }
            }
        }

    }
    Item {
        id: item1
        width: parent.width/4
        anchors.left: parent.left
        anchors.top: parent.top
        anchors.bottom: parent.bottom

        Item {
            id: item7
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.top: parent.top
            height: 100

            Text {
                id: groupNumText
                width: 100
                color : MyColors.textMainColor
                text: qsTr("Group ")// + groupId
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
                id: item3
                x: 518
                width: minus.width
                height: minus.height
                anchors.verticalCenter: groupNumText.verticalCenter
                anchors.right: groupNumText.left
                anchors.rightMargin: 30

                Image {
                    id: minus
                    anchors.verticalCenter: parent.verticalCenter
                    source: "./images/Board/Base/minus.png"
                    anchors.horizontalCenter: parent.horizontalCenter
                    fillMode: Image.PreserveAspectFit
                }

                MouseArea{
                    id: groupMinus
                    anchors.fill: parent
                    hoverEnabled: true
                    onEntered: {
                        minus.source = "./images/Board/Base/minus_on.png"
                    }
                    onExited: {
                        minus.source = "./images/Board/Base/minus.png"
                    }
                    onPressed: {
                        minus.source = "./images/Board/Base/minus_pre.png"
                    }
                    onReleased: {
                        if(containsMouse )
                            minus.source = "./images/Board/Base/minus_on.png"
                        else
                            minus.source = "./images/Board/Base/minus.png"
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
                    source: "./images/Board/Base/add.png"
                    anchors.horizontalCenter: parent.horizontalCenter
                    fillMode: Image.PreserveAspectFit
                }
                MouseArea{
                    id: groupPlus
                    anchors.fill: parent
                    hoverEnabled: true
                    onEntered: {
                        add.source = "./images/Board/Base/add_on.png"
                    }
                    onExited: {
                        add.source = "./images/Board/Base/add.png"
                    }
                    onPressed: {
                        add.source = "./images/Board/Base/add_pre.png"
                    }
                    onReleased: {
                        if(containsMouse )
                            add.source = "./images/Board/Base/add_on.png"
                        else
                            add.source = "./images/Board/Base/add.png"
                    }
                    onClicked: {
                        groupNumChange(1)
                    }
                }
            }
        }

        GridView {
            id: gridView
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.top: item7.bottom
            anchors.bottom: parent.bottom
            flow: GridView.FlowTopToBottom

            cellWidth: gridView.width/2//14 + 240
            cellHeight: gridView.height/14 // 14 + 30

            interactive : false


            delegate: MidiAxisBox{
                width : gridView.width/2 - 0
                height: gridView.height/14 - 0
            }

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
                ListElement {
                    name: "Green"
                    colorCode: "green"
                }
                ListElement {
                    name: "Green"
                    colorCode: "green"
                }
                ListElement {
                    name: "Green"
                    colorCode: "green"
                }
                ListElement {
                    name: "Green"
                    colorCode: "green"
                }
                ListElement {
                    name: "Green"
                    colorCode: "green"
                }
                ListElement {
                    name: "Green"
                    colorCode: "green"
                }
                ListElement {
                    name: "Green"
                    colorCode: "green"
                }
                ListElement {
                    name: "Green"
                    colorCode: "green"
                }
                ListElement {
                    name: "Green"
                    colorCode: "green"
                }
                ListElement {
                    name: "Green"
                    colorCode: "green"
                }
                ListElement {
                    name: "Green"
                    colorCode: "green"
                }
            }
        }

        //        ListView {
        //            id: listView
        //            anchors.left: parent.left
        //            anchors.right: parent.right
        //            anchors.top: text1.bottom
        //            anchors.bottom: parent.bottom
        //            anchors.topMargin: 50

        //            model: modelGroup

        //            cacheBuffer: 65535

        //            spacing : 10
        //            delegate:  BoardGroupAddBtn {
        //                id : boardGroupAddBtn
        //                anchors.left: parent.left
        //                anchors.right: parent.right
        //                anchors.margins: parent.width/5
        //                height: width / 3.5

        //                //boardTypeText.text : changeModeText()

        //                Component.onCompleted: {
        //                    groupAddSignal.connect(groupAddSlot)
        //                    selectSignal.connect(selectSlot)
        //                }
        //            }
        //        }
    }

//    Rectangle{

//        x : 547.542725 //= 384+(57.6)+121.499865 - 15.55714
//        y : 205


//        width: 882 * 0.89999 + 31.11428
//        height: 300

//        color : "#55123456"
//    }

//    Rectangle{

//        x : 384+((1152-1036.8)/2)+135*0.89999 - 15.55714
//        y : 205


//        width:103.1142//== 80 * 0.89999 + 31.11428
//        height: 200

//        color : "#55832158"
//    }

}

/*##^##
Designer {
    D{i:0;formeditorZoom:0.5}D{i:26}
}
##^##*/
