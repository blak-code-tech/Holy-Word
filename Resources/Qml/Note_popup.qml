import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12

Row {
    anchors.top: view.bottom
    anchors.right: ppp.right
    anchors.topMargin: 8
    width: ppp.width
    anchors.horizontalCenter: ppp.horizontalCenter
    spacing: 140
    Row {
        Button {
            id: underline

            width: 40
            height: 35

            ToolTip.visible: hovered
            ToolTip.text: qsTr("Underline")

            Image {
                anchors.verticalCenter: parent.verticalCenter
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.margins: 4
                width: 20
                height: 20
                source: "../img/underline.png"
            }

            background: Rectangle {
                implicitWidth: 100
                implicitHeight: 40
                opacity: enabled ? 1 : 0.3
            }

            property int num1: 0
            onClicked: {
                num1 += 1
                // note_area.font.underline = true
                if (num1 > 1) {
                    note_area.font.underline = false
                    num1 = 0
                }
                if (note_area.selectedText) {
                    note_area.font.underline = true
                }
            }
        }

        Button {
            id: bold

            width: 40
            height: 35
            ToolTip.visible: hovered
            ToolTip.text: qsTr("Bold")

            Image {
                anchors.verticalCenter: parent.verticalCenter
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.margins: 4
                width: 20
                height: 20
                source: "../img/bold.png"
            }

            background: Rectangle {
                implicitWidth: 100
                implicitHeight: 40
                opacity: enabled ? 1 : 0.3
            }

            property int num2: 0
            onClicked: {
                num2 += 1
                note_area.font.bold = true
                if (num2 > 1) {
                    note_area.font.bold = false
                    num2 = 0
                }
            }
        }
        Button {
            id: italic

            width: 40
            height: 35
            ToolTip.visible: hovered
            ToolTip.text: qsTr("Italic")

            Image {
                anchors.verticalCenter: parent.verticalCenter
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.margins: 4
                width: 20
                height: 20
                source: "../img/italic.png"
            }

            background: Rectangle {
                implicitWidth: 100
                implicitHeight: 40
                opacity: enabled ? 1 : 0.3
            }
            property int num3: 0
            onClicked: {
                num3 += 1
                note_area.font.italic = true
                if (num3 > 1) {
                    note_area.font.italic = false
                    num3 = 0
                }
            }
        }
    }
    Row {
        spacing: 5
        Button {
            id: me
            text: qsTr("Cancel")
            width: 100
            height: 35
            font.family: "Microsoft New Tai Lue"
            font.pixelSize: 16
            focus: true
            contentItem: Text {
                text: me.text
                font: me.font
                opacity: enabled ? 1.0 : 0.3
                color: "white"
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                elide: Text.ElideRight
            }
            background: Rectangle {
                implicitWidth: 100
                implicitHeight: 50
                opacity: enabled ? 1 : 0.3
                color: {
                    me.down ? "#FF3300" : "#FF3300"
                    me.hovered ? "#FF3300" : "#FF3300"
                }
                radius: 5
            }

            onClicked: {
                show_note.close()
            }
        }
        Button {
            id: you
            text: qsTr("Save")
            width: 100
            height: 35
            focus: true
            font.family: "Microsoft New Tai Lue"
            font.pixelSize: 16
            contentItem: Text {
                text: you.text
                font: you.font
                opacity: enabled ? 1.0 : 0.3
                color: "white"
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                elide: Text.ElideRight
            }
            background: Rectangle {
                implicitWidth: 100
                implicitHeight: 25
                opacity: enabled ? 1 : 0.3
                color: {
                    you.down ? "#00CC66" : "#00CC66"
                    you.hovered ? "#00CC66" : "#00CC66"
                }
                radius: 5
            }

            onClicked: {

            }
        }
    }
}
