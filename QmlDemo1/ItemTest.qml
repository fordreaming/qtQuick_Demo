import QtQuick 2.0

Rectangle {
    width: 200
    height: 200
    Item {
        id: gradientGroup;
        Rectangle {
            x: 20
            y: 20
            width: 120
            height: 120
            gradient: Gradient {
                    GradientStop { position: 0.0; color: "red" }
                    GradientStop { position: 1.0; color: "yellow" }
            }
        }
        Rectangle {
            x: 160
            y: 20
            width: 120
            height: 120
            rotation: 90
            gradient: Gradient {
                    GradientStop { position: 0.0; color: "red" }
                    GradientStop { position: 1.0; color: "yellow" }
            }

        }
    }
    Component.onCompleted: {
        console.log("visible children: ",
                    gradientGroup.visibleChildren.length)
        console.log("children:", gradientGroup.children.length);
        for(var i = 0; i < gradientGroup.children.length; i++) {
            console.log("child ", i, " x = ",
                        gradientGroup.children[i].x)
        }
    }
}
