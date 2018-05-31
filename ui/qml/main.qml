import QtQuick 2.10
import QtQuick.Controls 2.3

ApplicationWindow {
    visible: true

    minimumWidth: 1280
    minimumHeight: 888
    maximumWidth: 1280
    maximumHeight: 888

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
            enabled: swipeView.currentIndex != (swipeView.count - 1)

            onClicked: {
                swipeView.setCurrentIndex(swipeView.count - 1)
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
            visible: swipeView.currentIndex != (swipeView.count - 1)

            onClicked: {
                var curIndex = swipeView.currentIndex
                swipeView.setCurrentIndex(curIndex < swipeView.count-1 ? ++curIndex : swipeView.count-1)
            }
        }

        Button {
            height: 24
            anchors.right: parent.right
            text: "Finish"
            anchors.verticalCenter: parent.verticalCenter
            anchors.rightMargin: 12
            visible: swipeView.currentIndex == (swipeView.count - 1)

            onClicked: {
                Qt.quit();
            }
        }
    }
}
