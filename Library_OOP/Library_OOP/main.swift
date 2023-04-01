//
//  main.swift
//  Library_OOP
//
//  Created by MacBook on 31.03.2023.
//

import Foundation

let HarryPotterBook = Book(title: "Harry Potter", author: "Joanne Rowling", yearOfPublication: 1997, genre: "Fiction")
let HarryPotterEbook = Ebook(title: "Harry Potter", author: "Joanne Rowling", yearOfPublication: 1997, genre: "Fiction", size: 1234)

let randomSpace = Space(name: "Random Space")
let readingSpace = ReadingRoom(name: "My reading room", numberOfSittingSpaces: 12)
let internetSpace = InternetRoom(name: "My internet room", numberOfComputers: 45)

var booksArray: [Book] = []
booksArray.append(HarryPotterBook)
booksArray.append(HarryPotterEbook)

var spacesArray: [Space] = []
spacesArray.append(randomSpace)
spacesArray.append(readingSpace)
spacesArray.append(internetSpace)


let firstLibrary = Library(name: "First Library", books: booksArray, spaces: spacesArray)

print(firstLibrary)
