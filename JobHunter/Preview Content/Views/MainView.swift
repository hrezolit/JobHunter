//
//  MainViewModel.swift
//  JobHunter
//
//  Created by Nikita on 11.10.2024.
//

import SwiftUI

struct MainView: View {
    @StateObject private var viewModel = MainViewModel()
    weak var coordinator: AppCoordinator?
    
    var body: some View {
        NavigationView {
            VStack {
                if let errorMessage = viewModel.errorMessage {
                    Text(errorMessage)
                        .foregroundColor(.red)
                        .padding()
                } else {
                    List(viewModel.vacancies) { vacancy in
                        VacancyRow(vacancy: vacancy)
                            .onTapGesture {
                                coordinator?.showVacancyDetail(vacancy: vacancy)
                            }
                    }
                }
            }
            .navigationTitle("Вакансии для вас")
            .onAppear {
                viewModel.fetchVacancies()
            }
        }
    }
}

struct VacancyRow: View {
    let vacancy: Vacancy
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(vacancy.title)
                .font(.headline)
            Text(vacancy.company)
                .font(.subheadline)
            Text(vacancy.address.town)
                .font(.caption)
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView(coordinator: nil)
    }
}
