pragma Singleton

import QtQuick

QtObject {
    readonly property color bgColor : "#070707"


    //button
    readonly property color buttonMainColor : "#2a2d31"
    readonly property color buttonHoverColor : "#3c4148"
    readonly property color buttonPressedColor : "#f50057"
    readonly property color buttonSelectColor : "#bfbfbf"

    //text
    readonly property color textMainColor : "#c4c4c4"

    readonly property color textHoverColor : "#f50057"
    readonly property color textHoverColor_pink : "#fb5d89"
    readonly property color textHoverColor_green : "#02ed87"

    readonly property color textPressedColor : "#c4c4c4"
    readonly property color textPressedColor_pink : "#f50057"
    readonly property color textPressedColor_green : "#02ed87"

    readonly property color textFocusColor : "#f50057"
    readonly property color textSelectColor : "#000000"
    readonly property color textDeselectColor : "#4f5052"

    //box
    readonly property color boxBgColor : "#2a2d31"
    readonly property color listBgColor : "#000000"
    readonly property color listDeselBgColor : "#1d1f22"

}
