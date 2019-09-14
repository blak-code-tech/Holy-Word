import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12

Item {
    id: first
    Rectangle {
        width: mainWindow.width
        height: mainWindow.height
        Text {
            id: mytxt
            anchors.centerIn: parent
            text: qsTr("Holy Words")
            font.family: "Microsoft New Tai Lue"
            font.pixelSize: 120
            color: "#e1e1e1"

            ColorAnimation on color {
                from: "#e1e1e1"
                to: "black"
                duration: 3000
            }
        }

        Timer {
            interval: 6000
            running: true

            onTriggered: {

                pages.push(langs)

                //bible.english_kjv()
            }
        }
    }
}
