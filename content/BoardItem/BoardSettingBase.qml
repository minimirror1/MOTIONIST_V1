import QtQuick 2.15
import QtQuick.Controls 2.15

import "."
Item {
    id: item1
    width: 1280
    height: 720


    signal nextTextinputFocus(var num)

    Component.onCompleted: {


        for(var i = 0;  i < 10 ; i++)
        {
            baseType.append({
                                      subId : i+1,
                                      active : 0,
                                      axisName : "",
                                      motorType : 0
                                  }
                                  )

            //            listView.model.append({
            //                                  subId : i+1,
            //                                  active : 0,
            //                                  name : qsTr("text input"),
            //                                  motorType : 0
            //                              }
            //                              )
        }

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
        id: item2
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: boardSettingTitle.bottom
        anchors.bottom: parent.bottom

        ListView {
            id: listView
            anchors.fill: parent
            spacing: 14
            anchors.rightMargin: 20
            anchors.leftMargin: 20
            anchors.bottomMargin: 20
            anchors.topMargin: 20
            interactive : false

            delegate: BoardSettingBaseListBox {
                id: boardSettingBaseListBox
                y: 35
                anchors.left: parent.left
                anchors.right: parent.right

                slotIdText.text :groupId+"-"+subId
                //anchors.rightMargin: 20
                //anchors.leftMargin: 20
                Component.onCompleted: {
                    nextTextinputFocus.connect(nextTextinputFocusSlot)
                }
            }
            model : baseType
        }
    }


}

/*##^##
Designer {
    D{i:0;formeditorZoom:0.66}D{i:1}D{i:3}D{i:2}
}
##^##*/
