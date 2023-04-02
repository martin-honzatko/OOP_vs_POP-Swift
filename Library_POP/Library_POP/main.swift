//
//  main.swift
//  Library_POP
//
//  Created by MacBook on 31.03.2023.
//

import Foundation

let HarryPotterBook = Book(title: "Harry Potter", author: "Joanne Rowling", yearOfPublication: 1997, genre: "Fiction")
let HarryPotterEbook = Ebook(title: "Harry Potter", author: "Joanne Rowling", yearOfPublication: 1997, genre: "Fiction", size: 1234)

let randomSpace = Space(name: "Random Space")
let readingSpace = ReadingRoom(name: "My reading room", numberOfSittingSpaces: 12)
let internetSpace = InternetRoom(name: "My internet room", numberOfComputers: 45)



var booksArray1: [any BookProtocol] = []
booksArray1.append(HarryPotterBook)
//booksArray1.append(HarryPotterEbook)

var booksArray2: [any BookProtocol] = []
//booksArray2.append(HarryPotterBook)
booksArray2.append(HarryPotterEbook)

var spacesArray: [any SpaceProtocol] = []
spacesArray.append(randomSpace)
spacesArray.append(readingSpace)
spacesArray.append(internetSpace)

print(booksArray1)
print(spacesArray)

let myLib1 = Library(name: "My Library 1", books: booksArray1, spaces: spacesArray)
let myLib2 = Library(name: "My Library 2", books: booksArray2, spaces: spacesArray)

print(myLib1)
print(myLib2)

print(myLib1 == myLib1)
print(myLib1 == myLib2)


