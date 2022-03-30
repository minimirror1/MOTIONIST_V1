import QtQuick 2.15
import QtQuick.Controls 2.15

import "./MotorItem"
import "./MyColor"

Item {
    id: motorScreen
    width: 1536
    height: 864

    property int isoY : parent.width/4

    property int isoMargin : 20

    property int currentGroupIndex : 0

    property var currentModel : []

    property bool findFlag : false

    property var setGroupIndex : []

    property int groupId :0

    property bool toggle : true


    signal nextTextinputFocus(var num)


    function newFindBaseGroup(){
    }

    Component.onCompleted: {
        isoY = Qt.binding(function(){
            return parent.width/4
        }
        )
    }

    function changeScreenSlot(){
        console.log("====================motor setting page")
        //base type 그룹 번호 찾기

        findFlag = false
        currentModel = []
        setGroupIndex = []

        for(var i = 0; i < modelGroup.count; i++)
        {
            if(modelGroup.get(i).mode === 2)
            {
                //findIndex = i
                console.log("find index")

                setGroupIndex.push(i)
                //break;
            }
        }

        if(setGroupIndex.length !== 0)
        {
            findFlag = true
            currentGroupIndex = 0
            currentModel = modelGroup.get(setGroupIndex[currentGroupIndex])
            groupId = modelGroup.get(setGroupIndex[currentGroupIndex]).groupId

//            for(var j = 0; j < 10; j++){
//                if(modelGroup.get(findIndex).baseType.get(j).axisActive)
//                {
//                    currentModel.append(modelGroup.get(findIndex).baseType.get(j))
//                }
//            }

            console.log("current model name : " + currentModel.groupName)
        }
    }

    Item {
        id: item1
        height: 100
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: parent.top

        visible: findFlag

        MotorTitle{
            id : motorTitle
            anchors.fill: parent
        }

    }

    Item {
        id: item2
        height: 100
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: item1.bottom

        visible: findFlag

        MotorColumnName{
            id : motorColumnName
            anchors.fill: parent
        }
    }

    Item {
        id: item3
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: item2.bottom
        anchors.bottom: parent.bottom

        visible: findFlag

        ListView {
            id: listView
            anchors.fill: parent

            spacing: 14

            interactive : false

            delegate: MotorListBox{
                id : motorListBox
                anchors.left: parent.left
                anchors.right : parent.right
                height: (axisActive)?30:-14
                visible : axisActive

                Component.onCompleted: {
                    if(axisActive)
                    {

                        console.log(toggle)

                        rectangle1.color = (toggle)?MyColors.listMotor1Color:MyColors.listMotor2Color
                        rectangle.color = (toggle)?MyColors.listMotor1Color:MyColors.listMotor2Color
                        toggle = !toggle
                    }

                    nextTextinputFocus.connect(nextTextinputFocusSlot)
                }
            }
            model: currentModel.baseType
        }
    }
}
