//从此例中可以看出anchors.fill: parent 和
//width: parent.width height: parent.height两句的功能相同
import QtQuick 2.7
import QtQuick.Controls 1.3

Item {
    width: 640
    height: 480
    Rectangle {
//        width: parent.width
//        height: parent.height
        anchors.fill: parent
        color: "green"
        Rectangle {
            width: 100
            height: 50
            color: "red"
        }
    }
}
