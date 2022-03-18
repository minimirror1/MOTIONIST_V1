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
    id:root
    width: 1536
    height: 864

    minimumWidth: 1536
    minimumHeight: 864



    visible: true
    title: "MOTIONIST_V1"

    Rectangle{
        anchors.fill:parent
        color:MyColors.bgColor
    }

    //flags: Qt.Window|Qt.FramelessWindowHint





    TitleBar {
        id: titleBar

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
                    id : motionText
                    text : qsTr("HOME")
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


    StackLayout {
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 0
        anchors.topMargin: 60

        currentIndex: bar.currentIndex

        HomeScreen {
            id: homeScreen
            width:root.width
            height: root.height-120
            y : titleBar.height
        }
        BoardScreen {
            id: boardScreen
            y : titleBar.height
        }

    }



}


/*##^##
Designer {
    D{i:0;autoSize:true;height:480;width:640}
}
##^##*/