let clos1 = { () -> Void in
    print ("Hello World!")
}

// call closure like this
clos1()


// give it argument name
let clos2 = { 
    (name: String) -> Void in
    print ("Hello \(name)")
}

clos2("Jacob")

// the ability to pass closures to functions is what makes them so powerful and versatile

// define functions using a closure
func testClosure(handler: (String) -> Void) {
    handler("Jacob")
}

testClosure(handler: clos2)


// return type changed from void to string
let clos3 = {
    (name: String) -> String in
    return "Hello \(name)"
}

var message = clos3("Jacob")
print(message)
