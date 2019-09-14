import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12

GridLayout {
    anchors.fill: parent
    columns: 4
    focus: true

    Rectangle {
        width: 200
        height: 100

        radius: 2

        Button {
            id: arabic
            text: "Arabic"
            anchors.fill: parent
            font.family: "Microsoft New Tai Lue"
            font.pixelSize: 25
            focus: true
            contentItem: Text {
                text: arabic.text
                font: arabic.font
                opacity: enabled ? 1.0 : 0.3

                color: {
                    arabic.down ? "white" : "#95000000"
                    arabic.hovered ? "white" : "#95000000"
                }
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                elide: Text.ElideRight
            }

            background: Rectangle {
                implicitWidth: 100
                implicitHeight: 40
                opacity: enabled ? 1 : 0.3
                color: arabic.hovered ? "#c0c0c0" : "white"
                border.color: arabic.down ? "#17a81a" : "#50000000"
                border.width: 1
            }

            onClicked: {
                pages.push(arabic_lang)
            }
        }
    }
    Rectangle {
        width: 200
        height: 100

        radius: 2

        Button {
            id: chinese
            text: "Chinese"
            anchors.fill: parent
            font.family: "Microsoft New Tai Lue"
            font.pixelSize: 25

            focus: true
            contentItem: Text {
                text: chinese.text
                font: chinese.font
                opacity: enabled ? 1.0 : 0.3

                color: {
                    chinese.down ? "white" : "#95000000"
                    chinese.hovered ? "white" : "#95000000"
                }
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                elide: Text.ElideRight
            }

            background: Rectangle {
                implicitWidth: 100
                implicitHeight: 40
                opacity: enabled ? 1 : 0.3
                color: chinese.hovered ? "#c0c0c0" : "white"
                border.color: chinese.down ? "#17a81a" : "#50000000"
                border.width: 1
            }
            onClicked: {
                pages.push(chinese_lang)
            }
        }
    }

    Rectangle {
        width: 200
        height: 100

        radius: 2

        Button {
            id: german
            text: "German"
            anchors.fill: parent
            font.family: "Microsoft New Tai Lue"
            font.pixelSize: 25

            focus: true
            contentItem: Text {
                text: german.text
                font: german.font
                opacity: enabled ? 1.0 : 0.3

                color: {
                    german.down ? "white" : "#95000000"
                    german.hovered ? "white" : "#95000000"
                }
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                elide: Text.ElideRight
            }

            background: Rectangle {
                implicitWidth: 100
                implicitHeight: 40
                opacity: enabled ? 1 : 0.3
                color: german.hovered ? "#c0c0c0" : "white"
                border.color: german.down ? "#17a81a" : "#50000000"
                border.width: 1
            }
            onClicked: {
                pages.push(german_lang)
            }
        }
    }
    Rectangle {
        width: 200
        height: 100
        radius: 2

        Button {
            id: greek
            text: "Greek"
            anchors.fill: parent
            font.family: "Microsoft New Tai Lue"
            font.pixelSize: 25
            focus: true
            contentItem: Text {
                text: greek.text
                font: greek.font
                opacity: enabled ? 1.0 : 0.3

                color: {
                    greek.down ? "white" : "#95000000"
                    greek.hovered ? "white" : "#95000000"
                }
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                elide: Text.ElideRight
            }

            background: Rectangle {
                implicitWidth: 100
                implicitHeight: 40
                opacity: enabled ? 1 : 0.3
                color: greek.hovered ? "#c0c0c0" : "white"
                border.color: greek.down ? "#17a81a" : "#50000000"
                border.width: 1
            }

            onClicked: {
                pages.push(greek_lang)
            }
        }
    }
    Rectangle {
        width: 200
        height: 100
        radius: 2

        Button {
            id: english
            text: "English"
            anchors.fill: parent
            font.family: "Microsoft New Tai Lue"
            font.pixelSize: 25
            focus: true
            contentItem: Text {
                text: english.text
                font: english.font
                opacity: enabled ? 1.0 : 0.3

                color: {
                    english.down ? "white" : "#95000000"
                    english.hovered ? "white" : "#95000000"
                }
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                elide: Text.ElideRight
            }

            background: Rectangle {
                implicitWidth: 100
                implicitHeight: 40
                opacity: enabled ? 1 : 0.3
                color: english.hovered ? "#c0c0c0" : "white"
                border.color: english.down ? "#17a81a" : "#50000000"
                border.width: 1
            }

            onClicked: {
                pages.push(english_lang)
            }
        }
    }
    Rectangle {
        width: 200
        height: 100

        radius: 2

        Button {
            id: esperanto
            text: "Esperanto"
            anchors.fill: parent
            font.family: "Microsoft New Tai Lue"
            font.pixelSize: 25

            focus: true
            contentItem: Text {
                text: esperanto.text
                font: esperanto.font
                opacity: enabled ? 1.0 : 0.3

                color: {
                    esperanto.down ? "white" : "#95000000"
                    esperanto.hovered ? "white" : "#95000000"
                }
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                elide: Text.ElideRight
            }

            background: Rectangle {
                implicitWidth: 100
                implicitHeight: 40
                opacity: enabled ? 1 : 0.3
                color: esperanto.hovered ? "#c0c0c0" : "white"
                border.color: esperanto.down ? "#17a81a" : "#50000000"
                border.width: 1
            }
            onClicked: {
                pages.push(esperanto_lang)
            }
        }
    }

    Rectangle {
        width: 200
        height: 100

        radius: 2

        Button {
            id: spanish
            text: "Spanish"
            anchors.fill: parent
            font.family: "Microsoft New Tai Lue"
            font.pixelSize: 25

            focus: true
            contentItem: Text {
                text: spanish.text
                font: spanish.font
                opacity: enabled ? 1.0 : 0.3

                color: {
                    spanish.down ? "white" : "#95000000"
                    spanish.hovered ? "white" : "#95000000"
                }
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                elide: Text.ElideRight
            }

            background: Rectangle {
                implicitWidth: 100
                implicitHeight: 40
                opacity: enabled ? 1 : 0.3
                color: spanish.hovered ? "#c0c0c0" : "white"
                border.color: spanish.down ? "#17a81a" : "#50000000"
                border.width: 1
            }
            onClicked: {
                pages.push(spanish_lang)
            }
        }
    }

    Rectangle {
        width: 200
        height: 100

        radius: 2

        Button {
            id: finnish
            text: "Finnish"
            anchors.fill: parent
            font.family: "Microsoft New Tai Lue"
            font.pixelSize: 25
            focus: true
            contentItem: Text {
                text: finnish.text
                font: finnish.font
                opacity: enabled ? 1.0 : 0.3

                color: {
                    finnish.down ? "white" : "#95000000"
                    finnish.hovered ? "white" : "#95000000"
                }
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                elide: Text.ElideRight
            }

            background: Rectangle {
                implicitWidth: 100
                implicitHeight: 40
                opacity: enabled ? 1 : 0.3
                color: finnish.hovered ? "#c0c0c0" : "white"
                border.color: finnish.down ? "#17a81a" : "#50000000"
                border.width: 1
            }

            onClicked: {
                pages.push(finnish_lang)
            }
        }
    }

    Rectangle {
        width: 200
        height: 100

        radius: 2

        Button {
            id: french
            text: "French"
            anchors.fill: parent
            font.family: "Microsoft New Tai Lue"
            font.pixelSize: 25
            focus: true
            contentItem: Text {
                text: french.text
                font: french.font
                opacity: enabled ? 1.0 : 0.3

                color: {
                    french.down ? "white" : "#95000000"
                    french.hovered ? "white" : "#95000000"
                }
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                elide: Text.ElideRight
            }

            background: Rectangle {
                implicitWidth: 100
                implicitHeight: 40
                opacity: enabled ? 1 : 0.3
                color: french.hovered ? "#c0c0c0" : "white"
                border.color: french.down ? "#17a81a" : "#50000000"
                border.width: 1
            }

            onClicked: {
                pages.push(french_lang)
            }
        }
    }
    Rectangle {
        width: 200
        height: 100

        radius: 2

        Button {
            id: korean
            text: "Korean"
            anchors.fill: parent
            font.family: "Microsoft New Tai Lue"
            font.pixelSize: 25

            focus: true
            contentItem: Text {
                text: korean.text
                font: korean.font
                opacity: enabled ? 1.0 : 0.3

                color: {
                    korean.down ? "white" : "#95000000"
                    korean.hovered ? "white" : "#95000000"
                }
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                elide: Text.ElideRight
            }

            background: Rectangle {
                implicitWidth: 100
                implicitHeight: 40
                opacity: enabled ? 1 : 0.3
                color: korean.hovered ? "#c0c0c0" : "white"
                border.color: korean.down ? "#17a81a" : "#50000000"
                border.width: 1
            }
            onClicked: {
                pages.push(korean_lang)
            }
        }
    }

    Rectangle {
        width: 200
        height: 100

        radius: 2

        Button {
            id: portuguese
            text: "Portuguese"
            anchors.fill: parent
            font.family: "Microsoft New Tai Lue"
            font.pixelSize: 25

            focus: true
            contentItem: Text {
                text: portuguese.text
                font: portuguese.font
                opacity: enabled ? 1.0 : 0.3

                color: {
                    portuguese.down ? "white" : "#95000000"
                    portuguese.hovered ? "white" : "#95000000"
                }
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                elide: Text.ElideRight
            }

            background: Rectangle {
                implicitWidth: 100
                implicitHeight: 40
                opacity: enabled ? 1 : 0.3
                color: portuguese.hovered ? "#c0c0c0" : "white"
                border.color: portuguese.down ? "#17a81a" : "#50000000"
                border.width: 1
            }
            onClicked: {
                pages.push(portuguese_lang)
            }
        }
    }
    Rectangle {
        width: 200
        height: 100
        radius: 2

        Button {
            id: romanian
            text: "Romanian"
            anchors.fill: parent
            font.family: "Microsoft New Tai Lue"
            font.pixelSize: 25
            focus: true
            contentItem: Text {
                text: romanian.text
                font: romanian.font
                opacity: enabled ? 1.0 : 0.3

                color: {
                    romanian.down ? "white" : "#95000000"
                    romanian.hovered ? "white" : "#95000000"
                }
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                elide: Text.ElideRight
            }

            background: Rectangle {
                implicitWidth: 100
                implicitHeight: 40
                opacity: enabled ? 1 : 0.3
                color: romanian.hovered ? "#c0c0c0" : "white"
                border.color: romanian.down ? "#17a81a" : "#50000000"
                border.width: 1
            }

            onClicked: {
                pages.push(romanian_lang)
            }
        }
    }

    Rectangle {
        width: 200
        height: 100

        radius: 2

        Button {
            id: russian
            text: "Russian"
            anchors.fill: parent
            font.family: "Microsoft New Tai Lue"
            font.pixelSize: 25

            focus: true
            contentItem: Text {
                text: russian.text
                font: russian.font
                opacity: enabled ? 1.0 : 0.3

                color: {
                    russian.down ? "white" : "#95000000"
                    russian.hovered ? "white" : "#95000000"
                }
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                elide: Text.ElideRight
            }

            background: Rectangle {
                implicitWidth: 100
                implicitHeight: 40
                opacity: enabled ? 1 : 0.3
                color: russian.hovered ? "#c0c0c0" : "white"
                border.color: russian.down ? "#17a81a" : "#50000000"
                border.width: 1
            }
            onClicked: {
                pages.push(russian_lang)
            }
        }
    }
    Rectangle {
        width: 200
        height: 100
        radius: 2

        Button {
            id: vietnamese
            text: "Vietnamese"
            anchors.fill: parent
            font.family: "Microsoft New Tai Lue"
            font.pixelSize: 25
            focus: true
            contentItem: Text {
                text: vietnamese.text
                font: vietnamese.font
                opacity: enabled ? 1.0 : 0.3

                color: {
                    vietnamese.down ? "white" : "#95000000"
                    vietnamese.hovered ? "white" : "#95000000"
                }
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                elide: Text.ElideRight
            }

            background: Rectangle {
                implicitWidth: 100
                implicitHeight: 40
                opacity: enabled ? 1 : 0.3
                color: vietnamese.hovered ? "#c0c0c0" : "white"
                border.color: vietnamese.down ? "#17a81a" : "#50000000"
                border.width: 1
            }

            onClicked: {
                pages.push(vietnamese_lang)
            }
        }
    }
}

/*##^## Designer {
    D{i:0;autoSize:true;height:480;width:640}
}
 ##^##*/

