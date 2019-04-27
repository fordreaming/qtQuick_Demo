import QtQuick 2.2

Canvas {
    width: 400
    height: 240
    onPaint: {
        var ctx = getContext("2d")
        ctx.lineWidth = 2
        ctx.strokeStyle = "red"
        ctx.fillStyle = "blue"
        ctx.beginPath()
        ctx.rect(100, 80, 120, 80)
        ctx.fill()
        ctx.stroke()


        var gradient1 = ctx.createRadialGradient(230, 160, 30, 260, 200, 20)
        gradient1.addColorStop(0.0, Qt.rgba(1, 0, 0, 1.0))
        gradient1.addColorStop(1.0, Qt.rgba(0, 0, 1, 1.0))
        ctx.fillStyle = gradient1
        ctx.beginPath()
        ctx.rect(200, 140, 80, 80)
        ctx.fill()
        ctx.stroke()

    }
}
