// take JSON data and put it into a dictionary

struct DictionaryComponent {
    let dictionary: [String: Any]

    func addToJSON(_ json: inout [String: Any]) {
        for (key, value) in dictionary {
            json[key] = value
        }
    }
}

@resultBuilder 
struct JSONBuilder {
    static func buildBlock(_ components: DictionaryComponent...) ->
    [String: Any] {
        var result: [String: Any] = [:]

        for component in components {
            component.addToJSON(&result)
        }
        
        return result
    }

    static func buildExpression(_ expression: [String: Any]) ->
        DictionaryComponent {
            return DictionaryComponent(dictionary: expression)
        }
}

func buildJSON(@JSONBuilder _ content: () -> [String: Any]) -> [String: Any] {
    return content()
}

let json = buildJSON {
    ["name": "Jacob"]
    ["age": 31]
    ["active": true]
    ["scores": [1, 2, 3]]
}

print(json)
