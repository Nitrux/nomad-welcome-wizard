import QtQuick 2.10
import QtQuick.Controls 2.3

Page {
    width: 1024
    height: 768

    Image {
        anchors.fill: parent

        source: "images/backgrounds/page6.png"
    }

    Button {
        height:32

        anchors.left: parent.left
        anchors.bottom: parent.bottom
        anchors.leftMargin: 64
        anchors.bottomMargin: 128
        text: "Software Updater"
    }

    Button {
        height:32

        anchors.horizontalCenter: parent.horizontalCenter
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 128
        text: "Install GPU Drivers"
    }

    Button {
        height:32

        anchors.right: parent.right
        anchors.bottom: parent.bottom
        anchors.rightMargin: 64
        anchors.bottomMargin: 128
        text: "Open System Settings"
    }
}
