import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12

Item {

    Rectangle {
        anchors.fill: parent

        ScrollView {
            id: view
            anchors.fill: parent
            TextArea {
                id: note_area
                renderType: Text.NativeRendering
                textFormat: Text.RichText
                anchors.fill: parent
                placeholderText: qsTr("Enter your note here")
                hoverEnabled: true
                selectByKeyboard: true
                selectByMouse: true
            }
        }

        Row {
            anchors.top: view.bottom

            anchors.topMargin: 5
            anchors.horizontalCenter: parent.horizontalCenter
            spacing: 5

            Button {
                id: me
                text: qsTr("Cancel")
                width: 100
                height: 25
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
                    implicitHeight: 25
                    opacity: enabled ? 1 : 0.3
                    color: {
                        me.down ? "#FF3300" : "#FF3300"
                        me.hovered ? "#FF3300" : "#FF3300"
                    }
                    radius: 5
                }

                onClicked: {

                }
            }
            Button {
                id: you
                text: qsTr("Save")
                width: 100
                height: 25
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
}
