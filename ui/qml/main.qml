import QtQuick 2.10
import QtGraphicalEffects 1.0
import QtQuick.Controls 2.3
import QtQuick.Window 2.3
import QtQuick.Dialogs 1.2

import org.nxos.welcomewizard 1.0 as WelcomeWizard

import org.kde.plasma.components 2.0 as PlasmaComponents

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
    
        MessageDialog {
        id: errorDialog

        title: "Error"
        icon: StandardIcon.Critical
        standardButtons: StandardButton.Ok
    }

    WelcomeWizard.ShellHelper {
        id: restartLatteShellHelper

        onCmdComplete: {
            console.log('RestartLatte :', returnCode);

            if (returnCode > 0) {
                errorDialog.text = "Error restarting Latte"
                errorDialog.visible = true;
            }
        }
    }
    
    Rectangle {
        id: footer
        height: 62
        color: "#2b2c31"
        
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.bottom: parent.bottom

        PlasmaComponents.Button {
            height: 32
            width: 96
            anchors.left: parent.left
            text: "Skip"
            anchors.verticalCenter: parent.verticalCenter
            anchors.leftMargin: 12
            visible: swipeView.currentIndex != (swipeView.count - 1)

            onClicked: {
                swipeView.setCurrentIndex(swipeView.count - 1)
            }
        }

        PlasmaComponents.CheckBox {
            height: 22
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
        
        PlasmaComponents.Button {
            height: 32
            width: 96
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
            width: 96
            anchors.right: parent.right
            text: "Finish"
            anchors.verticalCenter: parent.verticalCenter
            anchors.rightMargin: 12
            visible: swipeView.currentIndex == (swipeView.count - 1)

            onClicked: {
                Qt.quit();
                restartLatteShellHelper.runCommand("latte-dock --replace &");
            }
        }

    }
}
