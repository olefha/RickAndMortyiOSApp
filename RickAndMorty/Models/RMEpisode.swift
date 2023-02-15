//
//  RMEpisode.swift
//  RickAndMorty
//
//  Created by Ole Hagemann on 07/02/2023.
//

import Foundation

struct RMEpisode: Codable {
    let id: Int
    let name: String
    let air_date: String
    let characters: String
    let url: String
    let created: String
}
