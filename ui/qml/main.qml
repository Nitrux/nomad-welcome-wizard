import QtQuick 2.10
import QtQuick.Controls 2.3

ApplicationWindow {
    visible: true

    minimumWidth: 1024
    minimumHeight: 768
    maximumWidth: 1024
    maximumHeight: 768

    title: "MAUI Welcome Wizard"

    SwipeView {
        id: swipeView

        anchors.top: parent.top
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.bottom: footer.top

        Page1 {}
        Page2 {}
        Page3 {}
        Page4 {}
        Page5 {}
        Page6 {}
    }

    Rectangle {
        id: footer
        height: 48
        color: "#f8f8f8"

        anchors.left: parent.left
        anchors.right: parent.right
        anchors.bottom: parent.bottom

        Button {
            height: 24
            anchors.left: parent.left
            text: "Skip"
            anchors.verticalCenter: parent.verticalCenter
            anchors.leftMargin: 12

            onClicked: {
                var curIndex = swipeView.currentIndex
                swipeView.setCurrentIndex(curIndex > 0 ? --curIndex : 0)
            }
        }

        PageIndicator {
            id: indicator

            anchors.centerIn: footer

            count: swipeView.count
            currentIndex: swipeView.currentIndex
        }

        Button {
            height: 24
            anchors.right: parent.right
            text: "Next"
            anchors.verticalCenter: parent.verticalCenter
            anchors.rightMargin: 12

            onClicked: {
                var curIndex = swipeView.currentIndex
                swipeView.setCurrentIndex(curIndex < swipeView.count-1 ? ++curIndex : swipeView.count-1)
            }
        }
    }
}
