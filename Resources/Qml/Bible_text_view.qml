import QtQuick 2.12
import QtQuick.Layouts 1.12
import QtQuick.Controls 2.12

Component {
    Rectangle {
        width: parent.width
        height:

        Rectangle {
            anchors.top: parent.top
            anchors.margins: 4
            width: parent.width
            height: 44

            Button {
                //id: btn
                width: parent.width
                height: parent.height
                id: control
                text: qsTr(bible_chapter)
                font.family: "Segoe UI Semilight"
                font.pixelSize: 16

                contentItem: Text {
                    text: control.text
                    font: control.font
                    opacity: enabled ? 1.0 : 0.3
                    color: control.down ? "white" : "black"
                    //horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    wrapMode: Text.WordWrap
                }

                background: Rectangle {
                    implicitWidth: 100
                    implicitHeight: 40
                    opacity: enabled ? 1 : 0.3
                    color: control.down ? "#e1e1e1" : "transparent"
                }

                onClicked: {

                }
            }
            Rectangle {
                anchors.bottom: parent.bottom
                width: parent.width
                height: 1
                color: "#21000000"
            }
        }
    }
}
