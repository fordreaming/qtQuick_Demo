import QtQuick 2.2
import QtQuick.Controls 1.2

Rectangle {
    width: 320
    height: 240
    color: "#EEEEEE"
    id: rootItem
    property bool colorPickerShow : false

    Text {
        id: coloredText
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: parent.top
        anchors.topMargin: 4
        text: "Hello World"
        font.pixelSize: 32
    }

    Button {
        id: ctrlBtn
        text: "Show"
        anchors.left: parent.left
        anchors.leftMargin: 4
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 4

        onClicked: {
            if(rootItem.colorPickerShow) {
                redLoader.sourceComponent = undefined
                blueLoader.source = ""
                rootItem.colorPickerShow = false
                ctrlBtn.text = "Show"
            }else {
                redLoader.source = "Color_picker.qml"
                redLoader.item.colorPicked.connect(onPickedRed)
                blueLoader.source = "Color_picker.qml"
                blueLoader.item.colorPicked.connect(onPickedBlue)
                redLoader.focus = true
                rootItem.colorPickerShow = true
                ctrlBtn.text = "Hide"
            }
        }
    }
    Loader {
        id: redLoader
        anchors.left: ctrlBtn.right
        anchors.leftMargin: 4
        anchors.bottom: ctrlBtn.bottom

        KeyNavigation.right: blueLoader
        KeyNavigation.tab: blueLoader

        onLoaded: {
            if(item != null) {
                item.color = "red"
                item.focus = true
            }
        }

        onFocusChanged: {
            if(item != null) {
                item.focus = focus
            }
        }
    }

    Loader {
        id: blueLoader
        anchors.left: redLoader.right
        anchors.leftMargin: 4
        anchors.bottom: redLoader.bottom

        KeyNavigation.right: redLoader
        KeyNavigation.tab: redLoader

        onLoaded: {
            if(item != null) {
                item.color = "blue"
                item.focus = true
            }
        }

        onFocusChanged: {
            if(item != null) {
                item.focus = focus
            }
        }
    }

    function onPickedBlue(clr) {
        coloredText.color = clr
        if(!blueLoader.focus) {
            blueLoader.focus = true
            redLoader.focus = false
        }
    }

    function onPickedRed(clr) {
        coloredText.color = clr
        if(!redLoader.focus) {
            blueLoader.focus = true
            redLoader.focus = false
        }
    }

}
