import QtQuick 2.15
import QtQuick.Controls 2.15

import "../MyColor"

Item {
    id: columnNameItem
    width: 1536
    height: 100

    Item {
        id: item1
        width: parent.width/4
        anchors.left: parent.left
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        anchors.topMargin: 0
        anchors.bottomMargin: 0

        Item {
            id: item3
            anchors.fill: parent
            anchors.rightMargin: 20
            anchors.leftMargin: 20

            Text {
                id: idColName
                x: -250
                y: 24
                color:MyColors.textMainColor
                text: qsTr("ID")
                anchors.verticalCenter: parent.verticalCenter
                anchors.left: parent.left
                font.pixelSize: 20
                horizontalAlignment: Text.AlignHCenter
                font.family: "HYGothic-Extra"

                width: parent.width/10*2
            }

            Text {
                id: nameColName
                x: -135
                y: 24
                color:MyColors.textMainColor
                text: qsTr("이름")
                anchors.verticalCenter: parent.verticalCenter
                anchors.left: typeColName.right
                anchors.right: parent.right
                font.pixelSize: 20
                horizontalAlignment: Text.AlignHCenter
                font.family: "HYGothic-Extra"
                width: parent.width/10*5
            }

            Text {
                id: typeColName
                x: -250
                y: 24
                color:MyColors.textMainColor
                text: qsTr("모터구분")
                anchors.verticalCenter: parent.verticalCenter
                anchors.left: idColName.right
                font.pixelSize: 20
                horizontalAlignment: Text.AlignHCenter
                font.family: "HYGothic-Extra"
                width: parent.width/10*3
            }
        }

    }

    Rectangle {
        id: rectangle
        x: parent.width/4
        width: 1

        color: "#ffffff"
        anchors.top: parent.top
        anchors.bottom: parent.bottom
    }

    Item {
        id: item2
        x: 384
        y: 0
        anchors.left: item1.right
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.bottom: parent.bottom

        Item {
            id: item4
            anchors.fill: parent
            anchors.rightMargin: 20
            anchors.leftMargin: 20

            Text {
                id: initnumColName
                x: -384
                y: 90
                width: parent.width/7
                color: MyColors.textMainColor
                text: qsTr("초기화 그룹")
                anchors.verticalCenter: parent.verticalCenter
                anchors.left: parent.left
                font.pixelSize: 20
                horizontalAlignment: Text.AlignHCenter
                font.family: "HYGothic-Extra"
            }

            Text {
                id: rotColName
                x: -385
                y: 80
                width: parent.width/7
                color: MyColors.textMainColor
                text: qsTr("원점방향")
                anchors.verticalCenter: parent.verticalCenter
                anchors.left: initnumColName.right
                font.pixelSize: 20
                horizontalAlignment: Text.AlignHCenter
                font.family: "HYGothic-Extra"
            }

            Text {
                id: initposiColName
                x: -388
                y: 83
                width: parent.width/7
                color: MyColors.textMainColor
                text: qsTr("초기위치")
                anchors.verticalCenter: parent.verticalCenter
                anchors.left: rotColName.right
                font.pixelSize: 20
                horizontalAlignment: Text.AlignHCenter
                font.family: "HYGothic-Extra"
            }

            Text {
                id: rangeColName
                x: -378
                y: 86
                width: parent.width/7
                color: MyColors.textMainColor
                text: qsTr("동작범위")
                anchors.verticalCenter: parent.verticalCenter
                anchors.left: initposiColName.right
                font.pixelSize: 20
                horizontalAlignment: Text.AlignHCenter
                font.family: "HYGothic-Extra"
            }

            Text {
                id: gearColName
                x: -383
                y: 81
                width: parent.width/7
                color: MyColors.textMainColor
                text: qsTr("감속비")
                anchors.verticalCenter: parent.verticalCenter
                anchors.left: rangeColName.right
                font.pixelSize: 20
                horizontalAlignment: Text.AlignHCenter
                font.family: "HYGothic-Extra"
            }

            Text {
                id: cntColName
                y: 91
                width: parent.width/7
                color: MyColors.textMainColor
                text: qsTr("한바퀴카운트")
                anchors.verticalCenter: parent.verticalCenter
                anchors.left: gearColName.right
                font.pixelSize: 20
                horizontalAlignment: Text.AlignHCenter
                font.family: "HYGothic-Extra"
            }

            Text {
                id: rpmColName
                x: -377
                y: 89
                width: parent.width/7
                color: MyColors.textMainColor
                text: qsTr("최대속도")
                anchors.verticalCenter: parent.verticalCenter
                anchors.right: parent.right
                font.pixelSize: 20
                horizontalAlignment: Text.AlignHCenter
                font.family: "HYGothic-Extra"
            }

            Text {
                id: initnumColUnit
                width: parent.width/7
                color: MyColors.textMainColor
                text: qsTr("(순서)")
                anchors.top: initnumColName.bottom
                font.pixelSize: 14
                horizontalAlignment: Text.AlignHCenter
                anchors.horizontalCenter: initnumColName.horizontalCenter
                font.family: "Malgun Gothic"
            }

            Text {
                id: rotColUnit
                width: parent.width/7
                color: MyColors.textMainColor
                text: qsTr("(CW/CCW)")
                anchors.top: rotColName.bottom
                font.pixelSize: 14
                horizontalAlignment: Text.AlignHCenter
                anchors.topMargin: 0
                font.family: "Malgun Gothic"
                anchors.horizontalCenter: rotColName.horizontalCenter
            }

            Text {
                id: initPosiColUnit
                width: parent.width/7
                color: MyColors.textMainColor
                text: qsTr("(posi)")
                anchors.top: initposiColName.bottom
                font.pixelSize: 14
                horizontalAlignment: Text.AlignHCenter
                font.family: "Malgun Gothic"
                anchors.horizontalCenter: initposiColName.horizontalCenter
            }

            Text {
                id: rangeColUnit
                width: parent.width/7
                color: MyColors.textMainColor
                text: qsTr("(000.00°)")
                anchors.top: rangeColName.bottom
                font.pixelSize: 14
                horizontalAlignment: Text.AlignHCenter
                anchors.topMargin: 0
                font.family: "Malgun Gothic"
                anchors.horizontalCenter: rangeColName.horizontalCenter
            }

            Text {
                id: cntColUnit
                width: parent.width/7
                color: MyColors.textMainColor
                text: qsTr("(cnt)")
                anchors.top: cntColName.bottom
                font.pixelSize: 14
                horizontalAlignment: Text.AlignHCenter
                font.family: "Malgun Gothic"
                anchors.horizontalCenter: cntColName.horizontalCenter
            }

            Text {
                id: rpmColUnit
                width: parent.width/7
                color: MyColors.textMainColor
                text: qsTr("(rpm)")
                anchors.top: rpmColName.bottom
                font.pixelSize: 14
                horizontalAlignment: Text.AlignHCenter
                anchors.topMargin: 0
                font.family: "Malgun Gothic"
                anchors.horizontalCenter: rpmColName.horizontalCenter
            }
        }
    }

}

/*##^##
Designer {
    D{i:0;formeditorZoom:0.75}D{i:3}D{i:4}D{i:5}D{i:2}D{i:9}D{i:10}D{i:11}D{i:12}D{i:13}
D{i:14}D{i:15}D{i:16}D{i:17}D{i:18}D{i:19}D{i:20}D{i:21}D{i:8}
}
##^##*/
