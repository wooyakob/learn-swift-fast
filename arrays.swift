// swift array
let guests = ["Jacob", "John", "Luke"]

for name in guests {
    print("Hello, \(name)")
}

// filter array in closure with a prefix
let greetGuest2: (String) -> Void = { name in
    if name.hasPrefix("J") {
        print("\(name) is on the guest list")
    } else {
        print("\(name) was not invited")
    }
}

guests.forEach(greetGuest2)


// functions can accept multiple closure params

// trailing closures
func performTask(success: () -> Void, failure: () -> Void) {
    let taskSucceeded = Bool.random()
    
    if taskSucceeded {
        success()
    } else {
        failure()
    }
}

performTask(success: { print("Task succeeded") }, failure: { print("Task failed") })




