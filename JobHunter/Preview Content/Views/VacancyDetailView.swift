//
//  VacancyDetailView.swift
//  JobHunter
//
//  Created by Nikita on 11.10.2024.
//

import SwiftUI

struct VacancyDetailView: View {
    @StateObject private var viewModel: VacancyDetailViewModel
    weak var coordinator: AppCoordinator?
    
    init(vacancy: Vacancy, coordinator: AppCoordinator?) {
        _viewModel = StateObject(wrappedValue: VacancyDetailViewModel(vacancy: vacancy))
        self.coordinator = coordinator
    }
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                Text(viewModel.vacancy.title)
                    .font(.largeTitle)
                    .bold()
                
                Text("Компания: \(viewModel.vacancy.company)")
                    .font(.headline)
                
                if let salary = viewModel.vacancy.salary {
                    Text("Зарплата: \(salary)")
                        .font(.subheadline)
                }
                
                if let experienceText = viewModel.vacancy.experience.fullText {
                    Text("Требуемый опыт: \(experienceText)")
                        .font(.subheadline)
                }
                
                if let description = viewModel.vacancy.description {
                    Text(description)
                        .font(.body)
                        .padding(.top)
                }
                
                Button(action: {
                    viewModel.toggleFavorite()
                }) {
                    Text(viewModel.isFavorite ? "Удалить из избранного" : "Добавить в избранное")
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(viewModel.isFavorite ? Color.red : Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                }
            }
            .padding()
        }
        .navigationTitle("Детали вакансии")
    }
}

struct VacancyDetailView_Previews: PreviewProvider {
    static var previews: some View {
        // Пример вакансии для предпросмотра
        let exampleVacancy = Vacancy(
            id: "1234",
            title: "Программист Swift",
            company: "TechCorp",
            address: Vacancy.Address(town: "Москва", street: "Улица Ленина", building: "12"),
            experience: Vacancy.Experience(previewText: "2 года", fullText: "2-3 года работы с iOS"),
            publishedDate: "2023-10-08",
            salary: "150,000 руб.",
            description: "Мы ищем опытного разработчика...",
            isFavorite: false
        )
        
        return VacancyDetailView(vacancy: exampleVacancy, coordinator: nil)
    }
}
