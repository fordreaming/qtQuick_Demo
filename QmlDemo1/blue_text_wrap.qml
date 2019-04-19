import QtQuick 2.0

////普通文本
//Rectangle {
//    width: 320
//    height: 200
//    Text {
//        width: 150
//        height: 100
////        wrapMode: Text.WordWrap

//        font.bold: true
//        font.pixelSize: 24
//        font.underline: true
//        anchors.centerIn: parent
////        anchors.horizontalCenter: parent.horizontalCenter
////        anchors.verticalCenter: parent.verticalCenter
//        text: "Hello Blue Text"
//    }

//}

//富文本
Rectangle {
    width: 320
    height: 200
    Text {
        width: 150
        height: 100
        wrapMode: Text.WordWrap

        font.bold: true
        font.pixelSize: 24
        font.underline: true
        anchors.centerIn: parent
        text: "Hello Blue < font color = \"blue\"> Text</font>"
    }

}
