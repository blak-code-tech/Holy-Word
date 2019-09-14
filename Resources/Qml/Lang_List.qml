import QtQuick 2.12
import QtQuick.Layouts 1.12
import QtQuick.Controls 2.12

Component {
    Rectangle {
        width: parent.width
        height: 48

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
                text: qsTr(lang)
                font.family: "Microsoft New Tai Lue"
                font.pixelSize: 20

                contentItem: Text {
                    text: control.text
                    font: control.font
                    opacity: enabled ? 1.0 : 0.3
                    color: {
                        control.down ? "white" : "#95000000"
                        control.hovered ? "white" : "#95000000"
                    }
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    elide: Text.ElideRight
                }

                background: Rectangle {
                    implicitWidth: 100
                    implicitHeight: 40
                    opacity: enabled ? 1 : 0.3
                    color: control.hovered ? "#c0c0c0" : "white"
                    border.color: control.down ? "#17a81a" : "#50000000"
                    border.width: 1
                    radius: 2
                }

                onClicked: {
                    if (index === 0) {
                        pages.push(german)
                    } else if (index == 1) {
                        pages.push(english)
                    } else if (index === 2) {
                        pages.push(spanish)
                    } else if (index === 3) {
                        pages.push(french)
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
}
