# import sys
import json
import threading
from time import sleep
import pyttsx3
from PyQt5.QtCore import QObject, pyqtSlot


class SpeechToText(QObject):
    def __init__(self):
        QObject.__init__(self)
        # self.voice = "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Speech\Voices\Tokens\TTS_MS_EN-US_ZIRA_11.0"

    @pyqtSlot(int, int, int)
    def speak_verse_niv(self, book, chapter, verse):
        start_thread = threading.Thread(target=self._speak_verse_niv, args=(book, chapter, verse))
        start_thread.daemon = True
        start_thread.start()
        print("Thread has started for speak_niv..")

    def _speak_verse_niv(self, book, chapter, verse):
        sleep(0.1)
        engine = pyttsx3.init()
        with open("Resources/json/en_bbe.json", encoding='utf-8-sig', errors='ignore') as file:
            data = json.load(file, strict=False)
            books = []
            for data_ in data:
                names = data_["name"]
                books.append(names)
            name = books[book]
            bible_text = data[book]["chapters"][chapter][verse]
            """ RATE"""
            engine.setProperty('rate', 150)
            # engine.setProperty('voice', self.voice)
            if name == "1 Samuel":
                name = "First Samuel"
            elif name == "2 Samuel":
                name = "Second Samuel"
            elif name == "1 Kings":
                name = "First Kings"
            elif name == "2 Kings":
                name = "Second Kings"
            elif name == "1 Chronicles":
                name = "First Chronicles"
            elif name == "2 Chronicles":
                name = "Second Chronicles"
            elif name == "1 Corinthians":
                name = "First Corinthians"
            elif name == "2 Corinthians":
                name = "Second Corinthians"
            elif name == "1 Thessalonians":
                name = "First Thessalonians"
            elif name == "2 Thessalonians":
                name = "Second Thessalonians"
            elif name == "1 Timothy":
                name = "First Timothy"
            elif name == "2 Timothy":
                name = "Second Timothy"
            elif name == "1 Peter":
                name = "First Peter"
            elif name == "2 Peter":
                name = "Second Peter"
            elif name == "1 John":
                name = "First John"
            elif name == "2 John":
                name = "Second John"
            elif name == "3 John":
                name = "Third John"

            engine.say(name + " Chapter" + (str(chapter + 1))
                            + " verse" + (str(verse + 1)) + "says\n" + bible_text)
            engine.say("This is the word of the Lord, Amen.")

            try:
                engine.runAndWait()
            except RuntimeError as p:
                print(p)
                engine.stop()
            engine.stop()


# this line reads a whole chapter
    @pyqtSlot(int, int)
    def speak_chapter_niv(self, book, chapter):
        start_thread = threading.Thread(target=self._speak_chapter_niv, args=(book, chapter))
        start_thread.daemon = True
        start_thread.start()
        print("Thread has started for speak_chapter_niv..")

    def _speak_chapter_niv(self, book, chapter):
        engine = pyttsx3.init()
        with open("Resources/json/en_bbe.json", encoding='utf-8-sig', errors='ignore') as file:
            data = json.load(file, strict=False)
            books = []
            for data_ in data:
                names = data_["name"]
                books.append(names)
            name = books[book]

            bible_text = data[book]["chapters"][chapter]
            """ RATE"""
            engine.setProperty('rate', 150)
            # engine.setProperty('voice', self.voice)
            if name == "1 Samuel":
                name = "First Samuel"
            elif name == "2 Samuel":
                name = "Second Samuel"
            elif name == "1 Kings":
                name = "First Kings"
            elif name == "2 Kings":
                name = "Second Kings"
            elif name == "1 Chronicles":
                name = "First Chronicles"
            elif name == "2 Chronicles":
                name = "Second Chronicles"
            elif name == "1 Corinthians":
                name = "First Corinthians"
            elif name == "2 Corinthians":
                name = "Second Corinthians"
            elif name == "1 Thessalonians":
                name = "First Thessalonians"
            elif name == "2 Thessalonians":
                name = "Second Thessalonians"
            elif name == "1 Timothy":
                name = "First Timothy"
            elif name == "2 Timothy":
                name = "Second Timothy"
            elif name == "1 Peter":
                name = "First Peter"
            elif name == "2 Peter":
                name = "Second Peter"
            elif name == "1 John":
                name = "First John"
            elif name == "2 John":
                name = "Second John"
            elif name == "3 John":
                name = "Third John"

            engine.say(name + " Chapter" + (str(chapter + 1)))
            num = 1
            for txt in bible_text:
                sleep(0.1)
                engine.say("Verse " + str(num) + "\n" + txt)
                num += 1

            engine.say("This is the word of the Lord, Amen.")
            try:
                engine.runAndWait()
            except RuntimeError as p:
                print(p)
                self.num = 1
                engine.stop()
            engine.stop()


# This reads a verse in KJV
    @pyqtSlot(int, int, int)
    def speak_verse_kjv(self, book, chapter, verse):
        start_thread = threading.Thread(target=self._speak_verse_kjv, args=(book, chapter, verse))
        start_thread.daemon = True
        start_thread.start()
        print("Thread has started for speak_verse_kjv..")

    def _speak_verse_kjv(self, book, chapter, verse):
        engine = pyttsx3.init()
        with open("Resources/json/en_kjv.json", encoding='utf-8-sig', errors='ignore') as file:
            data = json.load(file, strict=False)
            books = []
            for data_ in data:
                names = data_["name"]
                books.append(names)
            name = books[book]

            bible_text = data[book]["chapters"][chapter][verse]
            """ RATE"""
            engine.setProperty('rate', 150)
            if name == "1 Samuel":
                name = "First Samuel"
            elif name == "2 Samuel":
                name = "Second Samuel"
            elif name == "1 Kings":
                name = "First Kings"
            elif name == "2 Kings":
                name = "Second Kings"
            elif name == "1 Chronicles":
                name = "First Chronicles"
            elif name == "2 Chronicles":
                name = "Second Chronicles"
            elif name == "1 Corinthians":
                name = "First Corinthians"
            elif name == "2 Corinthians":
                name = "Second Corinthians"
            elif name == "1 Thessalonians":
                name = "First Thessalonians"
            elif name == "2 Thessalonians":
                name = "Second Thessalonians"
            elif name == "1 Timothy":
                name = "First Timothy"
            elif name == "2 Timothy":
                name = "Second Timothy"
            elif name == "1 Peter":
                name = "First Peter"
            elif name == "2 Peter":
                name = "Second Peter"
            elif name == "1 John":
                name = "First John"
            elif name == "2 John":
                name = "Second John"
            elif name == "3 John":
                name = "Third John"

            engine.say(name + " Chapter" + (str(chapter + 1))
                            + " verse" + (str(verse + 1)) + "says\n" + bible_text)

            try:
                engine.runAndWait()
            except RuntimeError as p:
                print(p)
                engine.stop()
            engine.stop()

    @pyqtSlot()
    def mute(self):
        try:
            engine = pyttsx3.init()
            engine.stop()
        except ReferenceError as b:
            print(b)

    @pyqtSlot(int, int)
    def speak_chapter_kjv(self, book, chapter):
        start_thread = threading.Thread(target=self._speak_chapter_niv, args=(book, chapter))
        start_thread.daemon = True
        start_thread.start()
        print("Thread has started for speak_chapter_kjv..")

    def _speak_chapter_kjv(self, book, chapter):
        engine = pyttsx3.init()
        with open("Resources/json/en_kjv.json", encoding='utf-8-sig', errors='ignore') as file:
            data = json.load(file, strict=False)
            books = []
            for data_ in data:
                names = data_["name"]
                books.append(names)
            name = books[book]

            bible_text = data[book]["chapters"][chapter]
            """ RATE"""
            engine.setProperty('rate', 150)
            # engine.setProperty('voice', self.voice)
            if name == "1 Samuel":
                name = "First Samuel"
            elif name == "2 Samuel":
                name = "Second Samuel"
            elif name == "1 Kings":
                name = "First Kings"
            elif name == "2 Kings":
                name = "Second Kings"
            elif name == "1 Chronicles":
                name = "First Chronicles"
            elif name == "2 Chronicles":
                name = "Second Chronicles"
            elif name == "1 Corinthians":
                name = "First Corinthians"
            elif name == "2 Corinthians":
                name = "Second Corinthians"
            elif name == "1 Thessalonians":
                name = "First Thessalonians"
            elif name == "2 Thessalonians":
                name = "Second Thessalonians"
            elif name == "1 Timothy":
                name = "First Timothy"
            elif name == "2 Timothy":
                name = "Second Timothy"
            elif name == "1 Peter":
                name = "First Peter"
            elif name == "2 Peter":
                name = "Second Peter"
            elif name == "1 John":
                name = "First John"
            elif name == "2 John":
                name = "Second John"
            elif name == "3 John":
                name = "Third John"

            engine.say(name + " Chapter" + (str(chapter + 1)))
            num = 1
            for txt in bible_text:
                sleep(0.1)
                engine.say("Verse " + str(num) + "\n" + txt)
                num += 1

            engine.say("This is the word of the Lord, Amen.")
            try:
                engine.runAndWait()
            except RuntimeError as p:
                print(p)
                self.num = 1
                engine.stop()
            engine.stop()