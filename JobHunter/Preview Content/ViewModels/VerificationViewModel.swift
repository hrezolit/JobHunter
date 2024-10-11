//
//  VerificationViewModel.swift
//  JobHunter
//
//  Created by Nikita on 11.10.2024.
//

import SwiftUI
import Combine

class VerificationViewModel: ObservableObject {
    @Published var code: String = ""
    @Published var isCodeValid: Bool = false
    @Published var errorMessage: String?
    
    func validateCode() {
        isCodeValid = code.count == 4
        errorMessage = isCodeValid ? nil : "Код должен содержать 4 цифры"
    }
}

