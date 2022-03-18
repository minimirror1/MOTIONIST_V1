import QtQuick 2.15
import QtQuick.Controls 2.15

import "../MyColor"

Item {
    width: 1920
    height: 1080

    Rectangle {
        id: rectangle
        color: MyColors.boxBgColor
        radius: 10
        anchors.fill: parent
    }
}
