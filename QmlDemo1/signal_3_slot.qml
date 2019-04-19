import QtQuick 2.0

Rectangle {
    id: relay
    signal messageReceived(string person, string notice);

    function sendToPost(person, notice) {
        console.log("Sending to Post: " + person + "," + notice);
    }
    function sendToTelegraph(person, notice) {
        console.log("Sending to Telegraph: " + person + "," + notice);
    }
    function sendToEmail(person, notice) {
        console.log("Sending to Email: " + person + "," + notice);
    }

    Component.onCompleted: {
        relay.messageReceived.connect(sendToPost);
        relay.messageReceived.connect(sendToTelegraph);
        relay.messageReceived.connect(sendToEmail);
        relay.messageReceived.connect("Tom", "Happy Birthday");
    }


}
