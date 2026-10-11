import QtQuick
import QtQuick.Shapes

Shape {
    id: root

    property int radius: 14
    property color color: "#436a38"
    property bool flipX: false
    property bool flipY: false

    implicitWidth: radius
    implicitHeight: radius

    preferredRendererType: Shape.CurveRenderer

    transform: Scale {
        origin.x: root.radius / 2
        origin.y: root.radius / 2
        xScale: root.flipX ? -1 : 1
        yScale: root.flipY ? -1 : 1
    }

    ShapePath {
        fillColor: root.color
        strokeWidth: -1

        startX: 0; startY: 0
        PathLine { x: root.radius; y: 0 }
        PathArc {
            x: 0; y: root.radius
            radiusX: root.radius; radiusY: root.radius
            direction: PathArc.Counterclockwise
        }
    }
}