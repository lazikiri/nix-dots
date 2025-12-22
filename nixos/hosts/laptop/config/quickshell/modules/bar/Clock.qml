import "../config"
import "../services"

import QtQuick

Text {
    font.family: AppearanceConfig.fontFamily
    font.pixelSize: AppearanceConfig.fontSize
    color: Colors.on_surface

    text: Time.time
}
