import Quickshell
import Quickshell.Io
import Quickshell.Hyprland
import QtQuick
import QtQuick.Layouts
import Quickshell.Services.UPower
import QtQuick.Effects
import QtQuick.Shapes
import "./shi"

Scope {
    
    SystemClock {
        id: reloj
        precision: SystemClock.Seconds
    }

    Process {
        id: lanzador
        command: ["rofi", "-show", "drun"]
    }

    Variants {
        model: Quickshell.screens

        PanelWindow {
            required property var modelData
            screen: modelData
            anchors {
                top: true
                left: true
                right: true
            }
            property int barHeight: 30
            property color colorbar: '#436a38'

            implicitHeight: barHeight
            color: "transparent"
            exclusiveZone: barHeight

            mask: Region { item: bar }

            Rectangle {
                id: bar
                anchors.fill: parent
                color: colorbar

                RowLayout {
                    anchors.fill: parent
                    anchors.leftMargin: 12
                    anchors.rightMargin: 12

                    Rectangle {
                        width: 20
                        height: 20
                        color: "transparent"
                        Image {
                            id: logo
                            source: "file:///home/matyazy/nixos-dotfiles/mydots/images/icons/nixOs-ico.svg"
                            sourceSize.width: 20
                            sourceSize.height: 20
                            visible: false
                        }
                        MultiEffect {
                            source: logo
                            anchors.fill: parent
                            colorization: 1.0
                            colorizationColor: '#79bb6f'
                            brightness: 1
                        }
                        MouseArea {
                            anchors.fill: parent
                            onClicked: lanzador.running = true
                        }
                    }

                    Item { width: 1 }

                    Repeater {
                        model: Hyprland.workspaces.values

                        Rectangle {
                            required property var modelData
                            color: modelData.focused ? "#76ff69" : '#2a592a'
                            width: 10
                            height: 10
                            radius: 2
                            rotation: 45
                        }
                    }

                    Item { Layout.fillWidth: true }

                    Text {
                        text: Qt.formatDateTime(reloj.date, "ddd d MMM hh:mm ap")
                        color: "#f5e0dc"
                        font.pixelSize: 14
                        font.bold: true
                    }
                    Text {
                        text: {
                            let pila = UPower.displayDevice;
                            return pila ? Math.round(pila.percentage * 100) + "%" : "N/A"
                        }
                        color: '#254425'
                        font.pixelSize: 14
                        font.bold: true
                    }
                }
            }
        }
    }
}
