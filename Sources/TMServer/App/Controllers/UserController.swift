import Vapor
import Fluent
import FluentMySQLDriver

public class UserController {
    private func generateLoginCode() throws -> String {
        // dict is at /usr/share/dict/words
        let wordList = "/usr/share/dict/words"

        do {
            let rawList = try String(contentsOfFile: wordList)

            
        } catch {
            print(error)
        }

        return "test"
    }
}
