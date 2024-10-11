//
//  LoginViewModel.swift
//  JobHunter
//
//  Created by Nikita on 09.10.2024.
//

import SwiftUI
import Combine

class LoginViewModel: ObservableObject {
    @Published var loginModel = LoginModel()
    @Published var errorMessage: String?
    
    func validateEmail() {
        if loginModel.isValidEmail {
            errorMessage = nil
        } else {
            errorMessage = "Вы ввели неверный e-mail"
        }
    }
}
