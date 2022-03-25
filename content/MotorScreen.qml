import QtQuick 2.15
import QtQuick.Controls 2.15

import "./MotorItem"

Item {
    id: motorScreen
    width: 1536
    height: 864

    property int isoY : parent.width/4

    property int isoMargin : 20

    property int currentGroupIndex : 0

    property var currentModel : []

    property bool findFlag : false



    Component.onCompleted: {


        isoY = Qt.binding(function(){
            return parent.width/4
            }
        )
    }

    function changeScreenSlot(){
        console.log("====================motor setting page")
        //base type 그룹 번호 찾기
        var findIndex = 1000
        for(var i = 0; i < modelGroup.count; i++)
        {
            if(modelGroup.get(i).mode === 2)
            {
                findIndex = i
                console.log("find index")
                break;
            }
        }
        if(findIndex !== 1000)
        {
            findFlag = true
            currentGroupIndex = findIndex
            currentModel = modelGroup.get(findIndex)

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
    }


}
