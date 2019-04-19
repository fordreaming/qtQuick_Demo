import QtQuick 2.2

Rectangle {
    width: 320
    height: 240
    color: "#c0c0c0"

    Text {
        id: coloredText
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: parent.top
        anchors.topMargin: 4
        text: "Hello World"
        font.pixelSize: 32
    }

    Component {
        id: colorComponent
        Rectangle {
            id: colorPicker
            width: 50
            height: 30
            signal colorPicked(color clr);
            property Item loader
            border.width: focus ? 5 : 0
            border.color: focus ? "#90D750" : "#808080"
            MouseArea {
                anchors.fill: parent
//                onPressed: colorPicker.colorPicked(colorPicker.color)
                onClicked: {
                    colorPicker.colorPicked(colorPicker.color);
                    Loader.focus = true;
                }
            }
            Keys.onReturnPressed: {
                colorPicker.colorPicked(colorPicker.color);
                event.accpted = true;
            }
            Keys.onSpacePressed: {
                colorPicker.colorPicked(colorPicker.color);
                event.accpted = true;
            }
        }
    }

    Loader {
        id: redLoader
        width: 80
        height: 60
        focus: true
        anchors.left: parent.left
        anchors.leftMargin: 4
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 4
        //加载组件
        sourceComponent: colorComponent
        KeyNavigation.right: blueLoader
        KeyNavigation.tab: blueLoader
        onLoaded: {
            item.color = "red"
            item.focus = true
            item.loader = redLoader
        }
        onFocusChanged: {
            item.focus = focus
        }
    }

    Loader {
        id: blueLoader
        anchors.left: redLoader.right
        anchors.leftMargin: 4
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 4
        sourceComponent: colorComponent
        KeyNavigation.right: redLoader
        KeyNavigation.tab: redLoader
        onLoaded: {
            item.color = "blue"
            item.loader = blueLoader
        }
        onFocusChanged: {
            item.focus = focus
        }
    }

    Connections {
        target: redLoader.item
        onColorPicked: {
            coloredText.color = clr
        }
    }

    Connections {
        target: blueLoader.item
        onColorPicked: {
            coloredText.color = clr
        }
    }
}
