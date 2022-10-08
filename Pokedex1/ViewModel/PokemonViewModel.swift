//
//  PokemonViewModel.swift
//  Pokedex1
//
//  Created by Maciej on 07/10/2022.
//

import SwiftUI

final class PokemonViewModel: ObservableObject {
    @Published var pokemons = [Pokemon]()
    
    private let url = "https://pokedex-bb36f.firebaseio.com/pokemon.json"
    
    init() {
        fetchData()
    }
    
    func fetchData() {
        guard let url = URL(string: url) else { return }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data?.parseData(removeString: "null,") else { return }
            
            guard let pokemon = try? JSONDecoder().decode([Pokemon].self, from: data) else { return }
            
            DispatchQueue.main.async {
                self.pokemons = pokemon
            }
        }
        .resume()
    }
    
    func pokemonBackgroundColor(forType type: String) -> Color {
        switch type {
        case "fire": return .red
        case "poison": return .green
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
}

extension Data {
    func parseData(removeString string: String) -> Data? {
        let dataAsString = String(data: self, encoding: .utf8)
        let parsedDataString = dataAsString?.replacingOccurrences(of: string, with: "")
        
        guard let data = parsedDataString?.data(using: .utf8) else { return nil }
        
        return data
    }
}
