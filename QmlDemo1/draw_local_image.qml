import QtQuick 2.2

Canvas {
    width: 400
    height: 300
    id: root
    property string dartlikeWeapon: "MerMaid.jpg";

    onPaint: {
        var ctx = getContext("2d");
        ctx.drawImage(dartlikeWeapon, 0, 0);

    }
//    Component.onCompleted: {
//        loadImage(dartlikeWeapon);
//    }
    Component.onCompleted: loadImage(dartlikeWeapon)

//    onImageLoaded: {
//        requestPaint();
//    }
    onImageLoaded: requestPaint();

}
