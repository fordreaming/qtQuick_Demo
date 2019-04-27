import QtQuick 2.7
import QtQuick.Controls 1.3
import QtQuick.Layouts 1.1

Rectangle {

    property alias imgZoomIn: imgZoomIn
    width: 640
    height: 480
    //发送退出到start Detect界面的信号
    signal exit()
    //2d对象
    property var ctx
    property var imgData
    Row {
        id: imgZoomIn
        anchors.fill: parent
        spacing: 5

        //左边原始图像显示列
        Column {
           id: leftCol
           width: parent.width / 2
           height: parent.height
           spacing: 50
           anchors.left: parent.left
           anchors.top: parent.top
           Text {
               id: textClick
               width: parent.width
               height: 30
               text: qsTr("click and query zoom in image")
               horizontalAlignment: Text.AlignHCenter
               font.pointSize: 13
               anchors.left: parent.left
           }
           Canvas {
               id: originalImage
               width: parent.width
               height: 400
               anchors.top: textClick.bottom
               property string imgName: "MerMaid.jpg"
               //绘制矩形框
               onPaint: {
                   ctx = getContext("2d")
                   imgData = ctx.getImageData(imgName)
                   ctx.drawImage(imgName, 0, 0);
                   ctx.lineWidth = 2;
                   ctx.strokeStyle = "red";
                   ctx.beginPath();
                   ctx.rect(width/2 - 60, height/2 - 40, 120, 80);
                   ctx.stroke();
               }
               MouseArea {
                   anchors.fill: parent
               }

               Component.onCompleted: loadImage(imgName)
               onImageLoaded: requestPaint()
           }
           Row {
               //左箭头
               width: parent.width
               height: 40
               spacing: 30
               anchors.left: parent.left
               anchors.bottom: parent.bottom
               Button {
                   id: leftArrow
                   width: 80
                   height: 30
                   text: "left arrow"
                   anchors.left: parent.left
                   anchors.top: parent.top
                   onClicked: {

                   }
               }
               //右箭头
               Button {
                   id: rightArrow
                   width: 80
                   height: 30
                   text: "right arrow"
                   anchors.left: leftArrow.right
                   anchors.leftMargin: 5
               }
               //打开图片
               Button {
                   id: openImg
                   width: 80
                   height: 30
                   text: "open image"
                   anchors.left: rightArrow.right
                   anchors.leftMargin: 5
               }
               //图片重载
               Button {
                   id: reLoadImg
                   width: 80
                   height: 30
                   text: "reLoad image"
                   anchors.left: openImg.right
                   anchors.leftMargin: 5
               }
           }
        }
        //右边放大图像部分
        Column {
            id: rightCol
            width: parent.width / 2
            height: parent.height
            spacing: 10
            anchors.left: leftCol.right
            anchors.leftMargin: 5


            Text {
                id: textZoom
                text: qsTr("image zoomin zone")
                width: parent.width
                height: 30
                font.pointSize: 13
                horizontalAlignment: Text.AlignHCenter
            }
            Canvas {
                id: zoomInImg
                width: parent.width
                height: 400
                anchors.top: textZoom.bottom
                onPaint: {
                    ctx1 = getContext("2d")
                    ctx1.drawImage(imgData)
                    ctx1.stroke()
                }
            }
            Row {
                width: parent.width
                height: 30
                spacing: 100
                anchors.top: zoomInImg.bottom

                Button {
                    width: parent.width / 4
                    height: parent.height
                    text: qsTr("zoom in")
                    anchors.top: parent.top
                }
                Button {
                    width: parent.width / 4
                    height: parent.height
                    text: qsTr("zoom out")
                }
            }
            Button {
                width: 100
                height: 50
                anchors.bottom: parent.bottom
                anchors.right: parent.right
                text: qsTr("Backward")
                onClicked: {
                    exit()
                }
            }

        }
    }
}
