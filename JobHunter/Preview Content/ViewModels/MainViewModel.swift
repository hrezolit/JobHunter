//
//  Untitled.swift
//  JobHunter
//
//  Created by Nikita on 11.10.2024.
//

import SwiftUI
import Combine

class MainViewModel: ObservableObject {
    @Published var vacancies: [Vacancy] = []
    @Published var errorMessage: String?
    
    private var cancellables = Set<AnyCancellable>()
    
    func fetchVacancies() {
        APIService.shared.fetchVacancies { [weak self] result in
            DispatchQueue.main.async {
                switch result {
                case .success(let vacancies):
                    self?.vacancies = vacancies
                case .failure(let error):
                    self?.errorMessage = error.localizedDescription
                }
            }
        }
    }
}
