import QtQuick 2.15
import QtQuick.Controls 2.15

import "MidiItem"
import "./MyColor"

Item {
    id: midiScreen
    width: 1536
    height: 864


    property int currentGroupIndex : 0
    property var currentTypeModel : []
    property var cuurentGroupModel : []
    property var groupId
    property var groupName

    property int curIndex

    signal newWHValuesignal()
    signal mouseChangeXYsignal(var posiX, var posiY, var s_groupId, var s_subId, var s_axisName)

    signal assignAxisToMidiSignal(var posiX, var posiY, var s_groupId, var s_subId, var s_axisName)

    function newMidiPageSlot()
    {
        midiGroup.append({
                             index : midiGroup.count,
                             page : midiGroup.count+1,
                             pageName : "",
                             slot : []
                         })

        var slotTemp = []

        slotTemp = midiGroup.get(midiGroup.count-1).slot

        for(var i = 0; i<8; i++)
        {
            slotTemp.append({
                                assignId: " ",
                                assignName: " "
                            })
        }
        newWHValuesignal()
    }

    function mouseChangeXYslot(posiX, posiY){
        //console.log("slot : " + posiX+"  x  "+posiY)
    }

    Component.onCompleted: {
        mouseChangeXYsignal.connect(mouseChangeXYslot)

        midiGroup.clear()
        midiGroup.append({
                             index : midiGroup.count,
                             page : midiGroup.count+1,
                             pageName : "",
                             slot : []
                         })

        var slotTemp = []

        slotTemp = midiGroup.get(0).slot

        for(var i = 0; i<8; i++)
        {
            slotTemp.append({
                                assignId: " ",
                                assignName: " "
                            })
        }
    }


    function changeScreenSlot(){
        newWHValuesignal()
        groupNumChange(1)
    }

    function groupNumChange(order){


        if(order === 1)//plus
        {
            console.log("plus order")
            if(++currentGroupIndex >= modelGroup.count)
                currentGroupIndex = 0
        }
        else if(order === -1)
        {
            console.log("minus order")
            if(--currentGroupIndex < 0 )
                currentGroupIndex = modelGroup.count - 1
        }
        console.log("그룹 길이 : " + modelGroup.count + ", current group index : ",currentGroupIndex)
        groupId = modelGroup.get(currentGroupIndex).groupId
        groupName = modelGroup.get(currentGroupIndex).groupName

        cuurentGroupModel = []
        cuurentGroupModel = modelGroup.get(currentGroupIndex)

        currentTypeModel = []

        if(modelGroup.get(currentGroupIndex).mode === 2)
        {
            currentTypeModel = modelGroup.get(currentGroupIndex).baseType
        }
        else if(modelGroup.get(currentGroupIndex).mode === 3)
        {
            currentTypeModel = modelGroup.get(currentGroupIndex).rcType
        }
        else if(modelGroup.get(currentGroupIndex).mode === 4)
        {
            currentTypeModel = modelGroup.get(currentGroupIndex).dyTtlType
        }
        else if(modelGroup.get(currentGroupIndex).mode === 5)
        {
            currentTypeModel = modelGroup.get(currentGroupIndex).dy485Type
        }
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
            model: midiGroup

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
                    newMidiPageSignal.connect(newMidiPageSlot)
                }


            }
            onCurrentIndexChanged: {
                newWHValuesignal()
                curIndex  =  currentIndex
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

        MouseArea {
            anchors.fill : parent
            anchors.topMargin: 200

            //cursorShape: setBitmapCursor("qrc:/skin/cursor_rotate")//Qt.ClosedHandCursor

            onWheel:
            {
                if( wheel.angleDelta.y > 0 ){
                    if(pathView.currentIndex !== 0)
                        pathView.incrementCurrentIndex();
                }
                else{
                    if(pathView.currentIndex < midiGroup.count )
                        pathView.decrementCurrentIndex();
                }
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
            anchors.right: parent.right
            anchors.top: parent.top
            anchors.horizontalCenter: gridView.horizontalCenter
            height: 100

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


        Text {
            id: text1
            height: 30
            text: groupName
            color : MyColors.textMainColor
            anchors.top: item7.bottom
            font.pixelSize: 16
            anchors.topMargin: -10
            font.family: "HYGothic-Extra"
            anchors.horizontalCenter: gridView.horizontalCenter
        }

        GridView {
            id: gridView
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.top: text1.bottom
            anchors.bottom: parent.bottom
            anchors.rightMargin: -36
            anchors.leftMargin: 20
            flow: GridView.FlowTopToBottom

            cellWidth: gridView.width/2//14 + 240
            cellHeight: gridView.height/14 // 14 + 30

            interactive : false



            delegate: MidiAxisBox{
                width : gridView.width/2
                height: gridView.height/14
            }

            model: currentTypeModel
        }

    }

    Image {
        id: pageUP_btn
        anchors.top: parent.top
        source: "images/Midi/pageUP_normal.png"
        anchors.topMargin: 20
        anchors.horizontalCenter: item2.horizontalCenter
        fillMode: Image.PreserveAspectFit

        opacity : 0.5

        MouseArea{
            anchors.fill: parent
            hoverEnabled: true
            onEntered: {
                pageUP_btn.source = "images/Midi/pageUP_hover.png"
            }
            onExited: {
                pageUP_btn.source = "images/Midi/pageUP_normal.png"
            }
            onPressed: {
                pageUP_btn.source = "images/Midi/pageUP_press.png"
            }
            onReleased: {
                pageUP_btn.source = "images/Midi/pageUP_hover.png"
            }
            onClicked: {
                if(pathView.currentIndex !== 0)
                {
                    pathView.currentIndex = pathView.currentIndex - 1
                }
                pageDN_btn.source = (pathView.currentIndex === midiGroup.count-1)? "images/Midi/pageADD_normal.png" :"images/Midi/pageDN_normal.png"

            }
        }
    }

    Image {
        id: pageDN_btn
        y: 794
        anchors.bottom: parent.bottom
        source: (pathView.currentIndex === midiGroup.count-1)? "images/Midi/pageADD_normal.png" : "images/Midi/pageDN_normal.png"
        anchors.bottomMargin: (pathView.currentIndex === midiGroup.count-1)? 10 : 20
        anchors.horizontalCenter: item2.horizontalCenter
        fillMode: Image.PreserveAspectFit

        opacity : 0.5

        MouseArea{
            anchors.fill: parent
            hoverEnabled: true
            onEntered: {

                pageDN_btn.source = (pathView.currentIndex === midiGroup.count-1)? "images/Midi/pageADD_hover.png" :"images/Midi/pageDN_hover.png"
            }
            onExited: {
                pageDN_btn.source = (pathView.currentIndex === midiGroup.count-1)? "images/Midi/pageADD_normal.png" :"images/Midi/pageDN_normal.png"
            }
            onPressed: {
                pageDN_btn.source = (pathView.currentIndex === midiGroup.count-1)? "images/Midi/pageADD_press.png" :"images/Midi/pageDN_press.png"
            }
            onReleased: {
                pageDN_btn.source = (pathView.currentIndex === midiGroup.count-1)? "images/Midi/pageADD_hover.png" :"images/Midi/pageDN_hover.png"
            }
            onClicked: {
                if(pathView.currentIndex === midiGroup.count-1){

                    newMidiPageSlot()
                    pathView.currentIndex = pathView.currentIndex+1
                    pageDN_btn.source = (pathView.currentIndex === midiGroup.count-1)? "images/Midi/pageADD_normal.png" : "images/Midi/pageDN_normal.png"
                }
                else
                {
                    pathView.currentIndex = pathView.currentIndex+1
                }
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



/*##^##
Designer {
    D{i:0;formeditorZoom:0.5}
}
##^##*/
