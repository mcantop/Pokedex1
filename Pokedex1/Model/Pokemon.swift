//
//  Pokemon.swift
//  Pokedex1
//
//  Created by Maciej on 07/10/2022.
//

import Foundation

struct Pokemon: Codable, Identifiable {
    let id: Int
    let name: String
    let type: String
    let imageURL: String
    let attack: Int
    let defense: Int
    let welcomeDescription: String
    let evolutionChain: [EvolutionChain]?
    let height: Int
    let weight: Int
    let welcomeDefense: Int?
    
    enum CodingKeys: String, CodingKey {
        case attack, defense
        case welcomeDescription = "description"
        case evolutionChain, height, id
        case imageURL = "imageUrl"
        case name, type, weight
        case welcomeDefense = "defense:"
    }
}

struct EvolutionChain: Codable {
    let id: String
    let name: String
}
