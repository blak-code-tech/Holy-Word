import sys
from PyQt5.QtGui import QGuiApplication, QIcon
from PyQt5.QtQml import QQmlApplicationEngine
from Bible_Backend import Bible
from Speech import SpeechToText
from Database import NotesDatabase, FavouritesDatabase


app = QGuiApplication(sys.argv)
app.setWindowIcon(QIcon('Resources/img/holy_bible.png'))
engine = QQmlApplicationEngine()
bib = Bible()
speak = SpeechToText()
notes = NotesDatabase()
favourites = FavouritesDatabase()
engine.rootContext().setContextProperty('bible', bib)
engine.rootContext().setContextProperty('say', speak)
engine.rootContext().setContextProperty('note', notes)
engine.rootContext().setContextProperty('favourite', favourites)
engine.load('Resources/Qml/Main.qml')
engine.quit.connect(app.quit)
sys.exit(app.exec_())
