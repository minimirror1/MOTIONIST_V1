import QtQuick 2.15
import QtQuick.Controls 2.15

Item {
    width: 1280
    height: 720


    signal nextTextinputFocus(var num)

    Component.onCompleted: {
        console.log("rc on completed!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!")

        for(var i = 0;  i < 28 ; i++)
        {
            if(rcType.count >=28)
                break;

            rcType.append({
                                      subId : i+1,
                                      active : 0,
                                      axisName : "",
                                      motorType : 3
                                  })
        }
        console.log("rc cnt : "+rcType.count)
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
            anchors.right: parent.right
            anchors.left: parent.left

            anchors.rightMargin: -10
            anchors.leftMargin: 20
            anchors.topMargin: 20

            height: (30+14)*7

            cellWidth: gridView.width/4//14 + 240
            cellHeight: gridView.height/7 // 14 + 30

            interactive : false



            delegate: BoardSettingRcListBox{
                id : boardSettingBaseListBox
                width : gridView.width/4 - 28
                height: gridView.height/7 - 14

                Component.onCompleted: {
                    nextTextinputFocus.connect(nextTextinputFocusSlot)
                }
            }
            model: rcType
        }
    }
}
