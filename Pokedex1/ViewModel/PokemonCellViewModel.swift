//
//  PokemonCellViewModel.swift
//  Pokedex1
//
//  Created by Maciej on 08/10/2022.
//

import SwiftUI

struct PokemonCellViewModel {
    let pokemon: Pokemon
    
    var backgroundColor: Color {
        switch pokemon.type {
        case "fire": return .red
        case "poison", "bug", "grass": return .green
        case "water": return .teal
        case "electric": return .yellow
        case "psychic": return .purple
        case "normal": return .orange
        case "ground": return .gray
        case "flying": return .blue
        case "fairy": return .pink
        default: return .indigo
        }
    }
    
    init(pokemon: Pokemon) {
        self.pokemon = pokemon
    }
}
