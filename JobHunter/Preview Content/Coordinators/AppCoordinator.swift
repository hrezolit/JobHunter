//
//  AppCoordinator.swift
//  JobHunter
//
//  Created by Nikita on 11.10.2024.
//

import SwiftUI

class AppCoordinator: ObservableObject {
    @Published var currentView: AnyView = AnyView(LoginView(coordinator: nil))
    
    func showLoginView() {
        currentView = AnyView(LoginView(coordinator: self))
    }
    
    func showVerificationView() {
        currentView = AnyView(VerificationView(coordinator: self))
    }
    
    func showMainView() {
        currentView = AnyView(MainView(coordinator: self))
    }
    
    func showVacancyDetail(vacancy: Vacancy) {
        currentView = AnyView(VacancyDetailView(vacancy: vacancy, coordinator: self))
    }
}
