import json
import random
from PyQt5.QtCore import QObject, pyqtSlot, pyqtSignal


class Bible(QObject):
    def __init__(self):
        QObject.__init__(self)
        self.books = []
        self.new = []
        self.old = []
        self.chaps = 0

    # Below are my Signals to qml####################################

    book_names = pyqtSignal(list, arguments=["book_list"])
    chapter_numbers = pyqtSignal(int, arguments=["chapter_list"])
    rand_book_niv = pyqtSignal(int, arguments=["random_verse"])
    rand_chapter_niv = pyqtSignal(int, arguments=["random_verse"])
    rand_verse_niv = pyqtSignal(int, arguments=["random_verse"])
    verse_numbers = pyqtSignal(int, arguments=["verse_list"])
    bible_txt_niv = pyqtSignal(str, arguments=["bible_text_niv"])
    bible_txt_kjv = pyqtSignal(str, arguments=["bible_text_kjv"])
    bible_txt_rvr = pyqtSignal(str, arguments=["bible_text_rvr"])
    bible_txt_ger = pyqtSignal(str, arguments=["bible_text_ger"])
    bible_txt_ro = pyqtSignal(str, arguments=["bible_text_ro"])
    bible_txt_ru = pyqtSignal(str, arguments=["bible_text_ru"])
    bible_txt_greek = pyqtSignal(str, arguments=["bible_text_greek"])
    bible_txt_vi = pyqtSignal(str, arguments=["bible_text_vi"])
    bible_txt_por1 = pyqtSignal(str, arguments=["bible_text_por1"])
    bible_txt_por2 = pyqtSignal(str, arguments=["bible_text_por2"])
    bible_txt_por3 = pyqtSignal(str, arguments=["bible_text_por3"])
    bible_txt_ko = pyqtSignal(str, arguments=["bible_text_ko"])
    bible_txt_ar = pyqtSignal(str, arguments=["bible_text_ar"])
    bible_txt_ch1 = pyqtSignal(str, arguments=["bible_text_ch1"])
    bible_txt_ch2 = pyqtSignal(str, arguments=["bible_text_ch2"])
    bible_txt_esp = pyqtSignal(str, arguments=["bible_text_esp"])
    bible_txt_fin1 = pyqtSignal(str, arguments=["bible_text_fin1"])
    bible_txt_fin2 = pyqtSignal(str, arguments=["bible_text_fin2"])
    bible_txt_apee = pyqtSignal(str, arguments=["bible_text_apee"])
    read_in_kjv = pyqtSignal(str, arguments=["bible_text_kjv"])
    read_in_niv = pyqtSignal(str, arguments=["bible_text_niv"])
# //////////////////////////////////////////////////////////////////////////////
# //////////////////////////////////////////////////////////////////////////////

    @pyqtSlot()
    def book_list(self):
        with open("Resources/json/en_kjv.json", encoding='utf-8-sig', errors='ignore')as f:
            data = json.load(f, strict=False)

        for data_ in data:
            names = data_["name"]
            self.books.append(names)

        num = 0
        while num < 39:
            self.old.append(self.books[num])
            num += 1

        new_num = 39
        while new_num < 66:
            self.new.append(self.books[new_num])
            new_num += 1

        self.book_names.emit(self.books)
        # self.old_test.emit(self.old)
        # self.new_test.emit(self.new)

    @pyqtSlot(int)
    def chapter_list(self, chap_num=0):
        with open("Resources/json/en_kjv.json", encoding='utf-8-sig', errors='ignore') as f:
            data = json.load(f, strict=False)

        ab = []
        for data_ in data:
            data_chap = data_['chapters']
            num = 0
            for chap in data_chap:
                num += 1
            ab.append(num)

        self.chaps = ab[chap_num]

        self.chapter_numbers.emit(self.chaps)

    @pyqtSlot()
    def random_verse(self):
        with open("Resources/json/en_kjv.json", encoding='utf-8-sig', errors='ignore') as file:
            dat = json.load(file, strict=False)
            ab = []
            p = random.randint(0, 65)
            self.rand_book_niv.emit(p)

            for data_ in dat:
                data_chap = data_['chapters']
                num = 0
                for chap in data_chap:
                    num += 1
                ab.append(num)

            q = random.randint(0, ((ab[p]) - 1))
            self.rand_chapter_niv.emit(q)

            k = dat[p]["chapters"][q]

            num = 0
            for h in k:
                num += 1

            r = random.randint(0, (num - 1))
            self.rand_verse_niv.emit(r)

    @pyqtSlot(int, int)
    def verse_list(self, x=0, y=0):
        with open("Resources/json/en_kjv.json", encoding='utf-8-sig', errors='ignore') as f:
            data = json.load(f, strict=False)
            k = data[x]["chapters"][y]
            num = 0
            for h in k:
                num += 1
            self.verse_numbers.emit(num)

# ///////////////////////////////English/////////////////////////////
    @pyqtSlot(int, int, int)
    def bible_text_kjv(self, x=0, y=0, z=0):
        with open("Resources/json/en_kjv.json", encoding='utf-8-sig', errors='ignore') as f:
            data = json.load(f, strict=False)

        a = data[x]["chapters"][y][z]
        self.bible_txt_kjv.emit(a)
        self.read_in_kjv.emit(a)

    @pyqtSlot(int, int, int)
    def bible_text_niv(self, x=0, y=0, z=0):
        with open("Resources/json/en_bbe.json", encoding='utf-8-sig', errors='ignore') as f:
            data = json.load(f, strict=False)

        k = data[x]["chapters"][y][z]
        self.bible_txt_niv.emit(k)
        self.read_in_niv.emit(k)\

# ///////////////////////////////////////////////////////////////////////

# /////////////////////////////French///////////////////////
    @pyqtSlot(int, int, int)
    def bible_text_apee(self, x=0, y=0, z=0):
        with open("Resources/json/fr_apee.json", encoding='utf-8-sig', errors='ignore') as f:
            data = json.load(f, strict=False)

        k = data[x]["chapters"][y][z]
        self.bible_txt_apee.emit(k)

# ///////////////////////////////////////////////////////////////////////

# ///////////////////////////////Spanish////////////////////////
    @pyqtSlot(int, int, int)
    def bible_text_rvr(self, x=0, y=0, z=0):
        with open("Resources/json/es_rvr.json", encoding='utf-8-sig', errors='ignore') as f:
            data = json.load(f, strict=False)

        k = data[x]["chapters"][y][z]
        self.bible_txt_rvr.emit(k)

# ///////////////////////////////////////////////////////////////////////

# //////////////////////////////////German/////////////////////
    @pyqtSlot(int, int, int)
    def bible_text_ger(self, x=0, y=0, z=0):
        with open("Resources/json/de_schlachter.json", encoding='utf-8-sig', errors='ignore') as f:
            data = json.load(f, strict=False)

        k = data[x]["chapters"][y][z]
        self.bible_txt_ger.emit(k)

# ///////////////////////////////////////////////////////////////////////

# //////////////////////////////Portuguese//////////////////////
    @pyqtSlot(int, int, int)
    def bible_text_por1(self, x=0, y=0, z=0):
        with open("Resources/json/pt_aa.json", encoding='utf-8-sig', errors='ignore') as f:
            data = json.load(f, strict=False)

        k = data[x]["chapters"][y][z]
        self.bible_txt_por1.emit(k)

    @pyqtSlot(int, int, int)
    def bible_text_por2(self, x=0, y=0, z=0):
        with open("Resources/json/pt_acf.json", encoding='utf-8-sig', errors='ignore') as f:
            data = json.load(f, strict=False)

        k = data[x]["chapters"][y][z]
        self.bible_txt_por2.emit(k)

    @pyqtSlot(int, int, int)
    def bible_text_por3(self, x=0, y=0, z=0):
        with open("Resources/json/pt_nvi.json", encoding='utf-8-sig', errors='ignore') as f:
            data = json.load(f, strict=False)

        k = data[x]["chapters"][y][z]
        self.bible_txt_por3.emit(k)

# ///////////////////////////////////////////////////////////////////////

# //////////////////////////////Arabic//////////////////////
    @pyqtSlot(int, int, int)
    def bible_text_ar(self, x=0, y=0, z=0):
        with open("Resources/json/ar_svd.json", encoding='utf-8-sig', errors='ignore') as f:
            data = json.load(f, strict=False)

        k = data[x]["chapters"][y][z]
        self.bible_txt_ar.emit(k)

# ///////////////////////////////////////////////////////////////////////

# //////////////////////////////Chinese//////////////////////
    @pyqtSlot(int, int, int)
    def bible_text_ch1(self, x=0, y=0, z=0):
        with open("Resources/json/zh_cuv.json", encoding='utf-8-sig', errors='ignore') as f:
            data = json.load(f, strict=False)

        k = data[x]["chapters"][y][z]
        self.bible_txt_ch1.emit(k)

    @pyqtSlot(int, int, int)
    def bible_text_ch2(self, x=0, y=0, z=0):
        with open("Resources/json/zh_ncv.json", encoding='utf-8-sig', errors='ignore') as f:
            data = json.load(f, strict=False)

        k = data[x]["chapters"][y][z]
        self.bible_txt_ch2.emit(k)

# ///////////////////////////////////////////////////////////////////////

# //////////////////////////////Greek//////////////////////
    @pyqtSlot(int, int, int)
    def bible_text_greek(self, x=0, y=0, z=0):
        with open("Resources/json/el_greek.json", encoding='utf-8-sig', errors='ignore') as f:
            data = json.load(f, strict=False)

        k = data[x]["chapters"][y][z]
        self.bible_txt_greek.emit(k)

# ///////////////////////////////////////////////////////////////////////

# //////////////////////////////Finnish//////////////////////
    @pyqtSlot(int, int, int)
    def bible_text_fin1(self, x=0, y=0, z=0):
        with open("Resources/json/fi_finnish.json", encoding='utf-8-sig', errors='ignore') as f:
            data = json.load(f, strict=False)

        k = data[x]["chapters"][y][z]
        self.bible_txt_fin1.emit(k)

    @pyqtSlot(int, int, int)
    def bible_text_fin2(self, x=0, y=0, z=0):
        with open("Resources/json/fi_pr.json", encoding='utf-8-sig', errors='ignore') as f:
            data = json.load(f, strict=False)

        k = data[x]["chapters"][y][z]
        self.bible_txt_fin2.emit(k)

# ///////////////////////////////////////////////////////////////////////

# //////////////////////////////Esperanto//////////////////////
    @pyqtSlot(int, int, int)
    def bible_text_esp(self, x=0, y=0, z=0):
        with open("Resources/json/eo_esperanto.json", encoding='utf-8-sig', errors='ignore') as f:
            data = json.load(f, strict=False)

        k = data[x]["chapters"][y][z]
        self.bible_txt_esp.emit(k)

# ///////////////////////////////////////////////////////////////////////

# //////////////////////////////Korean//////////////////////
    @pyqtSlot(int, int, int)
    def bible_text_ko(self, x=0, y=0, z=0):
        with open("Resources/json/ko_ko.json", encoding='utf-8-sig', errors='ignore') as f:
            data = json.load(f, strict=False)

        k = data[x]["chapters"][y][z]
        self.bible_txt_ko.emit(k)

# ///////////////////////////////////////////////////////////////////////

# //////////////////////////////Romanian//////////////////////
    @pyqtSlot(int, int, int)
    def bible_text_ro(self, x=0, y=0, z=0):
        with open("Resources/json/ro_cornilescu.json", encoding='utf-8-sig', errors='ignore') as f:
            data = json.load(f, strict=False)

        k = data[x]["chapters"][y][z]
        self.bible_txt_ro.emit(k)

# ///////////////////////////////////////////////////////////////////////

# //////////////////////////////Russian//////////////////////
    @pyqtSlot(int, int, int)
    def bible_text_ru(self, x=0, y=0, z=0):
        with open("Resources/json/ru_synodal.json", encoding='utf-8-sig', errors='ignore') as f:
            data = json.load(f, strict=False)

        k = data[x]["chapters"][y][z]
        self.bible_txt_ru.emit(k)

# ///////////////////////////////////////////////////////////////////////

# //////////////////////////////Vietnamese//////////////////////
    @pyqtSlot(int, int, int)
    def bible_text_vi(self, x=0, y=0, z=0):
        with open("Resources/json/vi_vietnamese.json", encoding='utf-8-sig', errors='ignore') as f:
            data = json.load(f, strict=False)

        k = data[x]["chapters"][y][z]
        self.bible_txt_vi.emit(k)

# ///////////////////////////////////////////////////////////////////////

# ////////////////////////////////////////////////////////////////////////
# ////////////////////////////////////////////////////////////////////////
# ////////////////////////////////////////////////////////////////////////


