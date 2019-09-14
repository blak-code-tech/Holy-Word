import QtQuick 2.13
import QtQuick.Controls 2.13
import QtQuick.Layouts 1.13
import QtQuick.Window 2.13
import QtQuick.Dialogs 1.3
import "Languages"
import "Versions_&_Others"

ApplicationWindow {
    id: mainWindow
    visible: true
    width: screen.width
    height: screen.height
    minimumHeight: 600
    minimumWidth: 1024

    onClosing: {
        close.accepted = false
        get_out.visible = true
    }

    Popup {
        id: get_out
        anchors.centerIn: parent
        width: 350
        height: 230
        modal: true
        focus: true
        closePolicy: Popup.CloseOnEscape | Popup.CloseOnPressOutsideParent

        background: Rectangle {
            anchors.fill: parent
            color: "#c0c0c0"
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
        Rectangle {
            anchors.fill: parent
            Label {
                id: lib
                anchors.centerIn: parent
                text: "Are you sure?"
                font.family: "Microsoft New Tai Lue"
                font.pixelSize: 18
            }

            Label {
                anchors.horizontalCenter: parent.horizontalCenter
                text: qsTr("Closing Holy Word")
                anchors.top: parent.top
                anchors.topMargin: 15
                font.family: "Microsoft New Tai Lue"
                font.pixelSize: 25
            }

            Row {
                anchors.top: lib.bottom

                anchors.topMargin: 5
                anchors.horizontalCenter: parent.horizontalCenter
                spacing: 5

                Button {
                    id: me
                    text: qsTr("Yes")
                    width: 100
                    height: 40
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
                        implicitHeight: 40
                        opacity: enabled ? 1 : 0.3
                        color: {
                            me.down ? "#FF3300" : "#FF3300"
                            me.hovered ? "#FF3300" : "#FF3300"
                        }
                        radius: 5
                    }

                    onClicked: {
                        Qt.quit()
                    }

                    Keys.onPressed: {
                        if (event.key === Qt.Key_Return) {
                            Qt.quit()
                        } else if (event.key === Qt.Key_Enter) {
                            Qt.quit()
                        }
                    }
                }
                Button {
                    id: you
                    text: qsTr("No")
                    width: 100
                    height: 40
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
                        implicitHeight: 40
                        opacity: enabled ? 1 : 0.3
                        color: {
                            you.down ? "#00CC66" : "#00CC66"
                            you.hovered ? "#00CC66" : "#00CC66"
                        }
                        radius: 5
                    }

                    onClicked: {
                        get_out.close()
                    }
                }
            }
        }
    }

    Dialog {
        id: votd
        title: "VERSE OF THE DAY"
        height: 400
        width: 400
        contentItem: Rectangle {

            implicitWidth: 400
            implicitHeight: 100
            Text {
                text: txt1
                color: "navy"
                anchors.centerIn: parent
            }
            Button {
                onClicked: {
                    votd.visible = false
                }
            }
        }
    }

    title: qsTr("Holy Words")

    property alias mainWindow: mainWindow
    property int chap_: 1
    property int verse_: 1
    property int a
    property int b
    property int c
    property var list
    property var oldy
    property var newy
    property var bible_chapter
    property int chap_index: 0
    property int book_index: 0
    property int verse_index: 0
    property string txt1: ""
    property string txt2: ""
    property string txt3: ""
    property string txt4: ""
    property string txt5: ""
    property string txt6: ""
    property string txt7: ""
    property string txt8: ""
    property string txt9: ""
    property string txt10: ""
    property string txt11: ""
    property string txt12: ""
    property string txt13: ""
    property string txt14: ""
    property string txt15: ""
    property string txt16: ""
    property string txt17: ""
    property string txt18: ""
    property string txt19: ""
    property bool portrait: (height > 600) && (width > 900)
    property bool height_check: height > 600
    property int num: 0
    property int my_fav: 0

    Rectangle {
        anchors.fill: parent

        StackView {
            id: pages
            anchors.fill: parent
            popEnter: Transition {
                XAnimator {
                    from: (pages.mirrored ? -1 : 1) * -pages.width
                    to: 0
                    duration: 400
                    easing.type: Easing.OutCubic
                }
            }

            popExit: Transition {
                XAnimator {
                    from: 0
                    to: (pages.mirrored ? -1 : 1) * pages.width
                    duration: 400
                    easing.type: Easing.OutCubic
                }
            }
            initialItem: Launch {}
        }

        Component {
            id: langs
            Item {
                Rectangle {
                    height: mainWindow.height
                    width: mainWindow.width

                    ColumnLayout {
                        anchors.centerIn: parent
                        spacing: 50

                        Text {
                            id: lang
                            Layout.alignment: Qt.AlignHCenter
                            text: qsTr("Select Your Prefered Language")
                            font.family: "Microsoft New Tai Lue"
                            font.pixelSize: 35
                            color: "#95000000"
                        }

                        ScrollView {
                            width: 1000
                            height: 350
                            Layout.alignment: Qt.AlignCenter

                            All_Languages {}
                        }
                    }
                }
            }
        }

        // The following is the list of languages and the versions they hold//
        Component {
            id: english_lang

            English_Versions {}
        }
        Component {
            id: french_lang

            French_Versions {}
        }
        Component {
            id: german_lang

            German_Versions {}
        }
        Component {
            id: spanish_lang

            Spanish_Versions {}
        }
        Component {
            id: romanian_lang

            Romanian_Versions {}
        }
        Component {
            id: russian_lang

            Russian_Versions {}
        }
        Component {
            id: portuguese_lang

            Portuguese_Versions {}
        }
        Component {
            id: vietnamese_lang

            Vietnamese_Versions {}
        }

        Component {
            id: arabic_lang

            Arabic_Versions {}
        }
        Component {
            id: greek_lang

            Greek_Version {}
        }
        Component {
            id: esperanto_lang

            Esperanto_Versions {}
        }

        Component {
            id: korean_lang

            Korean_Versions {}
        }

        Component {
            id: chinese_lang

            Chinese_Versions {}
        }
        Component {
            id: finnish_lang

            Finnish_Versions {}
        }

        // Below is the list of bible versions//
        Component {
            id: third_kjv

            KJV {}
        }
        Component {
            id: third_niv

            NIV {}
        }
        Component {
            id: apee

            APEE {}
        }
        Component {
            id: schlachter

            SCHLACHTER {}
        }

        Component {
            id: rvr

            RVR {}
        }
        Component {
            id: arabic

            Arabic {}
        }

        Component {
            id: esp

            Esperanto {}
        }

        Component {
            id: ko

            Korean {}
        }
        Component {
            id: greek

            Greek {}
        }
        Component {
            id: ro

            Romanian {}
        }
        Component {
            id: ru

            Russian {}
        }
        Component {
            id: vi

            Vietnamese {}
        }
        Component {
            id: ch1

            CUV {}
        }
        Component {
            id: ch2

            NCV {}
        }
        Component {
            id: fin1

            FB {}
        }
        Component {
            id: fin2

            PR {}
        }
        Component {
            id: por1

            ARIB {}
        }
        Component {
            id: por2

            ACRF {}
        }
        Component {
            id: por3

            NVI {}
        }
        Connections {
            target: bible

            onBook_names: {
                var taker = book_list
                list = taker
            }

            onChapter_numbers: {
                var c_taker = chapter_list
                chap_ = c_taker
            }
            onVerse_numbers: {
                var v_taker = verse_list
                verse_ = v_taker
            }
            onBible_txt_niv: {
                var b_taker = bible_text_niv
                txt1 = b_taker
            }
            onBible_txt_kjv: {
                var kjv_taker = bible_text_kjv
                txt2 = kjv_taker
            }
            onBible_txt_apee: {
                var b_taker = bible_text_apee
                txt3 = b_taker
            }
            onBible_txt_rvr: {
                var kjv_taker = bible_text_rvr
                txt4 = kjv_taker
            }
            onBible_txt_ger: {
                var b_taker = bible_text_ger
                txt5 = b_taker
            }
            onBible_txt_ar: {
                var kjv_taker = bible_text_ar
                txt6 = kjv_taker
            }
            onBible_txt_esp: {
                var kjv_taker = bible_text_esp
                txt7 = kjv_taker
            }
            onBible_txt_ko: {
                var kjv_taker = bible_text_ko
                txt8 = kjv_taker
            }
            onBible_txt_greek: {
                var kjv_taker = bible_text_greek
                txt9 = kjv_taker
            }
            onBible_txt_ro: {
                var kjv_taker = bible_text_ro
                txt10 = kjv_taker
            }
            onBible_txt_ru: {
                var kjv_taker = bible_text_ru
                txt11 = kjv_taker
            }
            onBible_txt_vi: {
                var kjv_taker = bible_text_vi
                txt12 = kjv_taker
            }
            onBible_txt_ch1: {
                var kjv_taker = bible_text_ch1
                txt13 = kjv_taker
            }
            onBible_txt_ch2: {
                var kjv_taker = bible_text_ch2
                txt14 = kjv_taker
            }
            onBible_txt_fin1: {
                var kjv_taker = bible_text_fin1
                txt15 = kjv_taker
            }
            onBible_txt_fin2: {
                var kjv_taker = bible_text_fin2
                txt16 = kjv_taker
            }
            onBible_txt_por1: {
                var kjv_taker = bible_text_por1
                txt17 = kjv_taker
            }
            onBible_txt_por2: {
                var kjv_taker = bible_text_por2
                txt18 = kjv_taker
            }
            onBible_txt_por3: {
                var kjv_taker = bible_text_por3
                txt19 = kjv_taker
            }

            onRead_in_kjv: {
                var b_taker = bible_text_kjv
                txt2 = b_taker
            }
            onRead_in_niv: {
                var b_taker = bible_text_niv
                txt1 = b_taker
            }

            onRand_book_niv: {
                var num = random_verse
                a = num
            }
            onRand_chapter_niv: {
                var num = random_verse
                b = num
            }
            onRand_verse_niv: {
                var num = random_verse
                c = num
            }
        }

        Connections {
            target: say
        }
        Connections {
            target: favourite

            onCheck_: {
                var n = check
                my_fav = n
            }
        }
        Connections {
            target: note
        }

        Component.onCompleted: {
            bible.book_list()
            bible.chapter_list(0)
            bible.verse_list(0, 0)
        }
    }
}
