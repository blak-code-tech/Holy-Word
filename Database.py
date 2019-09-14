import sqlite3
from PyQt5.QtCore import QObject, pyqtSlot, pyqtSignal


class NotesDatabase(QObject):
    def __init__(self):
        QObject.__init__(self)
        self._db = sqlite3.connect("Notes.db")
        self._db.row_factory = sqlite3.Row
        self._db.execute("create table if not exists Notes(ID integer primary key autoincrement,"
                         " book int, chapter int,"
                         " verse int, note text)")
        self._db.commit()

    def add(self, book, chapter, verse, note):
        self._db.row_factory = sqlite3.Row
        # Add records
        self._db.execute("insert into Notes(book,chapter, verse, note) values(?,?,?,?)", (book, chapter, verse, note))
        self._db.commit()
        print("Record is added")

    def list_of_notes(self):
        cursor = self._db.execute("select * from Notes")
        for row in cursor:
            print("ID:{},book: {},chapter: {},verse: {},note: {}".format(row["ID"],
                                                                         row["book"], row["chapter"],

                                                                         row["verse"], row["note"]))

    def delete_note(self, ID):
        self._db.row_factory = sqlite3.Row
        # Add records
        self._db.execute("delete from Notes where ID={}".format(ID))
        self._db.commit()
        print("Record is deleted")
    #
    # def updaterecord(self, book, chaper, verse, note):
    #     self._db.row_factory = sqlite3.Row
    #     # Add records
    #     self._db.execute("update Notes set Age=? where ID=?", (Age, ID))
    #     self._db.commit()
    #     print("Record is Updated")


class FavouritesDatabase(QObject):
    def __init__(self):
        QObject.__init__(self)
        self._db = sqlite3.connect("Favourites.db")
        self._db.row_factory = sqlite3.Row
        self._db.execute("create table if not exists Favourites(ID integer primary key autoincrement,"
                         " book int, chapter int, verse int)")
        self._db.commit()

    check_ = pyqtSignal(int, arguments=["check"])

    @pyqtSlot(int, int, int)
    def add(self, book, chapter, verse):
        self._db.row_factory = sqlite3.Row
        # Add records
        self._db.execute("insert into Favourites(book,chapter, verse) values(?,?,?)", (book, chapter, verse))
        self._db.commit()
        print("Added to favourites")

    @pyqtSlot(int, int, int)
    def check(self, book, chapter, verse):
        cursor = self._db.execute("select * from Favourites")
        for row in cursor:
            if row["book"] is book and row["chapter"] is chapter and row["verse"] is verse:
                m = 1
                self.check_.emit(m)
            else:
                p = 0
                self.check_.emit(p)

    @pyqtSlot(int, int, int)
    def remove(self, book, chapter, verse):
        self._db.row_factory = sqlite3.Row
        cursor = self._db.execute("select * from Favourites")
        for row in cursor:
            if row["book"] is book and row["chapter"] is chapter and row["verse"] is verse:
                id_num = row["ID"]
                self._db.execute("delete from Favourites where ID={}".format(id_num))
        self._db.commit()
        print("Removed from favourites")


