import Foundation

// Protocols
protocol BookProtocol: CustomStringConvertible, Equatable, Comparable {
    var title: String { get }
    var author: String { get }
    var yearOfPublication: Int { get }
    var genre: String { get }
}

protocol SpaceProtocol: CustomStringConvertible, Equatable, Comparable {
    var name: String { get }
}

// Book
struct Book: BookProtocol {
    let title: String
    let author: String
    let yearOfPublication: Int
    let genre: String

    var description: String {
        return "Book(Title: \(title); Author: \(author); Year of Publication: \(yearOfPublication); Genre: \(genre))"
    }
}

// Equatable and Comparable conformance for Book
extension Book {
    static func ==(lhs: Book, rhs: Book) -> Bool {
        return lhs.title == rhs.title && lhs.author == rhs.author && lhs.yearOfPublication == rhs.yearOfPublication && lhs.genre == rhs.genre
    }

    static func <(lhs: Book, rhs: Book) -> Bool {
        return lhs.yearOfPublication < rhs.yearOfPublication
    }
}

// Ebook
struct Ebook: BookProtocol {
    let title: String
    let author: String
    let yearOfPublication: Int
    let genre: String
    let size: Int

    var description: String {
        return "Ebook(Title: \(title); Author: \(author); Year of Publication: \(yearOfPublication); Genre: \(genre), Size: \(size))"
    }
}

extension Ebook {
    static func ==(lhs: Ebook, rhs: Ebook) -> Bool {
        return lhs.title == rhs.title && lhs.author == rhs.author && lhs.yearOfPublication == rhs.yearOfPublication && lhs.genre == rhs.genre && lhs.size == rhs.size
    }

    static func <(lhs: Ebook, rhs: Ebook) -> Bool {
        return lhs.yearOfPublication < rhs.yearOfPublication
    }
}

// Space
struct Space: SpaceProtocol {
    let name: String

    var description: String {
        return "Space(Name: \(name))"
    }
}

// Equatable and Comparable conformance for Space
extension Space {
    static func ==(lhs: Space, rhs: Space) -> Bool {
        return lhs.name == rhs.name && lhs.description == rhs.description
    }

    static func <(lhs: Space, rhs: Space) -> Bool {
        return lhs.name < rhs.name
    }
}

// InternetRoom
struct InternetRoom: SpaceProtocol {
    let name: String
    private(set) var numberOfComputers: Int

    var description: String {
        return "InternetRoom(Name: \(name), Number of computers: \(numberOfComputers))"
    }

    mutating func addComputer() {
        numberOfComputers += 1
    }
}

extension InternetRoom {
    static func ==(lhs: InternetRoom, rhs: InternetRoom) -> Bool {
        return lhs.name == rhs.name && lhs.numberOfComputers == rhs.numberOfComputers
    }

    static func <(lhs: InternetRoom, rhs: InternetRoom) -> Bool {
        return lhs.name < rhs.name
    }
}

// ReadingRoom
struct ReadingRoom: SpaceProtocol {
    let name: String
    let numberOfSittingSpaces: Int

    var description: String {
        return "ReadingRoom(Name: \(name), Number of sitting spaces: \(numberOfSittingSpaces))"
    }
}

extension ReadingRoom {
    static func ==(lhs: ReadingRoom, rhs: ReadingRoom) -> Bool {
        return lhs.name == rhs.name && lhs.numberOfSittingSpaces == rhs.numberOfSittingSpaces
    }

    static func <(lhs: ReadingRoom, rhs: ReadingRoom) -> Bool {
        return lhs.name < rhs.name
    }
}

// Library
struct Library: CustomStringConvertible {
    let name: String
    let books: [any BookProtocol]
    let spaces: [any SpaceProtocol]

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

    init(name: String, books: [any BookProtocol], spaces: [any SpaceProtocol]) {
        self.name = name
        self.books = books
        self.spaces = spaces
    }
}

extension Library: Equatable, Comparable {
    static func ==(lhs: Library, rhs: Library) -> Bool {
        return lhs.name == rhs.name && areEqualBooks(lhs.books, rhs.books) && areEqualSpaces(lhs.spaces, rhs.spaces)
    }

    static func <(lhs: Library, rhs: Library) -> Bool {
        return lhs.name < rhs.name
    }

    private static func areEqualBooks(_ lhs: [any BookProtocol], _ rhs: [any BookProtocol]) -> Bool {
        guard lhs.count == rhs.count else { return false }
        let lhsBooksNames = lhs.map({ $0.title })
        let rhsBooksNames = rhs.map({ $0.title })
        for n in rhsBooksNames {
            guard lhsBooksNames.contains(n) else { return false }
        }
        return true
    }
    
    private static func areEqualSpaces(_ lhs: [any SpaceProtocol], _ rhs: [any SpaceProtocol]) -> Bool {
        guard lhs.count == rhs.count else { return false }
        let lhsSpacesNames = lhs.map({ $0.name })
        let rhsSpacesNames = rhs.map({ $0.name })
        for n in rhsSpacesNames {
            guard lhsSpacesNames.contains(n) else { return false }
        }
        return true
    }
}



