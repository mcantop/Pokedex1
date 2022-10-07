//
//  PokedexView.swift
//  Pokedex1
//
//  Created by Maciej on 07/10/2022.
//

import SwiftUI

struct PokedexView: View {
    @StateObject var viewModel = PokemonViewModel()
    @State private var showTwoGrid = true
    private let twoGrid = [GridItem(.flexible()), GridItem(.flexible())]
    private let oneGrid = [GridItem(.flexible())]
    
    var body: some View {
        NavigationView {
            ScrollView {
                if showTwoGrid {
                    LazyVGrid(columns: twoGrid) {
                        ForEach(viewModel.pokemons) { pokemon in
                            PokemonCell(pokemon: pokemon, viewModel: viewModel)
                                .padding(.vertical, 8)
                                .padding(.horizontal, 8)
                        }
                    }
                    .padding(16)
                } else {
                    LazyVGrid(columns: oneGrid) {
                        ForEach(viewModel.pokemons) { pokemon in
                            PokemonCell(pokemon: pokemon, viewModel: viewModel)
                                .padding(.vertical, 8)
                                .padding(.horizontal, 8)
                        }
                    }
                    .padding(16)
                }
            }
            .navigationTitle("Pokedex")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        showTwoGrid = true
                    } label: {
                        Image(systemName: "square.grid.2x2.fill")
                    }
                }
                
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        showTwoGrid = false
                    } label: {
                        Image(systemName: "square.fill")
                    }
                }
            }
        }
    }
}

struct PokedexView_Previews: PreviewProvider {
    static var previews: some View {
        PokedexView()
    }
}
