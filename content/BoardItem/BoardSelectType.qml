import QtQuick 2.15
import QtQuick.Controls 2.15

import "../MyColor"
import QtQuick.Studio.Effects 1.0


// mode 0 : select
// mode 1 : base
Item {
    id:boardSelectType
    width: 1920
    height: 1080
    layer.enabled: true

    property bool mouseEvent



   // property var index

    Component.onCompleted: {
        //console.log("보드창 :" + index + " ,모드 : " + mode)


    }

    onMouseEventChanged: {
        //console.log("보드창 :" + index + " ,마우스 : " , mouseEvent)
    }

    Rectangle {
        id: rectangle
        color: MyColors.boxBgColor
        radius: 10
        anchors.fill: parent
        anchors.bottomMargin: 0



        BoardSelectMode {
            id: boardSelectMode
            anchors.fill: parent
            visible: true
            //visible: (index === modelGroup.count -1)? false : true //((mode === 0)? true : false)
            Component.onCompleted: {
                visible = Qt.binding(function(){
                    if(index === modelGroup.count -1)
                        return false
                    else if(mode === 1)
                        return true
                    else
                        return false
                })
            }
        }

        BoardSettingBase{
            id : boardSettingBase
            anchors.fill : parent
            visible : false //(mode === 1)? true:false

            Component.onCompleted: {
                visible = Qt.binding(function(){
                    if(mode === 2)
                        return true
                    else
                        return false
                })
            }
        }

        BoardSettingRc{
            id : boardSettingRc
            anchors.fill : parent
            visible : false //(mode === 1)? true:false

            Component.onCompleted: {
                visible = Qt.binding(function(){
                    if(mode === 3)
                        return true
                    else
                        return false
                })
            }
        }
    }
/*
    DropShadowEffect {
        id: dropShadow

        property real distance:10

        width: rectangle.width
        height: rectangle.height
        source: rectangle
        color: "black"
       // blur: distance / 10.0
        //opacity: 1 - distance / 50.0

        Binding {
            target: dropShadow
            property: "x"
            value: -0.4 * dropShadow.distance
            //when: !dragArea.pressed
        }
        Binding {
            target: dropShadow
            property: "y"
            value: -0.9 * dropShadow.distance
            //when: !dragArea.pressed
        }

//        SequentialAnimation on distance {
//            id: animation
//            running: true
//            loops:  Animation.Infinite

//            NumberAnimation { to: 30; duration: 2000 }
//            PauseAnimation { duration: 500 }
//            NumberAnimation { to: 0; duration: 2000 }
//            PauseAnimation { duration: 500 }
//        }
    }
*/

}

/*##^##
Designer {
    D{i:0;formeditorZoom:0.9}D{i:1}
}
##^##*/
