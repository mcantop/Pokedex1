//
//  PokemonViewModel.swift
//  Pokedex1
//
//  Created by Maciej on 07/10/2022.
//

import SwiftUI

final class PokemonViewModel: ObservableObject {
    @Published var pokemons = [Pokemon]()
    @Published var filteredPokemons = [Pokemon]()
    
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
    
    func filterPokemon(by filter: String) {
        filteredPokemons = pokemons.filter { $0.type == filter }
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
