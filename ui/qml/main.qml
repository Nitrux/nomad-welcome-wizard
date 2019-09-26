import QtQuick 2.10
import QtQuick.Controls 2.3
import QtQuick.Window 2.3

import org.nxos.welcomewizard 1.0 as WelcomeWizard

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
        height: 48
        color: "#f8f8f8"

        anchors.left: parent.left
        anchors.right: parent.right
        anchors.bottom: parent.bottom

        Button {
            height: 32
            anchors.left: parent.left
            text: "Skip"
            anchors.verticalCenter: parent.verticalCenter
            anchors.leftMargin: 12
            visible: swipeView.currentIndex != (swipeView.count - 1)

            onClicked: {
                swipeView.setCurrentIndex(swipeView.count - 1)
            }
        }

        CheckBox {
            height: 32
            anchors.left: parent.left
            text: "Show on startup"
            anchors.verticalCenter: parent.verticalCenter
            anchors.leftMargin: 12
            visible: swipeView.currentIndex == (swipeView.count - 1) && WelcomeWizard.Helper.isAutostartEnabled()
            checked: true

            onClicked: {
                if (!this.checked) {
                    WelcomeWizard.Helper.disableAutostart();
                    this.visible = false;
                }
            }
        }

        PageIndicator {
            id: indicator

            anchors.centerIn: footer

            count: swipeView.count
            currentIndex: swipeView.currentIndex
        }

        Button {
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

        Button {
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
