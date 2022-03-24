import QtQuick 2.15
import QtQuick.Controls 2.15

import "../MyColor"

Item {

    id: idText

    width: 960/4
    height: 30

    function nextTextinputFocusSlot(num)
    {
        if(num === subId){
            textInput.selectAll()
            textInput.focus = true
        }
    }

    Rectangle{
        id : rectangle25
        anchors.fill: idText
        color: MyColors.listBgColor
    }

    Text {
        id: slotIdText
        width: 50
        text: groupId+"-"+subId
        color : MyColors.textMainColor
        anchors.left: parent.left
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        font.pixelSize: 18
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        anchors.leftMargin: 4
        font.family: "HelveticaRounded"
    }

    TextInput {
        id: textInput
        color: MyColors.textMainColor
        text: qsTr("Text Input")
        anchors.left: slotIdText.right
        anchors.right: text1.left
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        font.pixelSize: 18
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        anchors.rightMargin: 4
        anchors.leftMargin: 4
        font.styleName: "Bold"
        font.family: "HelveticaRounded"
        inputMask: {"NNNNNNNNNN"}
        //validator: IntValidator {bottom: a; top: Z}

        onActiveFocusChanged: {
            if(activeFocus)
            {
                selectAll()
            }
        }
        Keys.onEnterPressed: {
            deselect()
            focus = false
            nextTextinputFocus(subId+1)
        }
        Keys.onTabPressed: {
            deselect()
            focus = false
            nextTextinputFocus(subId+1)
        }
        Keys.onBacktabPressed: {
            deselect()
            focus = false
            nextTextinputFocus(subId-1)
        }
        Component.onCompleted: {
            axisName = Qt.binding(function(){
                return text
            })
        }
    }

    Text {
        id: text1
        width: 30
        color: MyColors.textMainColor
        text: qsTr("RC")
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        font.pixelSize: 12
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        font.family: "HelveticaRounded-Black"
    }


}

/*##^##
Designer {
    D{i:0;formeditorZoom:1.66}D{i:3}
}
##^##*/
