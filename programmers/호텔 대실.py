def solution(book_time):
    book = []

    for time in book_time:
        newBook = []
        for t in time:
            newTime = list(map(int, t.split(":")))
            if newBook != []:
                newBook.append(newTime[0]*60+newTime[1]+10)
                continue
            newBook.append(newTime[0]*60+newTime[1])
        book.append(newBook)
    book = sorted(book)
    roomInfo = []

    for b in book:
        isAppend = False
        for num, room in enumerate(roomInfo):
            if room[1] <= b[0]:
                roomInfo[num] = b
                isAppend = True
                break
        if isAppend == False:
            roomInfo.append(b)

    return len(roomInfo)