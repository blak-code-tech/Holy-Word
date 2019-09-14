import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12

Item {
    property alias book: book
    property alias verse: verse
    property alias chapter: chapter
    property int talk: 0

    focus: true
    Keys.onPressed: {
        if (event.key === Qt.Key_Right) {
            if ((chapter.currentIndex + 1) > 0) {
                previous_chapter.visible = true
            }

            if ((chapter.currentIndex + 1) < chap_) {
                verse.currentIndex = 0

                bible.bible_text_rvr(book.currentIndex,
                                     chapter.currentIndex += 1,
                                     verse.currentIndex)

                bible.verse_list(book.currentIndex, chapter.currentIndex)

                previous_verse.visible = false
            }
            next_verse.visible = true

            if ((chapter.currentIndex + 1) === chap_) {
                next_chapter.visible = false
            } else {
                next_chapter.visible = true
            }
            event.accepted = true
        }

        if (event.key === Qt.Key_Up) {
            if ((verse.currentIndex + 1) > 0) {
                previous_verse.visible = true
            }

            if ((verse.currentIndex + 1) < verse_) {
                bible.bible_text_rvr(book.currentIndex, chapter.currentIndex,
                                     verse.currentIndex += 1)
            }

            if ((verse.currentIndex + 1) === verse_) {
                next_verse.visible = false
            } else {
                next_verse.visible = true
            }

            event.accepted = true
        }

        if (event.key === Qt.Key_Down) {
            if (verse.currentIndex > 0) {
                bible.bible_text_rvr(book.currentIndex, chapter.currentIndex,
                                     verse.currentIndex -= 1)
            }

            next_verse.visible = true

            if (verse.currentIndex === 0) {
                previous_verse.visible = false
            }
        }

        if (event.key === Qt.Key_Left) {
            next_verse.visible = true

            if (chapter.currentIndex > 0) {
                verse.currentIndex = 0
                bible.bible_text_rvr(book.currentIndex,
                                     chapter.currentIndex -= 1,
                                     verse.currentIndex)

                bible.verse_list(book.currentIndex, chapter.currentIndex)

                previous_verse.visible = false
            }

            next_chapter.visible = true

            if ((chapter.currentIndex) === 0) {
                previous_chapter.visible = false
            }
            event.accepted = true
        }
    }

    Rectangle {
        id: rectangle
        anchors.fill: parent

        Rectangle {
            id: menu
            height: 0.1 * mainWindow.height
            width: parent.width
            //color: "#993366"
            Shortcut {
                sequence: Qt.Key_Right
                context: Qt.ApplicationShortcut
                onActivated: Qt.quit()
            }

            Button {
                id: back
                width: 40
                height: 40
                anchors.verticalCenter: parent.verticalCenter
                anchors.left: parent.left
                anchors.leftMargin: 5
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
                    radius: 5
                }
                onClicked: {
                    pages.pop()
                }
            }

            Row {
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.verticalCenter: parent.verticalCenter
                spacing: 3
                ComboBox {
                    id: book
                    model: list
                    font.family: "Microsoft New Tai Lue"
                    font.pixelSize: 15
                    width: 150
                    editable: true

                    delegate: ItemDelegate {
                        width: book.width
                        contentItem: Text {
                            text: modelData
                            color: "#95000000"
                            font: book.font
                            elide: Text.ElideRight
                            verticalAlignment: Text.AlignVCenter
                        }
                        highlighted: book.highlightedIndex === index
                    }

                    background: Rectangle {
                        implicitWidth: 120
                        implicitHeight: 40
                        border.color: "#80c0c0c0"
                        border.width: book.visualFocus ? 2 : 1
                        radius: 5
                    }

                    popup: Popup {
                        y: book.height - 1
                        width: book.width
                        implicitHeight: contentItem.implicitHeight
                        padding: 1

                        contentItem: ListView {
                            clip: true
                            implicitHeight: contentHeight
                            model: book.popup.visible ? book.delegateModel : null
                            currentIndex: book.highlightedIndex

                            ScrollIndicator.vertical: ScrollIndicator {}
                        }

                        background: Rectangle {
                            border.color: "#80c0c0c0"
                            radius: 5
                        }
                    }

                    onAccepted: {
                        bible.chapter_list(currentIndex)
                        bible.verse_list(currentIndex, chapter.currentIndex)
                        bible.bible_text_rvr(book.currentIndex,
                                             chapter.currentIndex,
                                             verse.currentIndex)

                        if ((verse.currentIndex + 1) > 0) {
                            previous_verse.visible = true
                        }

                        if (verse.currentIndex === 0) {
                            previous_verse.visible = false
                        }

                        if ((verse.currentIndex + 1) === verse_) {
                            next_verse.visible = false
                        } else {
                            next_verse.visible = true
                        }

                        if ((chapter.currentIndex + 1) > 0) {
                            previous_chapter.visible = true
                        }

                        if ((chapter.currentIndex) === 0) {
                            previous_chapter.visible = false
                        }

                        if ((chapter.currentIndex + 1) === chap_) {
                            next_chapter.visible = false
                        } else {
                            next_chapter.visible = true
                        }
                    }

                    onActivated: {

                        bible.chapter_list(currentIndex)
                        bible.verse_list(currentIndex, chapter.currentIndex)
                        bible.bible_text_rvr(book.currentIndex,
                                             chapter.currentIndex,
                                             verse.currentIndex)

                        if ((verse.currentIndex + 1) > 0) {
                            previous_verse.visible = true
                        }

                        if (verse.currentIndex === 0) {
                            previous_verse.visible = false
                        }

                        if ((verse.currentIndex + 1) === verse_) {
                            next_verse.visible = false
                        } else {
                            next_verse.visible = true
                        }

                        if ((chapter.currentIndex + 1) > 0) {
                            previous_chapter.visible = true
                        }

                        if ((chapter.currentIndex) === 0) {
                            previous_chapter.visible = false
                        }

                        if ((chapter.currentIndex + 1) === chap_) {
                            next_chapter.visible = false
                        } else {
                            next_chapter.visible = true
                        }
                    }
                }
                ComboBox {
                    id: chapter
                    font.family: "Microsoft New Tai Lue"
                    font.pixelSize: 15
                    displayText: 1 + currentIndex
                    model: chap_

                    delegate: ItemDelegate {
                        width: book.width
                        contentItem: Text {

                            text: 1 + modelData
                            color: "#95000000"
                            font: book.font
                            elide: Text.ElideRight
                            verticalAlignment: Text.AlignVCenter
                        }
                        highlighted: book.highlightedIndex === index
                    }

                    background: Rectangle {
                        implicitWidth: 120
                        implicitHeight: 40
                        border.color: "#80c0c0c0"
                        border.width: chapter.visualFocus ? 2 : 1
                        radius: 5
                    }

                    popup: Popup {
                        y: chapter.height - 1
                        width: chapter.width
                        implicitHeight: contentItem.implicitHeight
                        padding: 1

                        contentItem: ListView {
                            clip: true
                            implicitHeight: contentHeight
                            model: chapter.popup.visible ? chapter.delegateModel : null
                            currentIndex: chapter.highlightedIndex

                            ScrollIndicator.vertical: ScrollIndicator {}
                        }

                        background: Rectangle {
                            border.color: "#80c0c0c0"
                            radius: 5
                        }
                    }

                    onActivated: {
                        bible.verse_list(book.currentIndex, currentIndex)
                        bible.bible_text_rvr(book.currentIndex,
                                             chapter.currentIndex,
                                             verse.currentIndex)

                        if ((chapter.currentIndex + 1) > 0) {
                            previous_chapter.visible = true
                        }

                        if ((chapter.currentIndex) === 0) {
                            previous_chapter.visible = false
                        }

                        if ((chapter.currentIndex + 1) === chap_) {
                            next_chapter.visible = false
                        } else {
                            next_chapter.visible = true
                        }

                        if ((verse.currentIndex + 1) > 0) {
                            previous_verse.visible = true
                        }

                        if (verse.currentIndex === 0) {
                            previous_verse.visible = false
                        }

                        if ((verse.currentIndex + 1) === verse_) {
                            next_verse.visible = false
                        } else {
                            next_verse.visible = true
                        }
                    }
                }
                ComboBox {
                    id: verse
                    font.family: "Microsoft New Tai Lue"
                    font.pixelSize: 15
                    displayText: 1 + currentIndex
                    model: verse_

                    delegate: ItemDelegate {
                        width: book.width
                        contentItem: Text {
                            text: 1 + modelData
                            color: "#95000000"
                            font: book.font
                            elide: Text.ElideRight
                            verticalAlignment: Text.AlignVCenter
                        }
                        highlighted: book.highlightedIndex === index
                    }

                    background: Rectangle {
                        implicitWidth: 120
                        implicitHeight: 40
                        border.color: "#80c0c0c0"
                        border.width: verse.visualFocus ? 2 : 1
                        radius: 5
                    }

                    popup: Popup {
                        y: verse.height - 1
                        width: verse.width
                        implicitHeight: contentItem.implicitHeight
                        padding: 1

                        contentItem: ListView {
                            clip: true
                            implicitHeight: contentHeight
                            model: verse.popup.visible ? verse.delegateModel : null
                            currentIndex: verse.highlightedIndex

                            ScrollIndicator.vertical: ScrollIndicator {}
                        }

                        background: Rectangle {
                            border.color: "#80c0c0c0"
                            radius: 5
                        }
                    }

                    onActivated: {
                        bible.bible_text_rvr(book.currentIndex,
                                             chapter.currentIndex, currentIndex)

                        if ((verse.currentIndex + 1) > 0) {
                            previous_verse.visible = true
                        }

                        if (verse.currentIndex === 0) {
                            previous_verse.visible = false
                        }

                        if ((verse.currentIndex + 1) === verse_) {
                            next_verse.visible = false
                        } else {
                            next_verse.visible = true
                        }
                    }
                }
            }

            Button {

                id: control1
                width: 80
                anchors.verticalCenter: parent.verticalCenter

                anchors.right: parent.right
                anchors.margins: 5

                Image {
                    id: open_menu
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.horizontalCenter: parent.horizontalCenter
                    anchors.margins: 4
                    source: "../img/menu.png"
                }

                background: Rectangle {
                    implicitWidth: 100
                    implicitHeight: 40
                    opacity: enabled ? 1 : 0.3
                    radius: 5
                }

                onPressed: {
                    drawer.open()
                }
            }

            Drawer {
                id: drawer
                width: 500
                height: mainWindow.height
                edge: Qt.RightEdge
                Rectangle {

                    anchors.fill: parent

                    Rectangle {
                        id: xlose
                        anchors.bottom: parent.bottom
                        height: 0.08 * mainWindow.height
                        width: parent.width

                        Button {
                            id: closemenu

                            width: 40
                            height: 40
                            anchors.verticalCenter: parent.verticalCenter

                            //anchors.margins: 15
                            Image {

                                source: "../img/close.png"
                                width: 32
                                height: 32
                                anchors.horizontalCenter: parent.horizontalCenter
                                anchors.verticalCenter: parent.verticalCenter
                            }

                            background: Rectangle {
                                implicitWidth: 100
                                implicitHeight: 40
                                opacity: enabled ? 1 : 0.3
                                radius: 5
                            }

                            onClicked: {
                                drawer.close()
                            }
                        }
                    }
                    // addy tinz
                    Rectangle {
                        id: my_grid
                        anchors.top: parent.top
                        height: 0.6 * mainWindow.height
                        width: parent.width
                        color: "salmon"
                        focus: true

                        TabBar {
                            id: bar
                            width: parent.width
                            TabButton {
                                text: qsTr("Favourites")
                            }
                            TabButton {
                                text: qsTr("Notes")
                            }
                            TabButton {
                                text: qsTr("Activity")
                            }
                        }

                        StackLayout {
                            width: parent.width
                            height: parent.height - bar.height
                            currentIndex: bar.currentIndex
                            anchors.bottom: parent.bottom

                            Rectangle {
                                Layout.fillWidth: parent.width
                                Layout.fillHeight: parent.height
                                color: "dodgerblue"
                            }

                            Rectangle {
                                Layout.fillWidth: parent.width
                                Layout.fillHeight: parent.height


                                /*ScrollView {
                                    anchors.fill: parent

                                }*/
                            }

                            Rectangle {
                                Layout.fillWidth: parent.width
                                Layout.fillHeight: parent.height
                                color: "gold"
                            }
                        }
                    }
                }
            }
        }

        Rectangle {
            id: content
            anchors.top: menu.bottom
            height: 0.9 * mainWindow.height
            width: mainWindow.width

            Frame {
                id: frame
                width: 0.8 * mainWindow.width
                height: 0.7 * mainWindow.height
                anchors.centerIn: parent

                background: Rectangle {
                    color: "transparent"
                    border.color: "#80c0c0c0"
                    radius: 5
                }

                // Component.onCompleted: votd.visible = true
                Rectangle {
                    id: rect
                    anchors.fill: parent
                    clip: true
                    Button {
                        id: read_chapter
                        visible: !portrait
                        width: 40
                        anchors.right: parent.right
                        ToolTip.visible: hovered
                        ToolTip.text: qsTr("Read chapter")

                        Image {
                            anchors.verticalCenter: parent.verticalCenter
                            anchors.horizontalCenter: parent.horizontalCenter
                            anchors.margins: 4
                            width: 20
                            height: 20
                            source: "../img/read_chapter.png"
                        }

                        background: Rectangle {
                            implicitWidth: 100
                            implicitHeight: 40
                            opacity: enabled ? 1 : 0.3
                        }

                        onClicked: {

                            if (talk === 0) {

                                say.speak_chapter_niv(book.currentIndex,
                                                      chapter.currentIndex)
                                talk += 1
                            } else {
                                say.mute()
                                talk = 0
                            }
                        }
                    }
                    Button {
                        id: read
                        visible: !portrait
                        width: 40
                        anchors.right: read_chapter.left
                        ToolTip.visible: hovered
                        ToolTip.text: qsTr("Read verse")

                        Image {
                            anchors.verticalCenter: parent.verticalCenter
                            anchors.horizontalCenter: parent.horizontalCenter
                            anchors.margins: 4
                            width: 20
                            height: 20
                            source: "../img/read25.png"
                        }

                        background: Rectangle {
                            implicitWidth: 100
                            implicitHeight: 40
                            opacity: enabled ? 1 : 0.3
                        }

                        onClicked: {
                            if (talk === 0) {

                                say.speak_verse_niv(book.currentIndex,
                                                    chapter.currentIndex,
                                                    verse.currentIndex)
                                talk += 1
                            } else {
                                say.mute()
                                talk = 0
                            }
                        }
                    }

                    Button {
                        id: read_chapter2
                        visible: portrait
                        width: 40
                        anchors.right: parent.right
                        ToolTip.visible: hovered
                        ToolTip.text: qsTr("Read chapter")

                        Image {
                            anchors.verticalCenter: parent.verticalCenter
                            anchors.horizontalCenter: parent.horizontalCenter
                            anchors.margins: 4
                            width: 22
                            height: 22
                            source: "../img/read_chapter.png"
                        }

                        background: Rectangle {
                            implicitWidth: 100
                            implicitHeight: 40
                            opacity: enabled ? 1 : 0.3
                        }

                        onClicked: {
                            if (talk === 0) {

                                say.speak_chapter_niv(book.currentIndex,
                                                      chapter.currentIndex)
                                talk += 1
                            } else {
                                say.mute()
                                talk = 0
                            }
                        }
                    }
                    Button {
                        id: read2
                        visible: portrait
                        width: 40
                        anchors.right: read_chapter2.left
                        ToolTip.visible: hovered
                        ToolTip.text: qsTr("Read verse")

                        Image {
                            anchors.verticalCenter: parent.verticalCenter
                            anchors.horizontalCenter: parent.horizontalCenter
                            anchors.margins: 4
                            width: 22
                            height: 22
                            source: "../img/read25.png"
                        }

                        background: Rectangle {
                            implicitWidth: 100
                            implicitHeight: 40
                            opacity: enabled ? 1 : 0.3
                        }

                        onClicked: {
                            if (talk === 0) {

                                say.speak_verse_niv(book.currentIndex,
                                                    chapter.currentIndex,
                                                    verse.currentIndex)
                                talk += 1
                            } else {
                                say.mute()
                                talk = 0
                            }
                        }
                    }

                    Highlight {}

                    ////////////Popup for mote taking///////
                    Dialog {
                        id: show_note
                        title: qsTr("Note on " + (book.currentText) + " "
                                    + (chapter.currentIndex + 1) + " : " + (verse.currentIndex + 1))
                        anchors.centerIn: parent
                        height: 450
                        width: 500
                        modal: true
                        font.pixelSize: 16
                        font.family: "Microsoft New Tai Lue"
                        background: Rectangle {
                            color: "#E0E0E0"
                        }
                        enter: Transition {
                            NumberAnimation {
                                property: "opacity"
                                from: 0
                                to: 1.0
                            }
                        }
                        exit: Transition {
                            NumberAnimation {
                                property: "opacity"
                                from: 1.0
                                to: 0
                            }
                        }
                        contentItem: Rectangle {

                            ScrollView {
                                id: view
                                height: 330
                                width: parent.width
                                background: Rectangle {
                                    color: "#20E0E0E0"
                                }

                                TextArea {
                                    id: note_area
                                    height: parent.height

                                    font.family: "Microsoft New Tai Lue"
                                    font.pixelSize: 18
                                    placeholderText: qsTr(
                                                         "Enter your note here")
                                    hoverEnabled: true

                                    textFormat: Text.RichText
                                    selectByKeyboard: true
                                    selectByMouse: true
                                    wrapMode: "WordWrap"
                                }
                            }

                            Row {
                                anchors.top: view.bottom
                                anchors.right: parent.right
                                anchors.topMargin: 8
                                width: parent.width
                                anchors.horizontalCenter: parent.horizontalCenter
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
                        }
                    }

                    Button {
                        id: take_note
                        visible: !portrait
                        width: 40
                        anchors.bottom: parent.bottom
                        anchors.right: fav.left
                        ToolTip.visible: hovered
                        ToolTip.text: qsTr("Note")

                        Image {
                            anchors.verticalCenter: parent.verticalCenter
                            anchors.horizontalCenter: parent.horizontalCenter
                            anchors.margins: 4
                            width: 20
                            height: 20
                            source: "../img/pen.png"
                        }

                        background: Rectangle {
                            implicitWidth: 100
                            implicitHeight: 40
                            opacity: enabled ? 1 : 0.3
                        }

                        onClicked: {
                            show_note.open()
                        }
                    }
                    Button {
                        id: take_note1
                        visible: portrait
                        width: 40
                        anchors.bottom: parent.bottom
                        anchors.right: fav.left
                        ToolTip.visible: hovered
                        ToolTip.text: qsTr("Note")

                        Image {
                            anchors.verticalCenter: parent.verticalCenter
                            anchors.horizontalCenter: parent.horizontalCenter
                            anchors.margins: 4
                            width: 22
                            height: 22
                            source: "../img/pen.png"
                        }

                        background: Rectangle {
                            implicitWidth: 100
                            implicitHeight: 40
                            opacity: enabled ? 1 : 0.3
                        }

                        onClicked: {
                            show_note.open()
                        }
                    }
                    Button {
                        id: fav

                        width: 40
                        anchors.bottom: parent.bottom
                        anchors.right: parent.right
                        ToolTip.visible: hovered
                        ToolTip.text: qsTr("Add to favourite")

                        Image {
                            anchors.verticalCenter: parent.verticalCenter
                            anchors.horizontalCenter: parent.horizontalCenter
                            anchors.margins: 4
                            width: 22
                            height: 22
                            source: "../img/like.png"
                        }

                        background: Rectangle {
                            implicitWidth: 100
                            implicitHeight: 40
                            opacity: enabled ? 1 : 0.3
                        }

                        onClicked: {
                            visible = false
                            fav_clicked.visible = true


                            /*favourite.add(book.currentIndex,
                                          chapter.currentIndex,
                                          verse.currentIndex)*/
                        }
                    }
                    Button {
                        id: fav_clicked
                        visible: false
                        width: 40
                        anchors.bottom: parent.bottom
                        anchors.right: parent.right
                        ToolTip.visible: hovered
                        ToolTip.text: qsTr("Favourite")

                        Image {
                            anchors.verticalCenter: parent.verticalCenter
                            anchors.horizontalCenter: parent.horizontalCenter
                            anchors.margins: 4
                            width: 22
                            height: 22
                            source: "../img/like_clicked.png"
                        }

                        background: Rectangle {
                            implicitWidth: 100
                            implicitHeight: 40
                            opacity: enabled ? 1 : 0.3
                        }

                        onClicked: {
                            visible = false
                            fav.visible = true
                        }
                    }

                    Button {
                        id: copy_
                        width: 40
                        visible: !portrait
                        ToolTip.visible: hovered
                        ToolTip.text: qsTr("Copy")
                        anchors.right: read.left

                        Image {
                            anchors.verticalCenter: parent.verticalCenter
                            anchors.horizontalCenter: parent.horizontalCenter
                            anchors.margins: 4
                            width: 20
                            height: 20
                            source: "../img/copy25.png"
                        }

                        background: Rectangle {
                            implicitWidth: 100
                            implicitHeight: 40
                            opacity: enabled ? 1 : 0.3
                        }

                        onPressed: {
                            bible_text.copy()
                        }
                    }
                    Button {

                        id: copy2_
                        width: 40
                        visible: portrait
                        anchors.right: read2.left
                        ToolTip.visible: hovered
                        ToolTip.text: qsTr("Copy")

                        Image {
                            anchors.verticalCenter: parent.verticalCenter
                            anchors.horizontalCenter: parent.horizontalCenter
                            anchors.margins: 4
                            width: 22
                            height: 22
                            source: "../img/copy25.png"
                        }

                        background: Rectangle {
                            implicitWidth: 100
                            implicitHeight: 40
                            opacity: enabled ? 1 : 0.3
                        }

                        onPressed: {
                            bible_text.copy()
                        }
                    }
                    Text {
                        id: book_name
                        width: 680
                        text: qsTr((book.currentText) + " " + (chapter.currentIndex + 1)
                                   + " : " + (verse.currentIndex + 1))
                        verticalAlignment: Text.AlignVCenter
                        horizontalAlignment: Text.AlignHCenter
                        fontSizeMode: Text.VerticalFit
                        anchors.horizontalCenter: parent.horizontalCenter
                        height: 50
                        font.family: "Microsoft New Tai Lue"
                        font.pixelSize: 32
                        anchors.top: parent.top
                        wrapMode: Text.WordWrap
                    }

                    Rectangle {

                        height: 0.8 * parent.height
                        clip: true
                        anchors.horizontalCenter: parent.horizontalCenter
                        width: 0.85 * parent.width
                        anchors.top: book_name.bottom

                        ScrollView {
                            clip: true
                            anchors.fill: parent
                            ScrollBar.vertical.interactive: true
                            TextArea {
                                id: bible_text
                                height: 350
                                selectByMouse: true
                                clip: true
                                text: qsTr(txt4)
                                onTextChanged: OpacityAnimator {
                                    target: bible_text
                                    from: 0.7
                                    to: 1
                                    duration: 800
                                    running: true
                                }
                                activeFocusOnPress: true
                                readOnly: true
                                horizontalAlignment: Text.AlignLeft
                                font.family: "Microsoft New Tai Lue"
                                font.pixelSize: 32
                                wrapMode: Text.WordWrap
                            }
                        }
                    }
                }
            }

            Button {
                id: next_chapter
                width: 40
                height: 80
                anchors.verticalCenter: parent.verticalCenter
                anchors.right: parent.right
                anchors.rightMargin: 5
                focus: true
                ToolTip.delay: 1000
                ToolTip.timeout: 5000
                ToolTip.visible: hovered
                ToolTip.text: qsTr("Chapter " + (chapter.currentIndex + 2).toString(
                                       ))

                Image {
                    width: 40
                    height: 40
                    anchors.verticalCenter: parent.verticalCenter
                    fillMode: Image.PreserveAspectFit
                    anchors.margins: 4
                    source: "../img/next.png"
                }

                background: Rectangle {
                    implicitWidth: 100
                    implicitHeight: 40
                    opacity: enabled ? 1 : 0.3
                    color: {

                        next_chapter.down ? "#c0c0c0" : "#90c0c0c0"
                        next_chapter.hovered ? "#c0c0c0" : "#90c0c0c0"
                    }
                    radius: 5
                }
                onClicked: {

                    if ((chapter.currentIndex + 1) > 0) {
                        previous_chapter.visible = true
                    }

                    if ((chapter.currentIndex + 1) < chap_) {
                        verse.currentIndex = 0

                        bible.bible_text_rvr(book.currentIndex,
                                             chapter.currentIndex += 1,
                                             verse.currentIndex)

                        bible.verse_list(book.currentIndex,
                                         chapter.currentIndex)

                        previous_verse.visible = false
                    }
                    next_verse.visible = true

                    if ((chapter.currentIndex + 1) === chap_) {
                        next_chapter.visible = false
                    } else {
                        next_chapter.visible = true
                    }
                }
            }

            Button {
                id: previous_chapter

                width: 40
                height: 80
                visible: false
                anchors.verticalCenter: parent.verticalCenter
                anchors.left: parent.left
                anchors.leftMargin: 5
                focus: true
                hoverEnabled: true

                ToolTip.delay: 1000
                ToolTip.timeout: 5000
                ToolTip.visible: hovered
                ToolTip.text: qsTr("Chapter " + (chapter.currentIndex).toString(
                                       ))

                Image {
                    height: 40
                    width: 40
                    anchors.verticalCenter: parent.verticalCenter
                    fillMode: Image.PreserveAspectFit
                    anchors.margins: 4
                    source: "../img/previous.png"
                }

                background: Rectangle {
                    implicitWidth: 100
                    implicitHeight: 40
                    opacity: enabled ? 1 : 0.3
                    color: {
                        previous_chapter.down ? "#c0c0c0" : "#90c0c0c0"
                        previous_chapter.hovered ? "#c0c0c0" : "#90c0c0c0"
                    }
                    radius: 5
                }
                onClicked: {

                    next_verse.visible = true

                    if (chapter.currentIndex > 0) {
                        verse.currentIndex = 0
                        bible.bible_text_rvr(book.currentIndex,
                                             chapter.currentIndex -= 1,
                                             verse.currentIndex)

                        bible.verse_list(book.currentIndex,
                                         chapter.currentIndex)

                        previous_verse.visible = false
                    }

                    next_chapter.visible = true

                    if ((chapter.currentIndex) === 0) {
                        previous_chapter.visible = false
                    }
                }
            }

            Button {

                id: next_verse
                width: 80
                height: 40
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.top: parent.top
                anchors.topMargin: 5

                focus: true
                hoverEnabled: true
                ToolTip.delay: 1000
                ToolTip.timeout: 5000
                ToolTip.visible: hovered
                ToolTip.text: qsTr("Verse " + (verse.currentIndex + 2).toString(
                                       ))

                Image {
                    height: 40
                    width: 40
                    anchors.horizontalCenter: parent.horizontalCenter
                    source: "../img/next_chapter.png"
                    fillMode: Image.PreserveAspectFit
                    anchors.margins: 4
                }

                background: Rectangle {
                    implicitWidth: 100
                    implicitHeight: 40
                    opacity: enabled ? 1 : 0.3
                    color: {
                        next_verse.down ? "#c0c0c0" : "#90c0c0c0"
                        next_verse.hovered ? "#c0c0c0" : "#90c0c0c0"
                    }
                    radius: 5
                }
                onClicked: {

                    if ((verse.currentIndex + 1) > 0) {
                        previous_verse.visible = true
                    }

                    if ((verse.currentIndex + 1) < verse_) {
                        bible.bible_text_rvr(book.currentIndex,
                                             chapter.currentIndex,
                                             verse.currentIndex += 1)
                    }

                    if ((verse.currentIndex + 1) === verse_) {
                        next_verse.visible = false
                    } else {
                        next_verse.visible = true
                    }
                }
            }

            Button {
                id: previous_verse
                width: 80
                height: 40
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.bottom: parent.bottom
                anchors.bottomMargin: 5
                focus: true
                visible: false
                hoverEnabled: true
                ToolTip.delay: 1000
                ToolTip.timeout: 5000
                ToolTip.visible: hovered
                ToolTip.text: qsTr("Verse " + (verse.currentIndex).toString())

                Image {
                    height: 40
                    width: 40
                    anchors.horizontalCenter: parent.horizontalCenter

                    fillMode: Image.PreserveAspectFit
                    anchors.margins: 4
                    source: "../img/previous_chapter.png"
                }

                background: Rectangle {
                    implicitWidth: 100
                    implicitHeight: 40
                    opacity: enabled ? 1 : 0.3
                    color: {
                        previous_verse.down ? "#c0c0c0" : "#90c0c0c0"
                        previous_verse.hovered ? "#c0c0c0" : "#90c0c0c0"
                    }
                    radius: 5
                }
                onClicked: {
                    if (verse.currentIndex > 0) {
                        bible.bible_text_rvr(book.currentIndex,
                                             chapter.currentIndex,
                                             verse.currentIndex -= 1)
                    }

                    next_verse.visible = true

                    if (verse.currentIndex === 0) {
                        previous_verse.visible = false
                    }
                }
            }
        }
    }
}

/*##^## Designer {
    D{i:0;autoSize:true;height:480;width:640}
}
 ##^##*/

