import "../config"

import QtQuick
import Quickshell
import Quickshell.Hyprland

Repeater {
    property color backgroundColor: Colors.surfaceContainer

    model: Hyprland.workspaces

    Rectangle {
        width: modelData.focused ? AppearanceConfig.workspaceWidth + 70 : AppearanceConfig.workspaceWidth
        height: AppearanceConfig.barHeight - AppearanceConfig.widgetHeightSubtraction
        color: modelData.focused ? Colors.primary : backgroundColor
        radius: AppearanceConfig.widgetRounding

        Behavior on width {
            NumberAnimation {
                duration: 200
                easing.type: Easing.OutSine
            }
        }

        Text {
            anchors.centerIn: parent

            font.family: AppearanceConfig.fontFamily
            font.pixelSize: AppearanceConfig.fontSize
            color: modelData.focused ? Colors.on_primary : Colors.on_surface

            text: modelData.id
        }

        MouseArea {
            anchors.fill: parent
            cursorShape: Qt.PointingHandCursor

            onClicked: {
                Hyprland.dispatch(`workspace ${modelData.id}`);
            }
        }
    }
}
