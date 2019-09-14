import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12


Item {
    Rectangle {
        id: rectangle
        anchors.fill: parent
        Rectangle {
            height: 60
            width: parent.width
            Button {
                id: back
                width: 40
                height: 40
                anchors.verticalCenter: parent.verticalCenter
                Image {
                    anchors.top: parent.top
                    anchors.left: parent.left
                    anchors.margins: 4
                    source: "../img/back.png"
                }

                background: Rectangle {
                    implicitWidth: 100
                    implicitHeight: 40
                    opacity: enabled ? 1 : 0.3
                }
                onClicked: {
                    pages.pop()
                }
            }
        }
        ColumnLayout {
            anchors.centerIn: parent
            spacing: 50
            Text {
                id: lang
                Layout.alignment: Qt.AlignHCenter
                text: qsTr("Select Your Prefered Version")
                font.family: "Microsoft New Tai Lue"
                font.pixelSize: 35
                color: "#95000000"
            }
            RowLayout {
                id: versions
                spacing: 10
                Layout.alignment: Qt.AlignCenter

                Rectangle {
                    width: 400
                    height: 400
                    Button {
                        id: niv
                        text: "Schlachter"
                        anchors.fill: parent
                        font.family: "Microsoft New Tai Lue"
                        font.pixelSize: 25

                        contentItem: Text {
                            text: niv.text
                            font: niv.font
                            opacity: enabled ? 1.0 : 0.3

                            color: {
                                niv.down ? "white" : "#95000000"
                                niv.hovered ? "white" : "#95000000"
                            }
                            horizontalAlignment: Text.AlignHCenter
                            verticalAlignment: Text.AlignVCenter
                            elide: Text.ElideRight
                        }

                        background: Rectangle {
                            implicitWidth: 100
                            implicitHeight: 40
                            opacity: enabled ? 1 : 0.3
                            color: niv.hovered ? "#c0c0c0" : "white"
                            border.color: niv.down ? "#17a81a" : "#50000000"
                            border.width: 1
                            radius: 2
                        }

                        onClicked: {
                            bible.bible_text_ger(0, 0, 0)
                            pages.push(schlachter)
                        }
                    }
                }
            }
        }
    }
}

/*##^## Designer {
    D{i:0;autoSize:true;height:480;width:640}D{i:1;anchors_height:0;anchors_width:0}
}
 ##^##*/

