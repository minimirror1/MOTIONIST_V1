import QtQuick 2.15
import QtQuick.Controls 2.15

Item {
    id: root
    width: 1152
    height: 864

    property real realWidth : midi_bg.width
    property real realHeight : midi_bg.height

    property real ratioW : 1
    property real ratioH : 1

    property real midiX
    property real midiY
    property real midiZ

    property real startHoverPosi_X : 547.542725
    property real startHoverPosi_Y : 205

    property real widthHover : 103.1142
    property real heightHover : 300

    signal newMidiPageSignal()



    function newWHValueslot(){
        realWidth = midi_bg.width
        realHeight = midi_bg.height

        ratioW = realWidth / 1152
        ratioH = realHeight / 734
        console.log("change size : ",realWidth, realHeight)
        console.log("change ratio : ",ratioW, ratioH)
    }

    function selectSlot(posiX, posiY, s_groupId, s_subId, s_axisName)
    {
        var idTemp = s_groupId + "-" + s_subId
        var nameTemp = s_axisName


        //if((root.z !== 100)||(root.z === "undefined"))
        //console.log("myindex : "+index+" ,curIndex : "+ curIndex)
        if(index !== curIndex)
        {
            return
        }

        led_1.visible = false
        led_2.visible = false
        led_3.visible = false
        led_4.visible = false
        led_5.visible = false
        led_6.visible = false
        led_7.visible = false
        led_8.visible = false

        slotText_1.text_id.text = slot.get(0).assignId
        slotText_1.text_name.text = slot.get(0).assignName
        slotText_2.text_id.text = slot.get(1).assignId
        slotText_2.text_name.text = slot.get(1).assignName
        slotText_3.text_id.text = slot.get(2).assignId
        slotText_3.text_name.text = slot.get(2).assignName
        slotText_4.text_id.text = slot.get(3).assignId
        slotText_4.text_name.text = slot.get(3).assignName
        slotText_5.text_id.text = slot.get(4).assignId
        slotText_5.text_name.text = slot.get(4).assignName
        slotText_6.text_id.text = slot.get(5).assignId
        slotText_6.text_name.text = slot.get(5).assignName
        slotText_7.text_id.text = slot.get(6).assignId
        slotText_7.text_name.text = slot.get(6).assignName
        slotText_8.text_id.text = slot.get(7).assignId
        slotText_8.text_name.text = slot.get(7).assignName


        if((startHoverPosi_Y<=posiY)&&( posiY <= startHoverPosi_Y+heightHover))
        {
            if(startHoverPosi_X <= posiX)
            {
                if(startHoverPosi_X + widthHover >= posiX)
                {
                    console.log("1")
                    led_1.visible = true
                    slotText_1.text_name.text = nameTemp
                    slotText_1.text_id.text = idTemp
                }
                else if(startHoverPosi_X + widthHover*2 >= posiX)
                {
                    console.log("2")
                    led_2.visible = true
                    slotText_2.text_name.text = nameTemp
                    slotText_2.text_id.text = idTemp
                }
                else if(startHoverPosi_X + widthHover*3 >= posiX)
                {
                    console.log("3")
                    led_3.visible = true
                    slotText_3.text_name.text = nameTemp
                    slotText_3.text_id.text = idTemp
                }
                else if(startHoverPosi_X + widthHover*4 >= posiX)
                {
                    console.log("4")
                    led_4.visible = true
                    slotText_4.text_name.text = nameTemp
                    slotText_4.text_id.text = idTemp
                }
                else if(startHoverPosi_X + widthHover*5 >= posiX)
                {
                    console.log("5")
                    led_5.visible = true
                    slotText_5.text_name.text = nameTemp
                    slotText_5.text_id.text = idTemp
                }
                else if(startHoverPosi_X + widthHover*6 >= posiX)
                {
                    console.log("6")
                    led_6.visible = true
                    slotText_6.text_name.text = nameTemp
                    slotText_6.text_id.text = idTemp
                }
                else if(startHoverPosi_X + widthHover*7 >= posiX)
                {
                    console.log("7")
                    led_7.visible = true
                    slotText_7.text_name.text = nameTemp
                    slotText_7.text_id.text = idTemp
                }
                else if(startHoverPosi_X + widthHover*8 >= posiX)
                {
                    console.log("8")
                    led_8.visible = true
                    slotText_8.text_name.text = nameTemp
                    slotText_8.text_id.text = idTemp
                }
            }
        }
        //console.log("slot x : ", posiX, posiY)
    }

    function assignAxisToMidiSlot(posiX, posiY, s_groupId, s_subId, s_axisName)
    {
        //if(index !== midiGroup.count-1)
        if(index !== curIndex)
            return

        var selectNumber = 10
        if((startHoverPosi_Y<=posiY)&&( posiY <= startHoverPosi_Y+heightHover))
        {
            if(startHoverPosi_X <= posiX)
            {
                if(startHoverPosi_X + widthHover >= posiX)
                {
                    console.log("1")
                    selectNumber = 0
                    //slotText_1.text_id.text = s_groupId + "-" + s_subId
                    //slotText_1.text_name.text = s_axisName
                }
                else if(startHoverPosi_X + widthHover*2 >= posiX)
                {
                    console.log("2")
                   selectNumber = 1
                    //slotText_2.text_id.text = s_groupId + "-" + s_subId
                    //slotText_2.text_name.text = s_axisName
                }
                else if(startHoverPosi_X + widthHover*3 >= posiX)
                {
                    console.log("3")
                    selectNumber = 2
                    //slotText_3.text_id.text = s_groupId + "-" + s_subId
                    //slotText_3.text_name.text = s_axisName
                }
                else if(startHoverPosi_X + widthHover*4 >= posiX)
                {
                    console.log("4")
                    selectNumber = 3
                    //slotText_4.text_id.text = s_groupId + "-" + s_subId
                    //slotText_4.text_name.text = s_axisName
                }
                else if(startHoverPosi_X + widthHover*5 >= posiX)
                {
                    console.log("5")
                    selectNumber = 4
                    slotText_5.text_id.text = s_groupId + "-" + s_subId
                    slotText_5.text_name.text = s_axisName
                }
                else if(startHoverPosi_X + widthHover*6 >= posiX)
                {
                    console.log("6")
                    selectNumber = 5
                    //slotText_6.text_id.text = s_groupId + "-" + s_subId
                    //slotText_6.text_name.text = s_axisName
                }
                else if(startHoverPosi_X + widthHover*7 >= posiX)
                {
                    console.log("7")
                    selectNumber = 6
                    //slotText_7.text_id.text = s_groupId + "-" + s_subId
                    //slotText_7.text_name.text = s_axisName
                }
                else if(startHoverPosi_X + widthHover*8 >= posiX)
                {
                    console.log("8")
                    selectNumber = 7
                    //slotText_8.text_id.text = s_groupId + "-" + s_subId
                    //slotText_8.text_name.text = s_axisName
                }
            }

            if(selectNumber <= 7)
            {
                console.log("sel number : ", selectNumber)
                var idTemp = s_groupId + "-" + s_subId
                var nameTemp = s_axisName
                slot.set(selectNumber, {"assignId": idTemp, "assignName" : nameTemp})
            }

        }
    }


    Component.onCompleted: {
        mouseChangeXYsignal.connect(selectSlot)
        assignAxisToMidiSignal.connect(assignAxisToMidiSlot)
    }


    onYChanged: {
        console.log("change : ",x,y)
        midiX = x
        midiY = y
        midiZ = z
    }

    onWidthChanged: {
        newWHValueslot()
    }


    Image {
        id: midi_bg
        anchors.verticalCenter: parent.verticalCenter
        anchors.left: parent.left
        anchors.right: parent.right
        source: "../images/Midi/midi_bg.png"
        fillMode: Image.PreserveAspectFit

        Row {
            id: row
            anchors.left: midi_bg.left
            anchors.top: midi_bg.top


            anchors.leftMargin: 135* ratioW
            anchors.topMargin: 329* ratioH

            height: 61 * ratioH
            width: 882 * ratioW

            spacing: (width - (80 * ratioW)*8) / 7

            onSpacingChanged: console.log("spacing : " + spacing)

            MidiSlotText {
                id : slotText_1
                anchors.top : parent.top
                anchors.bottom: parent.bottom

                width: 80 * ratioW
                text_id.text : slot.get(0).assignId
                text_name.text : slot.get(0).assignName
            }

            MidiSlotText {
                id : slotText_2
                anchors.top : parent.top
                anchors.bottom: parent.bottom

                width: 80 * ratioW
                text_id.text : slot.get(1).assignId
                text_name.text : slot.get(1).assignName
            }
            MidiSlotText {
                id : slotText_3
                anchors.top : parent.top
                anchors.bottom: parent.bottom

                width: 80 * ratioW
                text_id.text : slot.get(2).assignId
                text_name.text : slot.get(2).assignName
            }
            MidiSlotText {
                id : slotText_4
                anchors.top : parent.top
                anchors.bottom: parent.bottom

                width: 80 * ratioW
                text_id.text : slot.get(3).assignId
                text_name.text : slot.get(3).assignName
            }
            MidiSlotText {
                id : slotText_5
                anchors.top : parent.top
                anchors.bottom: parent.bottom

                width: 80 * ratioW
                text_id.text : slot.get(4).assignId
                text_name.text : slot.get(4).assignName
            }
            MidiSlotText {
                id : slotText_6
                anchors.top : parent.top
                anchors.bottom: parent.bottom

                width: 80 * ratioW
                text_id.text : slot.get(5).assignId
                text_name.text : slot.get(5).assignName
            }
            MidiSlotText {
                id : slotText_7
                anchors.top : parent.top
                anchors.bottom: parent.bottom

                width: 80 * ratioW
                text_id.text : slot.get(6).assignId
                text_name.text : slot.get(6).assignName
            }
            MidiSlotText {
                id : slotText_8
                anchors.top : parent.top
                anchors.bottom: parent.bottom

                width: 80 * ratioW
                text_id.text : slot.get(7).assignId
                text_name.text : slot.get(7).assignName
            }
        }

        Image {
            id: led_1
            x: 115.5* ratioW
            y: 171* ratioH
            width: 122 * ratioW
            height: 466 * ratioH
            visible: false
            source: "../images/Midi/led_100.png"
            fillMode: Image.PreserveAspectFit

        }

        Image {
            id: led_2
            x: (115.5 + 114.45428)* ratioW
            y: 171* ratioH
            width: 122 * ratioW
            height: 466 * ratioH
            visible: false
            source: "../images/Midi/led_100.png"
            fillMode: Image.PreserveAspectFit
        }
        Image {
            id: led_3
            x: (115.5 + 114.45428*2)* ratioW
            y: 171* ratioH
            width: 122 * ratioW
            height: 466 * ratioH
            visible: false
            source: "../images/Midi/led_100.png"
            fillMode: Image.PreserveAspectFit
        }
        Image {
            id: led_4
            x: (115.5 + 114.45428*3)* ratioW
            y: 171* ratioH
            width: 122 * ratioW
            height: 466 * ratioH
            visible: false
            source: "../images/Midi/led_100.png"
            fillMode: Image.PreserveAspectFit
        }
        Image {
            id: led_5
            x: (115.5 + 114.45428*4)* ratioW
            y: 171* ratioH
            width: 122 * ratioW
            height: 466 * ratioH
            visible: false
            source: "../images/Midi/led_100.png"
            fillMode: Image.PreserveAspectFit
        }
        Image {
            id: led_6
            x: (115.5 + 114.45428*5)* ratioW
            y: 171* ratioH
            width: 122 * ratioW
            height: 466 * ratioH
            visible: false
            source: "../images/Midi/led_100.png"
            fillMode: Image.PreserveAspectFit
        }

        Image {
            id: led_7
            x: (115.5 + 114.45428*6)* ratioW
            y: 171* ratioH
            width: 122 * ratioW
            height: 466 * ratioH
            visible: false
            source: "../images/Midi/led_100.png"
            fillMode: Image.PreserveAspectFit
        }
        Image {
            id: led_8
            x: (115.5 + 114.45428*7)* ratioW
            y: 171* ratioH
            width: 122 * ratioW
            height: 466 * ratioH
            visible: false
            source: "../images/Midi/led_100.png"
            fillMode: Image.PreserveAspectFit
        }

        Text {
            id: text1
            color: "#f7f7f7"
            text: qsTr("AXIS MAPPING PAGE")
            anchors.verticalCenter: text2.verticalCenter
            anchors.left: parent.left
            font.pixelSize: 20
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            anchors.leftMargin: 130
            font.family: "HelveticaRounded"
        }

        Text {
            id: text2
            width: 160
            height: 50
            color: "#ffffff"
            text: page
            anchors.top: parent.top
            font.pixelSize: 36
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            anchors.topMargin: 80
            anchors.horizontalCenter: parent.horizontalCenter
            font.family: "HelveticaRounded-Black"
        }

        TextInput {
            id: textInput
            x: 243
            width: 200
            height: 36
            selectByMouse: true
            color: "#ffffff"
            text: qsTr("Text Input")
            inputMask: {"NNNNNNNNNN"}
            anchors.verticalCenter: text2.verticalCenter
            anchors.right: parent.right
            font.pixelSize: 24
            horizontalAlignment: Text.AlignRight
            verticalAlignment: Text.AlignVCenter
            anchors.rightMargin: 130
            font.family: "HYGothic-Extra"
        }

//button

/*
        Image {
            id: up_button
            x: 203
            y: 105
            source: "../images/Midi/UP_normal.png"
            fillMode: Image.PreserveAspectFit
            MouseArea{
                anchors.fill: parent
                hoverEnabled: true
                onEntered: {
                    up_button.source = "../images/Midi/UP_hover.png"
                }
                onExited: {
                    up_button.source = "../images/Midi/UP_normal.png"
                }
                onPressed: {
                    up_button.source = "../images/Midi/UP_press.png"
                }
                onReleased: {
                    up_button.source = "../images/Midi/UP_normal.png"
                }
                onClicked: {
                    if(pathView.currentIndex !== 0)
                    {
                        pathView.currentIndex = pathView.currentIndex - 1
                    }
                }
            }
        }
    }

    Image {
        id: dn_button
        x: 203
        y: 143
        source: (index === midiGroup.count-1)? "../images/Midi/AD_normal.png" : "../images/Midi/DN_normal.png"
        fillMode: Image.PreserveAspectFit

        MouseArea{
            anchors.fill: parent
            hoverEnabled: true
            onEntered: {
                dn_button.source = (index === midiGroup.count-1)?"../images/Midi/AD_hover.png" :"../images/Midi/DN_hover.png"
            }
            onExited: {
                dn_button.source = (index === midiGroup.count-1)?"../images/Midi/AD_normal.png" :"../images/Midi/DN_normal.png"
            }
            onPressed: {
                dn_button.source = (index === midiGroup.count-1)?"../images/Midi/AD_press.png" :"../images/Midi/DN_press.png"
            }
            onReleased: {
                dn_button.source = (index === midiGroup.count-1)?"../images/Midi/AD_normal.png" :"../images/Midi/DN_normal.png"
            }
            onClicked: {

                if(index === midiGroup.count-1){

                    newMidiPageSignal()


                    pathView.currentIndex = pathView.currentIndex+1
                }
                else
                {
                    pathView.currentIndex = pathView.currentIndex+1
                }
            }
        }
        */
    }


}

/*##^##
Designer {
    D{i:0;formeditorZoom:0.9}
}
##^##*/
