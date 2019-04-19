import QtQuick 2.0
import QtQuick.Controls 1.2
import QtQuick.Controls.Styles 1.2

Rectangle {
    width: 300
    height: 200
    Button {
        id: btnQuit
        text: "Quit"
        anchors.centerIn: parent
        style: btnStyle
        onClicked: Qt.quit();
    }
    Button {
        text: "Start"
        anchors.right: btnQuit.left
        anchors.verticalCenter: parent.verticalCenter
        style: btnStyle
    }

    Component {
        id: btnStyle
        ButtonStyle {
            background: Rectangle {
                implicitWidth: 100;
                implicitHeight: 25;
                border.width: control.pressed ? 2 : 1;
                border.color: (control.hovered || control.pressed)
                                ? "green" : "#888888"
                color: (control.hovered || control.pressed)
                       ? "red" : "#888888"
            }
        }
    }
}
