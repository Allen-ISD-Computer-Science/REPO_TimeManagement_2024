import Vapor
import Fluent
import FluentMySQLDriver

public struct ServerResult {
    var success: Bool
    var info: String
}

public class UserController {
    private func generateLoginCode() -> String {
        // dict is at /usr/share/dict/words
        let wordList = "/usr/share/dict/words"
        var loginCode = ""

        do {
            // parse word list and convert to array
            let rawString = try String(contentsOfFile: wordList)
            var arrayOfWords = rawString.split(separator: "\n")

            // prevent insecure codes from being generated by removing short words
            arrayOfWords.removeAll(where: {$0.count < 4})

            // randomly choose 4 words
            for _ in stride(from: 0, to: 4, by: 1) {
                loginCode += arrayOfWords[Int.random(in:0..<arrayOfWords.count)] + " "
            }
            loginCode.removeLast()
            
        } catch {
            print(error)
        }
        
        return loginCode
    }

    public func queryNameAvailablity(req: Request, username: String) throws -> EventLoopFuture<Bool> {
        return User.query(on: req.db)
          .filter(\.$username == username)
          .first()
          .map { user in
              return user == nil
          }
    }
    
    public func createUser(req: Request, username: String) throws -> EventLoopFuture<ServerResult> {
        let isNameAvailable = try queryNameAvailablity(req: req, username: username)
        return isNameAvailable.map { asyncCheck -> ServerResult in
            var returnString = "UsernameTaken"
            if asyncCheck {
                returnString = self.generateLoginCode()
            }

            let resultToBeConverted = ServerResult(success: asyncCheck, info: returnString)
            return resultToBeConverted
        }
    }
}
