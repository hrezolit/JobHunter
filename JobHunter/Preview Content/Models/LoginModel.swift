//
//  LoginModel.swift
//  JobHunter
//
//  Created by Nikita on 09.10.2024.
//

import Foundation

struct LoginModel {
    var email: String = ""
    var isValidEmail: Bool {
        //MARK: TODO Простейшая проверка email, доработать 
        return email.contains("@") && email.contains(".")
    }
}
