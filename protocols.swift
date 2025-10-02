// protocol Person 
// defines a blueprint for a person
// get set readadble and writeable
// get read only

import Foundation

protocol Person {
    var firstName: String { get set }
    var lastName: String { get set }
    var birthDate: Date { get set }
    var profession: String { get }

    init(firstName: String, lastName: String, birthDate: Date)
}

// MARK: - Useful defaults for any Person
extension Person {
    var fullName: String { "\(firstName) \(lastName)" }
}

// MARK: - Concrete types conforming to Person
struct Student: Person {
    var firstName: String
    var lastName: String
    var birthDate: Date
    var profession: String { "Student" } // read-only via computed property

    init(firstName: String, lastName: String, birthDate: Date) {
        self.firstName = firstName
        self.lastName = lastName
        self.birthDate = birthDate
    }
}

struct Engineer: Person {
    var firstName: String
    var lastName: String
    var birthDate: Date
    let profession: String = "Engineer" // read-only via let

    init(firstName: String, lastName: String, birthDate: Date) {
        self.firstName = firstName
        self.lastName = lastName
        self.birthDate = birthDate
    }
}

func addPerson<T: Person>(_ person: T, to list: inout [Person]) {
    list.append(person)
}

func makeDate(year: Int, month: Int, day: Int) -> Date {
    var comps = DateComponents()
    comps.year = year
    comps.month = month
    comps.day = day
    return Calendar.current.date(from: comps) ?? Date()
}

var people: [Person] = []

let alex = Student(firstName: "Alex", lastName: "Kim", birthDate: makeDate(year: 2000, month: 5, day: 12))
let sam = Engineer(firstName: "Sam", lastName: "Lee", birthDate: makeDate(year: 1995, month: 1, day: 3))

addPerson(alex, to: &people)
addPerson(sam, to: &people)

print("People count: \(people.count)")
for p in people {
    print("- \(p.fullName) – \(p.profession)")
}

