import "../config"

import QtQuick
import Quickshell
import Quickshell.Io

Text {
    id: battery

    font.family: AppearanceConfig.fontFamily
    font.pixelSize: AppearanceConfig.fontSize
    color: Colors.on_surface

    Process {
        id: capacityProc

        command: ["cat", "/sys/class/power_supply/BAT1/capacity"]
        running: true

        stdout: StdioCollector {
            onStreamFinished: {
                battery.text = "󰁹 " + this.text.trim() + "%";
            }
        }
    }

    Timer {
        interval: 15000
        running: true
        repeat: true
        onTriggered: capacityProc.running = true
    }
}
