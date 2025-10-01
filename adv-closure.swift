// logging system
// code defines a Logger type, allows us to register a log handler and a message. Enumeration defines three log levels.
// closures allow us to encap functionality in self contained block of code and pass it around within our application

enum LogLevel {
    case info, warning, error
}

class Logger {
    typealias logLevelHandler = (String) -> Void

    private var handlers: [LogLevel: [logLevelHandler]] = [:]

// escaping, closure may be called after function returns 
    func registerHandler(for level: LogLevel,
    handler: @escaping logLevelHandler) {
        if handlers[level] == nil {
            handlers[level] = []
        }
        handlers[level]?.append(handler)
    }

    func log(_ message: String, level: LogLevel) {
        if let levelHandlers = handlers[level] {
            for handler in levelHandlers {
                handler(message)
            }
        }

    } 
}

let logger = Logger()

logger.registerHandler(for: .info) { message in
    print("INFO: \(message)")
}

logger.registerHandler(for: .warning) { message in
    print("WARNING: \(message)")
}

logger.registerHandler(for: .error) { message in
    print("ERROR: \(message)")
}


logger.log("Informational Message", level: .info)
logger.log("Warning Message", level: .warning)
logger.log("Error Message", level: .error)

