import QtQuick 2.10
import QtQuick.Controls 2.3
import QtQuick.Dialogs 1.2

import org.nxos.welcomewizard 1.0 as WelcomeWizard

Page {
    width: 1280
    height: 840

    MessageDialog {
        id: errorDialog

        title: "Error"
        icon: StandardIcon.Critical
        standardButtons: StandardButton.Ok
    }

    WelcomeWizard.ShellHelper {
        id: softwareCenterShellHelper

        onCmdComplete: {
            console.log('SoftwareCenter :', returnCode);

            if (returnCode > 0) {
                errorDialog.text = "Error opening Software Center"
                errorDialog.visible = true;
            }
        }
    }

    WelcomeWizard.ShellHelper {
        id: nitruxCompendiumShellHelper

        onCmdComplete: {
            console.log('NitruxCompendium :', returnCode);

            if (returnCode > 0) {
                errorDialog.text = "Error opening Compendium"
                errorDialog.visible = true;
            }
        }
    }

    WelcomeWizard.ShellHelper {
        id: systemSettingsShellHelper

        onCmdComplete: {
            console.log('SystemSettings :', returnCode);

            if (returnCode > 0) {
                errorDialog.text = "Error opening System Settings"
                errorDialog.visible = true;
            }
        }
    }

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
        text: "Software Center"

        onClicked: {
            softwareCenterShellHelper.runCommand("nx_software_center");
        }
    }

    Button {
        height:32

        anchors.horizontalCenter: parent.horizontalCenter
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 128
        text: "Find Support"

        onClicked: {
            nitruxCompendiumShellHelper.runCommand("xdg-open https://nxos.org/en/compendium/#help-and-support");
        }
    }

    Button {
        height:32

        anchors.right: parent.right
        anchors.bottom: parent.bottom
        anchors.rightMargin: 64
        anchors.bottomMargin: 128
        text: "Open System Settings"

        onClicked: {
            systemSettingsShellHelper.runCommand("systemsettings5");
        }
    }
}
