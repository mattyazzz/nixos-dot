import Quickshell
import Quickshell.Io
import QtQuick

PanelWindow {
    anchors{
        left: true
        top: true
        right: true
    }
    
    implicitHeight: 30

    Text {
        id: reloj

        anchors.centerIn: parent

        Process {
            id: dateProc
            command: ["date"]
            running: true
            stdout: StdioCollector {
                onStreamFinished: reloj.text = text
            }
        }
        Timer {
            interval: 1000
            running: true
            repeat: true
            onTriggered: dateProc.running = true
        }
    }
}