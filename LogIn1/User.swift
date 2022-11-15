//
//  User.swift
//  LogIn1
//
//  Created by Дмитрий Абдуллаев on 15.11.2022.
//

import Foundation

struct User {
    var login: String
    var password: String
    var person: Person
    
   static func getUserData() -> User {
        User(login: "User", password: "Password", person: Person(name: "John", surname: "Smith"))
    }
}

struct Person {
    var name: String
    var surname: String
    var fullName: String {
        "\(name) \(surname)"
    }
}
