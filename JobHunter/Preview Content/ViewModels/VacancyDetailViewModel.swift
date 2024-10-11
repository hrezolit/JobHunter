//
//  VacancyDetailViewModel.swift
//  JobHunter
//
//  Created by Nikita on 11.10.2024.
//

import SwiftUI
import Combine

class VacancyDetailViewModel: ObservableObject {
    @Published var vacancy: Vacancy
    @Published var isFavorite: Bool
    
    init(vacancy: Vacancy) {
        self.vacancy = vacancy
        self.isFavorite = vacancy.isFavorite
    }
    
    func toggleFavorite() {
        isFavorite.toggle()
        vacancy.isFavorite = isFavorite
    }
}
