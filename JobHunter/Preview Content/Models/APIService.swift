//
//  APIService.swift
//  JobHunter
//
//  Created by Nikita on 11.10.2024.
//

import Foundation
import Alamofire

class APIService {
    static let shared = APIService()
    
    private let baseURL = "https://run.mocky.io/v3/ed41d10e-0c1f-4439-94fa-9702c9d95c14"
    
    private init() {}
    
    func fetchVacancies(completion: @escaping (Result<[Vacancy], Error>) -> Void) {
        AF.request(baseURL).responseDecodable(of: [Vacancy].self) { response in
            switch response.result {
            case .success(let vacancies):
                completion(.success(vacancies))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
