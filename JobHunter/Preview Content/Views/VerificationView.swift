//
//  VerificationView.swift
//  JobHunter
//
//  Created by Nikita on 11.10.2024.
//

import SwiftUI

struct VerificationView: View {
    @StateObject private var viewModel = VerificationViewModel()
    weak var coordinator: AppCoordinator?
    
    var body: some View {
        VStack(spacing: 16) {
            
            Text("Отправили код на example@mail.ru")
                .font(.headline)
            
            Text("Напишите его, чтобы подтвердить, что это вы, а не кто-то другой входит в личный кабинет")
                .font(.subheadline)
                .padding(.bottom)
            
            Spacer()
            
            TextField("Введите код", text: $viewModel.code)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .keyboardType(.numberPad)
                .onChange(of: viewModel.code) {
                    viewModel.validateCode()
                }
                .padding(.horizontal)
            
            if let errorMessage = viewModel.errorMessage {
                Text(errorMessage)
                    .foregroundColor(.red)
                    .font(.caption)
            }
            
            Button(action: {
                viewModel.validateCode()
                if viewModel.isCodeValid {
                    coordinator?.showMainView()
                }
            }) {
                Text("Подтвердить")
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(viewModel.isCodeValid ? Color.blue : Color.gray)
                    .foregroundColor(.white)
                    .cornerRadius(8)
            }
            .disabled(!viewModel.isCodeValid)
            .padding(.horizontal)
            
            Spacer()
        }
        .padding()
    }
}

struct VerificationView_Previews: PreviewProvider {
    static var previews: some View {
        VerificationView(coordinator: nil)
    }
}
