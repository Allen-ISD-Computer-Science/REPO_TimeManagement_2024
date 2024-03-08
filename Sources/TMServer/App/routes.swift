/*
VaporShell provides a minimal framework for starting Igis projects.
Copyright (C) 2021, 2022 CoderMerlin.com
This program is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.
This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.
You should have received a copy of the GNU General Public License
along with this program.  If not, see <https://www.gnu.org/licenses/>.
 */

import Vapor

import Fluent
import FluentMySQLDriver

struct TestUser: Content {
    var username: String
}

func routes(_ app: Application) throws {
    let userInfo = ["username": "Not logged in"]
    let userController = UserController()

    // app.get -> GET request made
    // app.post -> POST request made
    app.post("create-account") { req in 
        let user = try req.content.decode(TestUser.self)
        let username = user.username

        return try userController.createUser(req: req, username: username).map { creationResult in
            return req.view.render("creation-success", ["user": username, "code": creationResult.info])
            }
    }
    
                                                          
    app.get { req in
        return req.view.render("backend_test", userInfo)
    }
}
