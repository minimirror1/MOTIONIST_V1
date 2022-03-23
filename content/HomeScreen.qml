import QtQuick 2.15
import QtQuick.Controls 2.15

//import "MyColor.qml"
import "HomeItem"
import "./MyColor"

Item {
    width: 1536
    height: 864

    Rectangle {
        id: rectangle
        color: MyColors.bgColor
        anchors.fill: parent

        Row {
            id: row
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.top: parent.top
            anchors.bottom: parent.bottom


            anchors.rightMargin: parent.width /8
            anchors.leftMargin: parent.width /8

            anchors.bottomMargin: parent.height/5
            anchors.topMargin: parent.height/5

            spacing: (row.width-(250*4))/3

            HomeButton {
                id: newProjectButton
                text1.text : qsTr("NEW")
                text2.text : qsTr("PROJCET")
                image.source: "../images/Home/newproject.png"
                image_on.source: "../images/Home/newproject_on.png"
                mouseArea.onClicked: {
                    //JSON.stringify(modelGroup)
                    //console.log(qmlDebugger.properties(modelGroup))

                    for(var i = 0; i < modelGroup.count; i++)
                    {
                        console.log("=============G : "+i+"===================================")
                        console.log("index : "+modelGroup.get(i).index)
                        console.log("mode : "+modelGroup.get(i).mode)
                        console.log("selected : "+modelGroup.get(i).selected)
                        console.log("groupId : "+modelGroup.get(i).groupId)
                        console.log("groupName : "+modelGroup.get(i).groupName)
                        console.log("------baseTypeCnt : "+ modelGroup.get(i).baseType.count)
                        for(var j = 0; j< modelGroup.get(i).baseType.count;j++)
                        {
                            console.log("slot"+j+" subid : "+modelGroup.get(i).baseType.get(j).subId  + "   ............")
                            console.log("slot"+j+" axisName : "+modelGroup.get(i).baseType.get(j).axisName)
                            console.log("slot"+j+" active : "+modelGroup.get(i).baseType.get(j).active)
                            console.log("slot"+j+" motorType : "+modelGroup.get(i).baseType.get(j).motorType)


                        }
                    }
                }
            }

            HomeButton {
                id: openProjectButton
                text1.text : qsTr("OPEN")
                text2.text : qsTr("PROJCET")
                image.source: "../images/Home/openproject.png"
                image_on.source: "../images/Home/openproject_on.png"
            }

            HomeButton {
                id: settingButton
                text1.text : qsTr("SETTING")
                text2.text : qsTr(" ")
                image.source: "../images/Home/setting.png"
                image_on.source: "../images/Home/setting_on.png"
            }

            HomeButton {
                id: eManualButton
                text1.text : qsTr("e-MANUAL")
                text2.text : qsTr(" ")
                image.source: "../images/Home/emanual.png"
                image_on.source: "../images/Home/emanual_on.png"
            }
        }
    }


}

/*##^##
Designer {
    D{i:0;formeditorZoom:0.5}
}
##^##*/
