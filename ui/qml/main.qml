import QtQuick 2.10
import QtGraphicalEffects 1.0
import QtQuick.Controls 2.3
import QtQuick.Window 2.3

import org.kde.plasma.components 2.0 as PlasmaComponents

ApplicationWindow {
    title: "Welcome Wizard"
    visible: true
    visibility: "FullScreen"

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
        height: 62
        color: "#3a3f41"
        opacity: 0.9

        anchors.left: parent.left
        anchors.right: parent.right
        anchors.bottom: parent.bottom

        PlasmaComponents.Button {
            height: 32
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
        
        PlasmaComponents.Button {
            height: 32
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
        
        PlasmaComponents.Button {
            height: 32
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
