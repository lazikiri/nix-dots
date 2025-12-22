import "../config"
import "../services"

import QtQuick
import Quickshell
import Quickshell.Services.Pipewire

Text {
    font.family: AppearanceConfig.fontFamily
    font.pixelSize: AppearanceConfig.fontSize
    color: Colors.on_surface

    text: " " + Audio.volumeLevel

    MouseArea {
        anchors.fill: parent
        cursorShape: Qt.PointingHandCursor

        onClicked: {
            Quickshell.execDetached(["kitty", "--", "wiremix"]);
        }
    }
}
