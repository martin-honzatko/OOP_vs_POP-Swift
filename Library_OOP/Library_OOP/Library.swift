import Foundation

// Object Book
class Book: CustomStringConvertible, Equatable, Comparable {
    private(set) var title: String
    private(set) var author: String
    private(set) var yearOfPublication: Int
    private(set) var genre: String
    
    init(title: String, author: String, yearOfPublication: Int, genre: String) {
        self.title = title
        self.author = author
        self.yearOfPublication = yearOfPublication
        self.genre = genre
    }
    
    var description: String {
        return "Book(Title: \(title); Author: \(author); Year of Publication: \(yearOfPublication); Genre: \(genre))"
    }
    
    static func ==(lhs: Book, rhs: Book) -> Bool {
        return lhs.title == rhs.title && lhs.author == rhs.author && lhs.yearOfPublication == rhs.yearOfPublication && lhs.genre == rhs.genre
    }
    
    static func <(lhs: Book, rhs: Book) -> Bool {
        return lhs.yearOfPublication < rhs.yearOfPublication
    }
}

// Object Ebook
class Ebook: Book {
    private(set) var size: Int
    
    init(title: String, author: String, yearOfPublication: Int, genre: String, size: Int) {
        self.size = size
        super.init(title: title, author: author, yearOfPublication: yearOfPublication, genre: genre)
    }
    
    override var description: String {
        return "Ebook(Title: \(title); Author: \(author); Year of Publication: \(yearOfPublication); Genre: \(genre), Size: \(size))"
    }
}

// Object Space
class Space: CustomStringConvertible, Equatable, Comparable {
    private(set) var name: String
    
    init(name: String) {
        self.name = name
    }
    
    var description: String {
        return "Space(Name: \(name))"
    }
    
    static func ==(lhs: Space, rhs: Space) -> Bool {
        return lhs.name == rhs.name && lhs.description == rhs.description
    }
    
    static func <(lhs: Space, rhs: Space) -> Bool {
        return lhs.name < rhs.name
    }
}

// Object InternetRoom
class InternetRoom: Space {
    private(set) var numberOfComputers: Int
    
    init(name: String, numberOfComputers: Int) {
        self.numberOfComputers = numberOfComputers
        super.init(name: name)
    }
    
    override var description: String {
        return "InternetRoom(Name: \(name), Number of computers: \(numberOfComputers))"
    }
    
    func addComputer() {
        numberOfComputers += 1
    }
}

// Object ReadingRoom
class ReadingRoom: Space {
    private(set) var numberOfSittingSpaces: Int
    
    init(name: String, numberOfSittingSpaces: Int) {
        self.numberOfSittingSpaces = numberOfSittingSpaces
        super.init(name: name)
    }
    
    override var description: String {
        return "ReadingRoom(Name: \(name), Number of sitting spaces: \(numberOfSittingSpaces))"
    }
}

// Object Library
class Library: CustomStringConvertible {
    private(set) var name: String
    private(set) var books: [Book]
    private(set) var spaces: [Space]
    
    init(name: String, books: [Book], spaces: [Space]) {
        self.name = name
        self.books = books
        self.spaces = spaces
    }
    
    var description: String {
        var res: String = "Library name: " + self.name + "\n\n"
        
        res += "Books:\n"
        for book in self.books {
            res += book.description
            res += "\n"
        }
        res += "\n"
        
        res += "Spaces:\n"
        for space in self.spaces {
            res += space.description
            res += "\n"
        }
        
        
        return res
    }
    
    convenience init(name: String, book: Book, space: Space) {
        self.init(name: name, books: [book], spaces: [space])
    }
}

