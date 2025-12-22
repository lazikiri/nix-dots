import "../config"

import QtQuick
import Quickshell

Text {
    font.family: AppearanceConfig.fontFamily
    font.pixelSize: AppearanceConfig.fontSize
    color: Colors.on_surface

    text: ""

    MouseArea {
        anchors.fill: parent
        cursorShape: Qt.PointingHandCursor

        onClicked: {
            Quickshell.execDetached(["kitty", "--", "nmtui"]);
        }
    }
}
