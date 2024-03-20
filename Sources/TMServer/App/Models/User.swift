/*
VaporShell provides a minimal framework for starting Vapor projects.
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

/// This class provides the model for a user
final public class User: Model, Content {
    // Name of the table or collection.
    public static let schema = "User"

    /// Unique identifier for this user
    @ID(custom: "UserId", generatedBy: .database)
    public var id: Int?

    @Field(key: "Username")
    public var username: String

    @Field(key: "LoginCode")
    public var loginCode: String

    // Creates a new, empty user.
    public init() { }

    public init(id: Int? = nil, username: String, loginCode: String) {
        self.id = id
        self.username = username
        self.loginCode = loginCode
    }
}

