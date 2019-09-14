import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12

Row {

    anchors.horizontalCenter: parent.horizontalCenter
    anchors.bottom: parent.bottom

    Button {
        id: black
        height: 25
        width: 40

        Image {
            anchors.verticalCenter: parent.verticalCenter
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.margins: 4
            width: 25
            height: 25
            source: "../img/black_highlight.png"
        }

        background: Rectangle {
            implicitWidth: 100
            implicitHeight: 40
            opacity: enabled ? 1 : 0.3
        }

        onClicked: {
            bible_text.selectionColor = "#000000"
            //bible_text.selectAll()
        }
    }

    Button {
        id: pink
        height: 25
        width: 40

        Image {
            anchors.verticalCenter: parent.verticalCenter
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.margins: 4
            width: 25
            height: 25
            source: "../img/pink_highlight.png"
        }

        background: Rectangle {
            implicitWidth: 100
            implicitHeight: 40
            opacity: enabled ? 1 : 0.3
        }

        onClicked: {
            bible_text.selectionColor = "#FF0033"
            //bible_text.selectAll()
        }
    }

    Button {
        id: blue
        height: 25
        width: 40

        Image {
            anchors.verticalCenter: parent.verticalCenter
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.margins: 4
            width: 25
            height: 25
            source: "../img/blue_highlight.png"
        }

        background: Rectangle {
            implicitWidth: 100
            implicitHeight: 40
            opacity: enabled ? 1 : 0.3
        }

        onClicked: {
            bible_text.selectionColor = "#3399CC"
            //bible_text.selectAll()
        }
    }

    Button {
        id: red
        height: 25
        width: 40

        Image {
            anchors.verticalCenter: parent.verticalCenter
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.margins: 4
            width: 25
            height: 25
            source: "../img/red_highlight.png"
        }

        background: Rectangle {
            implicitWidth: 100
            implicitHeight: 40
            opacity: enabled ? 1 : 0.3
        }

        onClicked: {
            bible_text.selectionColor = "#660000"
            //bible_text.selectAll()
        }
    }
}
