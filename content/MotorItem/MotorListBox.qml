import QtQuick 2.15
import QtQuick.Controls 2.15

import "../MyColor"

Item {
    id: listBoxItem
    width: 1536
    height: 30
    property alias rectangle1: rectangle1
    property alias rectangle: rectangle


    function nextTextinputFocusSlot(num)
    {
        if(num === subId){
            if(axisActive)
            {
                textInput_name.selectAll()
                textInput_name.focus = true
            }
            else
            {
                nextTextinputFocus(subId + 1)
            }
        }
    }


    Item {
        id: item1
        width: parent.width/4
        anchors.left: parent.left
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        anchors.topMargin: 0
        anchors.bottomMargin: 0

        Rectangle {
            id: rectangle
            color: MyColors.boxBgColor
            anchors.fill: parent
            anchors.rightMargin: 20
            anchors.leftMargin: 20

            Text {
                id: text_id
                color:MyColors.textMainColor
                text: groupId+"-"+subId
                anchors.left: parent.left
                anchors.top: parent.top
                anchors.bottom: parent.bottom
                font.pixelSize: 20
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                font.family: "Helvetica-Light"

                width: parent.width/10*2
            }

            Text {
                id: text_ac
                color:MyColors.textMainColor
                text: qsTr("AC")
                anchors.left: text_id.right
                anchors.top: parent.top
                anchors.bottom: parent.bottom
                font.pixelSize: 20
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                font.family: "Helvetica-Light"

                width: parent.width/10*3

                Component.onCompleted: {
                    text = Qt.binding(function(){
                        if(motorType === 1 )
                            return "AC"
                        else if(motorType === 2)
                            return "BLDC"
                        else
                            return ""
                    })
                }
            }

            TextInput {
                id: textInput_name
                color:MyColors.textMainColor
                text: (axisName.length === 0)? "TextInput" : axisName
                selectByMouse: true
                anchors.left: text_ac.right
                anchors.top: parent.top
                anchors.bottom: parent.bottom
                font.pixelSize: 20
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                font.family: "Helvetica-Light"

                width: parent.width/10*5

                onActiveFocusChanged: {
                    if(activeFocus)
                    {
                        selectAll()
                    }
                    else
                    {
                        axisName = text
                    }
                }
                Keys.onEnterPressed: {
                    deselect()
                    focus = false
                    axisName = text
                    initnumInput.focus = true
                    initnumInput.selectAll()
                }
                Keys.onTabPressed: {
                    deselect()
                    focus = false
                    initnumInput.focus = true
                    initnumInput.selectAll()
                }
                Keys.onBacktabPressed: {
                    deselect()
                    focus = false
                    //nextTextinputFocus(subId - 1)
                }
            }
        }
    }

    Item {
        id: item2
        anchors.left: item1.right
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.bottom: parent.bottom

        Rectangle {
            id: rectangle1
            x: -364
            y: 0
            color: MyColors.boxBgColor
            anchors.fill: parent
            anchors.leftMargin: 20
            anchors.rightMargin: 20

            TextInput {
                id: initnumInput
                width: parent.width/7
                color: MyColors.textMainColor
                text: (initNum.length === 0)? "0" : initNum
                selectByMouse: true
                anchors.left: parent.left
                anchors.top: parent.top
                anchors.bottom: parent.bottom
                font.pixelSize: 20
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                anchors.leftMargin: 0
                font.family: "Helvetica-Light"
                inputMask: {"00"}
                onActiveFocusChanged: {
                    if(activeFocus)
                    {
                        selectAll()
                    }
                    else
                    {
                        initNum = text
                    }
                }
                Keys.onEnterPressed: {
                    deselect()
                    initNum = text
                    rotBtn.focus = true
                    console.log("enter")
                }
                Keys.onTabPressed: {
                    deselect()
                    initNum = text
                    rotBtn.focus = true
                    console.log("tab")
                }
                Keys.onBacktabPressed: {
                    deselect()
                    initNum = text
                    textInput_name.focus = true
                    textInput_name.selectAll()
                }
            }
            Image {
                id: rotBtn
                width: parent.width/7
                anchors.left: initnumInput.right
                anchors.top: parent.top
                anchors.bottom: parent.bottom
                anchors.topMargin: 4
                anchors.bottomMargin: 4
                source: (rotDir === "CW")?"../images/Motor/CW.png":"../images/Motor/CCW.png"
                fillMode: Image.PreserveAspectFit

                MouseArea
                {
                    id:mouseArea
                    anchors.fill: parent
                    onClicked: {
                        if(rotDir === "CW")
                        {
                            rotDir = "CCW"
                            rotBtn.source = "../images/Motor/CCW.png"
                        }
                        else
                        {
                            rotDir = "CW"
                            rotBtn.source = "../images/Motor/CW.png"
                        }
                    }
                }
                Keys.onSpacePressed: {
                    if(rotDir === "CW")
                    {
                        rotDir = "CCW"
                        rotBtn.source = "../images/Motor/CCW.png"
                    }
                    else
                    {
                        rotDir = "CW"
                        rotBtn.source = "../images/Motor/CW.png"
                    }
                }

                Keys.onEnterPressed: {
                    initposiInput.focus = true
                    initposiInput.selectAll()
                    console.log("enter")
                }
                Keys.onTabPressed: {
                    initposiInput.focus = true
                    initposiInput.selectAll()
                    console.log("tab")
                }
                Keys.onBacktabPressed: {
                    initnumInput.focus = true
                    initnumInput.selectAll()
                }
            }

            TextInput {
                id: initposiInput
                width: parent.width/7
                color: MyColors.textMainColor
                text: (initPosi.length === 0)? "0" : initPosi
                selectByMouse: true
                anchors.left: rotBtn.right
                anchors.top: parent.top
                anchors.bottom: parent.bottom
                font.pixelSize: 20
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                anchors.leftMargin: 0
                font.family: "Helvetica-Light"
                inputMask: {"0000"}
                validator: IntValidator { bottom:0; top: 4095}
                onTextChanged: {
                    if(initposiInput.text >= 4095)
                        initposiInput.text = 4095
                }

                onActiveFocusChanged: {
                    if(activeFocus)
                    {
                        selectAll()
                    }
                    else
                    {
                        initPosi = text
                    }
                }
                Keys.onEnterPressed: {
                    deselect()
                    initPosi = text
                    rangeInput.focus = true
                    rangeInput.selectAll()
                    console.log("enter")
                }
                Keys.onTabPressed: {
                    deselect()
                    initPosi = text
                    rangeInput.focus = true
                    rangeInput.selectAll()
                    console.log("tab")
                }
                Keys.onBacktabPressed: {
                    deselect()
                    initPosi = text
                    rotInput.focus = true
                    rotInput.selectAll()
                }
            }
            TextInput {
                id: rangeInput
                width: parent.width/7
                color: MyColors.textMainColor
                text: (range.length === 0)? "0" : range
                selectByMouse: true
                anchors.left: initposiInput.right
                anchors.top: parent.top
                anchors.bottom: parent.bottom
                font.pixelSize: 20
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                anchors.leftMargin: 0
                font.family: "Helvetica-Light"
                maximumLength: 6
                //inputMask: {"000.00"}
                //validator: IntValidator { bottom:0; top: 36000}
                validator: DoubleValidator {
                                top: 360; // 100 is the maximum acceptable value (More than 100 its not acceptable & onAccepted will not be called).
                                bottom: 0;
                                decimals: 2;
                                notation: DoubleValidator.StandardNotation
                }

                onTextChanged: {
                    if(rangeInput.text >360)
                        rangeInput.text = 360


                }

                onActiveFocusChanged: {
                    if(activeFocus)
                    {
                        selectAll()
                    }
                    else
                    {
                        range = text
                    }
                }
                Keys.onEnterPressed: {
                    deselect()
                    range = text
                    gearInput.focus = true
                    gearInput.selectAll()
                    console.log("enter")
                }
                Keys.onTabPressed: {
                    deselect()
                    range = text
                    gearInput.focus = true
                    gearInput.selectAll()
                    console.log("tab")
                }
                Keys.onBacktabPressed: {
                    deselect()
                    range = text
                    initposiInput.focus = true
                    initposiInput.selectAll()
                }
            }
            TextInput {
                id: gearInput
                width: parent.width/7
                color: MyColors.textMainColor
                text: (gear.length === 0)? "0" : gear
                selectByMouse: true
                anchors.left: rangeInput.right
                anchors.top: parent.top
                anchors.bottom: parent.bottom
                font.pixelSize: 20
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                anchors.leftMargin: 0
                font.family: "Helvetica-Light"
                inputMask: {"000"}
                onActiveFocusChanged: {
                    if(activeFocus)
                    {
                        selectAll()
                    }
                    else
                    {
                        gear = text
                    }
                }
                Keys.onEnterPressed: {
                    deselect()
                    gear = text
                    if(text_ac.text !== "BLDC")
                    {
                        nextTextinputFocus(subId + 1)
                    }
                    else
                    {
                        cntInput.focus = true
                        cntInput.selectAll()
                    }
                    console.log("enter")
                }
                Keys.onTabPressed: {
                    deselect()
                    gear = text
                    if(text_ac.text !== "BLDC")
                    {
                        nextTextinputFocus(subId + 1)
                    }
                    else
                    {
                        cntInput.focus = true
                        cntInput.selectAll()
                    }
                    console.log("tab")
                }
                Keys.onBacktabPressed: {
                    deselect()
                    gear = text
                    rangeInput.focus = true
                    rangeInput.selectAll()
                }
            }

            //ac
            Text{
                id : cntTextac
                width: parent.width/7
                color: MyColors.textMainColor
                text: "10000 (fix)"
                anchors.left: gearInput.right
                anchors.top: parent.top
                anchors.bottom: parent.bottom
                font.pixelSize: 20
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                anchors.leftMargin: 0
                font.family: "Helvetica-Light"
                visible:(text_ac.text === "BLDC")? false : true
            }
            Text{
                id : rpmTextac
                width: parent.width/7
                color: MyColors.textMainColor
                text: "3000 (fix)"
                anchors.left: cntTextac.right
                anchors.top: parent.top
                anchors.bottom: parent.bottom
                font.pixelSize: 20
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                anchors.leftMargin: 0
                font.family: "Helvetica-Light"
                visible:(text_ac.text === "BLDC")? false : true
            }

            //bldc
            TextInput {
                id: cntInput
                width: parent.width/7
                color: MyColors.textMainColor
                text: (cnt.length === 0)? "0" : cnt
                selectByMouse: true
                anchors.left: gearInput.right
                anchors.top: parent.top
                anchors.bottom: parent.bottom
                font.pixelSize: 20
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                anchors.leftMargin: 0
                font.family: "Helvetica-Light"
                visible:(text_ac.text === "BLDC")? true : false
                inputMask: {"00000"}
                onActiveFocusChanged: {
                    if(activeFocus)
                    {
                        selectAll()
                    }
                    else
                    {
                        cnt = text
                    }
                }
                Keys.onEnterPressed: {
                    deselect()
                    cnt = text
                    rpmInput.focus = true
                    rpmInput.selectAll()
                    console.log("enter")
                }
                Keys.onTabPressed: {
                    deselect()
                    cnt = text
                    rpmInput.focus = true
                    rpmInput.selectAll()
                    console.log("tab")
                }
                Keys.onBacktabPressed: {
                    deselect()
                    cnt = text
                    gearInput.focus = true
                    gearInput.selectAll()
                }
            }
            TextInput {
                id: rpmInput
                width: parent.width/7
                color: MyColors.textMainColor
                text: (rpm.length === 0)? "0" : rpm
                selectByMouse: true
                anchors.left: cntInput.right
                anchors.top: parent.top
                anchors.bottom: parent.bottom
                font.pixelSize: 20
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                anchors.leftMargin: 0
                font.family: "Helvetica-Light"
                visible:(text_ac.text === "BLDC")? true : false
                inputMask: {"00000"}
                onActiveFocusChanged: {
                    if(activeFocus)
                    {
                        selectAll()
                    }
                    else
                    {
                        rpm = text
                    }
                }
                Keys.onEnterPressed: {
                    deselect()
                    rpm = text
                    console.log("enter")
                    nextTextinputFocus(subId + 1)
                }
                Keys.onTabPressed: {
                    deselect()
                    rpm = text
                    console.log("tab")
                    nextTextinputFocus(subId + 1)
                }
                Keys.onBacktabPressed: {
                    deselect()
                    rpm = text
                    cntInput.focus = true
                    cntInput.selectAll()
                }
            }

        }
    }
}

/*##^##
Designer {
    D{i:0;formeditorZoom:1.1}
}
##^##*/
