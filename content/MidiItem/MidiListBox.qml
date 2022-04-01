import QtQuick 2.15
import QtQuick.Controls 2.15

Item {
    id: midiListBox
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


    function newWHValueslot(){
        realWidth = midi_bg.width
        realHeight = midi_bg.height

        ratioW = realWidth / 1152
        ratioH = realHeight / 734
        console.log("change size : ",realWidth, realHeight)
        console.log("change ratio : ",ratioW, ratioH)
    }

    function selectSlot(posiX, posiY)
    {
        if((midiListBox.z !== 100)||(midiListBox.z === null))
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

        if((startHoverPosi_Y<=posiY)&&( posiY <= startHoverPosi_Y+heightHover))
        {
            if(startHoverPosi_X <= posiX)
            {
                if(startHoverPosi_X + widthHover >= posiX)
                {
                    console.log("1")
                    led_1.visible = true
                }
                else if(startHoverPosi_X + widthHover*2 >= posiX)
                {
                    console.log("2")
                    led_2.visible = true
                }
                else if(startHoverPosi_X + widthHover*3 >= posiX)
                {
                    console.log("3")
                    led_3.visible = true
                }
                else if(startHoverPosi_X + widthHover*4 >= posiX)
                {
                    console.log("4")
                    led_4.visible = true
                }
                else if(startHoverPosi_X + widthHover*5 >= posiX)
                {
                    console.log("5")
                    led_5.visible = true
                }
                else if(startHoverPosi_X + widthHover*6 >= posiX)
                {
                    console.log("6")
                    led_6.visible = true
                }
                else if(startHoverPosi_X + widthHover*7 >= posiX)
                {
                    console.log("7")
                    led_7.visible = true
                }
                else if(startHoverPosi_X + widthHover*8 >= posiX)
                {
                    console.log("8")
                    led_8.visible = true
                }
            }
        }
        //console.log("slot x : ", posiX, posiY)
    }



    Component.onCompleted: {
        mouseChangeXYsignal.connect(selectSlot)


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
                anchors.top : parent.top
                anchors.bottom: parent.bottom

                width: 80 * ratioW
                text_name.text : qsTr("dna")
                text_id.text : qsTr("1-1")
            }

            MidiSlotText {
                anchors.top : parent.top
                anchors.bottom: parent.bottom

                width: 80 * ratioW
                text_name.text : qsTr("dna")
                text_id.text : qsTr("1-1")
            }
            MidiSlotText {
                anchors.top : parent.top
                anchors.bottom: parent.bottom

                width: 80 * ratioW
                text_name.text : qsTr("dna")
                text_id.text : qsTr("1-1")
            }
            MidiSlotText {
                anchors.top : parent.top
                anchors.bottom: parent.bottom

                width: 80 * ratioW
                text_name.text : qsTr("dna")
                text_id.text : qsTr("1-1")
            }
            MidiSlotText {
                anchors.top : parent.top
                anchors.bottom: parent.bottom

                width: 80 * ratioW
                text_name.text : qsTr("dna")
                text_id.text : qsTr("1-1")
            }
            MidiSlotText {
                anchors.top : parent.top
                anchors.bottom: parent.bottom

                width: 80 * ratioW
                text_name.text : qsTr("dna")
                text_id.text : qsTr("1-1")
            }
            MidiSlotText {
                anchors.top : parent.top
                anchors.bottom: parent.bottom

                width: 80 * ratioW
                text_name.text : qsTr("dna")
                text_id.text : qsTr("1-1")
            }
            MidiSlotText {
                anchors.top : parent.top
                anchors.bottom: parent.bottom

                width: 80 * ratioW
                text_name.text : qsTr("dna")
                text_id.text : qsTr("1-1")
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
    }


}

/*##^##
Designer {
    D{i:0;formeditorZoom:4}
}
##^##*/
