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
        id: softwareUpdaterShellHelper

        onCmdComplete: {
            console.log('SoftwareUpdater :', returnCode);

            if (returnCode > 0) {
                errorDialog.text = "Error opening Software Updater"
                errorDialog.visible = true;
            }
        }
    }

    WelcomeWizard.ShellHelper {
        id: driverInstallerShellHelper

        onCmdComplete: {
            console.log('DriverInstaller :', returnCode);

            if (returnCode > 0) {
                errorDialog.text = "Error Installing Nvidia Drivers"
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
        text: "Software Updater"

        onClicked: {
            softwareUpdaterShellHelper.runCommand("kcmshell5 org_nxos_softwareupdater1");
        }
    }

    Button {
        height:32

        anchors.horizontalCenter: parent.horizontalCenter
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 128
        text: "Install GPU Drivers"

        onClicked: {
            driverInstallerShellHelper.runCommand("konsole --noclose -e sudo apt install $(apt-cache search 'nvidia-[[:digit:]*]' | sort -r | head -n 1 | cut -d ' ' -f 1) nvidia-settings");
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
            driverInstallerShellHelper.runCommand("systemsettings5");
        }
    }
}
