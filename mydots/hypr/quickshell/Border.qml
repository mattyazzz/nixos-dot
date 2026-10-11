import Quickshell
import Quickshell.Wayland
import QtQuick
import "./shi"

Scope {
    id: root
    property int thickness: 12
    property int barHeight: 30
    property int cornerRadius: 14
    property color colorbar: "#436a38"

    Variants {
        model: Quickshell.screens

        Scope {
            id: screenScope
            required property var modelData

            PanelWindow {
                screen: screenScope.modelData
                anchors { top: true; bottom: true; left: true }
                implicitWidth: root.thickness
                exclusiveZone: root.thickness
                color: root.colorbar
                WlrLayershell.layer: WlrLayer.Bottom
                WlrLayershell.namespace: "quickshell-border-left"
            }
            PanelWindow {
                screen: screenScope.modelData
                anchors { top: true; bottom: true; right: true }
                implicitWidth: root.thickness
                exclusiveZone: root.thickness
                color: root.colorbar
                WlrLayershell.layer: WlrLayer.Bottom
                WlrLayershell.namespace: "quickshell-border-right"
            }
            PanelWindow {
                screen: screenScope.modelData
                anchors { bottom: true; left: true; right: true }
                implicitHeight: root.thickness
                exclusiveZone: root.thickness
                color: root.colorbar
                WlrLayershell.layer: WlrLayer.Bottom
                WlrLayershell.namespace: "quickshell-border-bottom"
            }

            PanelWindow {
                screen: screenScope.modelData
                anchors { top: true; bottom: true; left: true; right: true }
                color: "transparent"
                exclusionMode: ExclusionMode.Ignore
                mask: Region {}
                WlrLayershell.namespace: "quickshell-border-corners"

                ConcaveCurves {
                    anchors {
                        top: parent.top; left: parent.left
                        topMargin: root.barHeight; leftMargin: root.thickness
                    }
                    radius: root.cornerRadius
                    color: root.colorbar
                }
                // arriba derecha
                ConcaveCurves {
                    flipX: true
                    anchors {
                        top: parent.top; right: parent.right
                        topMargin: root.barHeight; rightMargin: root.thickness
                    }
                    radius: root.cornerRadius
                    color: root.colorbar
                }
                ConcaveCurves {
                    flipY: true
                    anchors {
                        bottom: parent.bottom; left: parent.left
                        bottomMargin: root.thickness; leftMargin: root.thickness
                    }
                    radius: root.cornerRadius
                    color: root.colorbar
                }
                ConcaveCurves {
                    flipX: true; flipY: true
                    anchors {
                        bottom: parent.bottom; right: parent.right
                        bottomMargin: root.thickness; rightMargin: root.thickness
                    }
                    radius: root.cornerRadius
                    color: root.colorbar
                }
            }
        }
    }
}