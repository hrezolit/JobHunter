//
//  Vacancy.swift
//  JobHunter
//
//  Created by Nikita on 11.10.2024.
//

import Foundation

struct Vacancy: Decodable, Identifiable {
    let id: String
    let title: String
    let company: String
    let address: Address
    let experience: Experience
    let publishedDate: String
    let salary: String?
    let description: String?
    var isFavorite: Bool
    
    struct Address: Decodable {
        let town: String
        let street: String?
        let building: String?
    }

    struct Experience: Decodable {
        let previewText: String
        let fullText: String?
    }
}
