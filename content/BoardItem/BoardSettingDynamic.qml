import QtQuick 2.15
import QtQuick.Controls 2.15

Item {
    width: 1920
    height: 1080

    signal nextTextinputFocus(var num)

    Component.onCompleted: {
        console.log("dynamic on" + mode +" completed!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!")

        for(var i = 0;  i < 10 ; i++)
        {
            if(dyTtlType.count >=10)
                break;


            dyTtlType.append({
                                 subId : i+1,
                                 axisActive : 0,
                                 axisName : "",
                                 motorType : mode
                             })

            dy485Type.append({
                                 subId : i+1,
                                 axisActive : 0,
                                 axisName : "",
                                 motorType : mode
                             })

        }
        console.log("dy cnt : "+rcType.count)
    }

    BoardSettingTitle {
        id: boardSettingTitle
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.topMargin: 20
        anchors.rightMargin: 20
        anchors.leftMargin: 20

    }

    Item {
        id: item1
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: boardSettingTitle.bottom
        anchors.bottom: parent.bottom

        GridView {
            id: gridView

            flow: GridView.FlowTopToBottom
            keyNavigationWraps: false


            anchors.top:parent.top
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.horizontalCenterOffset: 75

            anchors.topMargin: 100

            width: parent.width * 0.8
            height: (30+14)*7

            cellWidth: gridView.width/2//14 + 240
            cellHeight: gridView.height/5 // 14 + 30

            interactive : false



            delegate: BoardSettingDynamicListBox{
                id : boardSettingDynamicListBox
                width : gridView.width/2 - 150
                height: gridView.height/5 - 14

                Component.onCompleted: {
                    nextTextinputFocus.connect(nextTextinputFocusSlot)
                }
            }
            model: (mode===4)?dyTtlType:dy485Type
        }
    }


}
