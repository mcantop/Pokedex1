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
    let description: String
    let evolutionChain: [EvolutionChain]?
    let height: Int
    let weight: Int
//    let defense: Int?
    
    enum CodingKeys: String, CodingKey {
        case attack, defense
        case description
        case evolutionChain, height, id
        case imageURL = "imageUrl"
        case name, type, weight
//        case defense = "defense:"
    }
}

struct EvolutionChain: Codable, Identifiable {
    let id: String
    let name: String
}

let samplePokemon = Pokemon(id: 1,
                             name: "Bulbasaur",
                             type: "Poison",
                             imageURL: "Bulbasaur can be seen napping in bright sunlight. There is a seed on its back. By soaking up the sun’s rays, the seed grows progressively larger.",
                             attack: 49,
                             defense: 49,
                             description: "https://firebasestorage.googleapis.com/v0/b/pokedex-bb36f.appspot.com/o/pokemon_images%2F2CF15848-AAF9-49C0-90E4-28DC78F60A78?alt=media&token=15ecd49b-89ff-46d6-be0f-1812c948e334",
                             evolutionChain: nil,
                             height: 20,
                             weight: 2100)

//Pokemon(id: 1,
//                             name: "Bulbasaur",
//                             imageUrl: "https://firebasestorage.googleapis.com/v0/b/pokedex-bb36f.appspot.com/o/pokemon_images%2F2CF15848-AAF9-49C0-90E4-28DC78F60A78?alt=media&token=15ecd49b-89ff-46d6-be0f-1812c948e334",
//                             description: "Bulbasaur can be seen napping in bright sunlight. There is a seed on its back. By soaking up the sun’s rays, the seed grows progressively larger.",
//                             height: 7,
//                             weight: 69,
//                             attack: 49,
//                             defense: 49,
//                             type: "Poison",
//                             evolutionChain: nil)
