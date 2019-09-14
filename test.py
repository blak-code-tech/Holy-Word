import json
import pyttsx3


def chaps(book, chapter, start, end):
    engine = pyttsx3.init()
    with open("Resources/json/en_kjv.json", encoding='utf-8-sig', errors='ignore')as f:
        dat = json.load(f, strict=False)
        engine.setProperty('rate', 150)
        books = []
        for data_ in dat:
            names = data_["name"]
            books.append(names)
        name = books[book]

        bible_text = dat[book]["chapters"][chapter]
        bib = bible_text[(start - 1):(end - 1)]
        engine.say(name + " Chapter" + (str(chapter + 1)) + "Verses " + str(start) + "to " + str(end - 1))
        for b in bib:
            print(b)
            engine.say("Verse " + str(start) + "\n" + b)
            start += 1

        engine.say("This is the word of the Lord, Amen.")

        engine.runAndWait()


# chaps(2, 0, 1, 5)


def search():
    with open("Resources/json/en_kjv.json", encoding='utf-8-sig', errors='ignore')as f:
        data = json.load(f, strict=False)
        search_location = []
        for data_ in data:
            chaps = data_["chapters"]
            name = data_["name"]
            search_location.append(name)
            num_chap = 0
            for chap in chaps:
                num_chap += 1
                for i in chap:

                    if "Dad" in i:
                        print(name, num_chap, i)



search()