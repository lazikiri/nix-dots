import "../config"

import QtQuick
import Quickshell

Scope {
    id: root
    property string time

    Variants {
        model: Quickshell.screens

        delegate: Component {
            PanelWindow {
                required property var modelData
                screen: modelData

                anchors {
                    top: true
                    right: true
                    left: true
                }

                implicitHeight: AppearanceConfig.barHeight

                color: Colors.surface

                // Left
                Rectangle {
                    anchors {
                        verticalCenter: parent.verticalCenter
                        left: parent.left
                        leftMargin: AppearanceConfig.barMargin
                    }

                    height: AppearanceConfig.barHeight - AppearanceConfig.widgetHeightSubtraction
                    width: leftRow.width + AppearanceConfig.widgetMargin
                    radius: AppearanceConfig.widgetRounding

                    color: Colors.surfaceContainer

                    Row {
                        id: leftRow

                        anchors.centerIn: parent

                        spacing: AppearanceConfig.barSpacing

                        Seperator {}
                        Network {}
                        Seperator {}
                        SysTray {}
                        Seperator {}
                    }
                }

                // Middle
                Rectangle {
                    id: middleRectangle

                    anchors {
                        verticalCenter: parent.verticalCenter
                        horizontalCenter: parent.horizontalCenter
                    }

                    height: AppearanceConfig.barHeight - AppearanceConfig.widgetHeightSubtraction
                    width: middleRow.width + AppearanceConfig.widgetMargin
                    radius: AppearanceConfig.widgetRounding

                    color: Colors.surfaceContainer

                    Row {
                        id: middleRow

                        anchors.centerIn: parent

                        Workspace {
                            backgroundColor: middleRectangle.color
                        }
                        // PowerProfile {}
                    }
                }

                // Right
                Rectangle {
                    anchors {
                        verticalCenter: parent.verticalCenter
                        right: parent.right
                        rightMargin: AppearanceConfig.barMargin
                    }

                    height: AppearanceConfig.barHeight - AppearanceConfig.widgetHeightSubtraction
                    width: rightRow.width + AppearanceConfig.widgetMargin
                    radius: AppearanceConfig.widgetRounding

                    color: Colors.surfaceContainer

                    Row {
                        id: rightRow

                        anchors.centerIn: parent

                        spacing: AppearanceConfig.barSpacing

                        Seperator {}
                        Audio {}
                        Seperator {}
                        Battery {}
                        Seperator {}
                        Clock {}
                        Seperator {}
                    }
                }
            }
        }
    }
}
