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
    public static let schema = "users"

    /// Unique identifier for this user
    @ID(custom: "user_id", generatedBy: .database)
    public var id: Int?

    @Field(key: "username")
    public var username: String

    // Creates a new, empty user.
    public init() { }
}

