//
//  LoginView.swift
//  JobHunter
//
//  Created by Nikita on 09.10.2024.
//

import SwiftUI

struct LoginView: View {
    @StateObject private var viewModel = LoginViewModel()
    weak var coordinator: AppCoordinator?
    
    var body: some View {
        VStack(spacing: 16) {
            Spacer()
            Text("Вход в личный кабинет")
                .font(.largeTitle)
                .bold()
                .multilineTextAlignment(.center)
            
            TextField("Электронная почта", text: $viewModel.loginModel.email)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .keyboardType(.emailAddress)
                .autocapitalization(.none)
                .padding(.horizontal)
                .onChange(of: viewModel.loginModel.email) {
                    viewModel.validateEmail()
                }
            
            if let errorMessage = viewModel.errorMessage {
                Text(errorMessage)
                    .foregroundColor(.red)
                    .font(.caption)
            }
            
            Button(action: {
                viewModel.validateEmail()
                if viewModel.errorMessage == nil {
                    coordinator?.showVerificationView()
                }
            }) {
                Text("Продолжить")
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(viewModel.loginModel.isValidEmail ? Color.blue : Color.gray)
                    .foregroundColor(.white)
                    .cornerRadius(8)
            }
            .disabled(!viewModel.loginModel.isValidEmail)
            .padding(.horizontal)
            
            Spacer()
        }
        .padding()
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView(coordinator: nil)
    }
}
