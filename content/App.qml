/****************************************************************************
**
** Copyright (C) 2021 The Qt Company Ltd.
** Contact: https://www.qt.io/licensing/
**
** This file is part of Qt Quick Studio Components.
**
** $QT_BEGIN_LICENSE:GPL$
** Commercial License Usage
** Licensees holding valid commercial Qt licenses may use this file in
** accordance with the commercial license agreement provided with the
** Software or, alternatively, in accordance with the terms contained in
** a written agreement between you and The Qt Company. For licensing terms
** and conditions see https://www.qt.io/terms-conditions. For further
** information use the contact form at https://www.qt.io/contact-us.
**
** GNU General Public License Usage
** Alternatively, this file may be used under the terms of the GNU
** General Public License version 3 or (at your option) any later version
** approved by the KDE Free Qt Foundation. The licenses are as published by
** the Free Software Foundation and appearing in the file LICENSE.GPL3
** included in the packaging of this file. Please review the following
** information to ensure the GNU General Public License requirements will
** be met: https://www.gnu.org/licenses/gpl-3.0.html.
**
** $QT_END_LICENSE$
**
****************************************************************************/

import QtQuick
import QtQuick.Window
import QtQuick.Controls

import QtQuick.Layouts

import MOTIONIST_V1

import "./MyColor"

ApplicationWindow {
    id:mainWindow
    width: 1536
    height: 864

    minimumWidth: 1536
    minimumHeight: 864



    visible: true
    title: "MOTIONIST_V1"

    //flags: Qt.Window|Qt.FramelessWindowHint


    ListModel{
        id : modelGroup

        //dynamicRoles: true

        //cacheBuffer : 65535

        ListElement{
            index : 0
            mode : 0        //type filter
            selected : 0
            groupId : 0
            groupName : ""
            baseType: []
            rcType:[]
            dyTtlType:[]
            dy485Type :[]
        }

/*
            baseType:[
                ListElement{
                    subId : 0;
                    active : 0;
                    name : qsTr("text input")
                    motorType : 0
                }
            ]

            rcType : [
                ListElement{
                    subId : 0;
                    active : 0;
                    name : qsTr("text input")
                }
            ]
*/

    }




     Component.onCompleted: {
     console.log("start")

//         modelGroup.append({
//                               index: modelGroup.count,
//                               mode : 0,
//                               selected : 0,
//                               groupId : 0,
//                               groupName : "",
//                               baseType : [],
//                               rcType : []
//                           })
     }

    Rectangle{
        anchors.fill:parent
        color:MyColors.bgColor
    }




    footer: Item{
        height: 40
        Rectangle{
            anchors.fill: parent
            color: MyColors.bgColor
        }

        TabBar{
            id:bar

            background : Rectangle{
                anchors.fill: parent
                color: MyColors.bgColor
            }

            width: parent.width*3/4
            anchors.right: parent.right
            height: 40
            TabButton{
                Text{
                    id : homeText
                    text : qsTr("HOME")
                    anchors.fill: parent
                    font.pixelSize: 15
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    color: MyColors.textMainColor
                }
                onFocusChanged: {
                    if(focus)
                        homeText.color = MyColors.textFocusColor
                    else
                        homeText.color = MyColors.textMainColor
                }
            }

            TabButton{
                                Text{
                    id : boardText
                    text : qsTr("BOARD")
                    anchors.fill: parent
                    font.pixelSize: 15
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    color: MyColors.textMainColor
                }
                onFocusChanged: {
                    if(focus)
                        boardText.color = MyColors.textFocusColor
                    else
                        boardText.color = MyColors.textMainColor
                }
            }            
            TabButton{

                Text{
                    id : motorText
                    text : qsTr("MOTOR")
                    anchors.fill: parent
                    font.pixelSize: 15
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    color: MyColors.textMainColor
                }
                onFocusChanged: {
                    if(focus)
                        motorText.color = MyColors.textFocusColor
                    else
                        motorText.color = MyColors.textMainColor
                }
            }
            TabButton{
                Text{
                    id : midiText
                    text : qsTr("MIDI")
                    anchors.fill: parent
                    font.pixelSize: 15
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    color: MyColors.textMainColor
                }
                onFocusChanged: {
                    if(focus)
                        midiText.color = MyColors.textFocusColor
                    else
                        midiText.color = MyColors.textMainColor
                }
            }
            TabButton{

                Text{
                    id : motionText
                    text : qsTr("MOTION")
                    anchors.fill: parent
                    font.pixelSize: 15
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    color: MyColors.textMainColor
                }
                onFocusChanged: {
                    if(focus)
                        motionText.color = MyColors.textFocusColor
                    else
                        motionText.color = MyColors.textMainColor
                }
            }
            TabButton{

                Text{
                    id : editText
                    text : qsTr("EDIT")
                    anchors.fill: parent
                    font.pixelSize: 15
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    color: MyColors.textMainColor
                }
                onFocusChanged: {
                    if(focus)
                        editText.color = MyColors.textFocusColor
                    else
                        editText.color = MyColors.textMainColor
                }
            }


        }
    }

    signal changeScreenSignal()

    StackLayout {
        anchors.left: parent.left
        anchors.right: parent.right
        //anchors.top: parent.top
        anchors.top : titleBar.bottom
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 0
        //anchors.topMargin: 60

        currentIndex: bar.currentIndex

        HomeScreen {
            id: homeScreen
            width:mainWindow.width
            height: mainWindow.height-120
            y : titleBar.height
        }
        BoardScreen {
            id: boardScreen
            width:mainWindow.width
            height: mainWindow.height-120
            y : titleBar.height
        }
        MotorScreen{
            id: motorScreen
            width:mainWindow.width
            height: mainWindow.height-120
            y : titleBar.height

            Component.onCompleted: {
                changeScreenSignal.connect(changeScreenSlot)
            }
        }

        onCurrentIndexChanged: {
            changeScreenSignal()
        }

    }

    TitleBar {
        id: titleBar
        anchors.right: parent.right
        anchors.left: parent.left
    }



}


/*##^##
Designer {
    D{i:0;autoSize:true;height:480;width:640}
}
##^##*/
