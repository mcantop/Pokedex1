//
//  PokedexView.swift
//  Pokedex1
//
//  Created by Maciej on 07/10/2022.
//

import SwiftUI

struct PokedexView: View {
    @StateObject var viewModel = PokemonViewModel()
    @State private var showGrid = 0
    @State private var showFilterButtons = false
    @State private var filterApplied = false
    private let twoGrid = [GridItem(.flexible()), GridItem(.flexible())]
    private let oneGrid = [GridItem(.flexible())]
    private let grids = ["square.grid.2x2.fill", "square.fill"]
    
    var body: some View {
        NavigationView {
            ZStack(alignment: .bottomTrailing) {
                ScrollView {
                    LazyVGrid(columns: showGrid == 0 ? twoGrid : oneGrid) {
                        let dataSource = filterApplied ? viewModel.filteredPokemons : viewModel.pokemons
                        ForEach(dataSource) { pokemon in
                            NavigationLink {
                                PokemonDetailsView(pokemon: pokemon)
                            } label: {
                                PokemonCell(pokemon: pokemon, grid: showGrid)
                                    .padding(.vertical, 8)
                                    .padding(.horizontal, 8)
                            }
                        }
                    }
                    .padding(16)
                    .navigationTitle("Pokedex")
                    .toolbar {
                        ToolbarItem(placement: .navigationBarLeading) {
                            Text("Pokemons: \(viewModel.pokemons.count)")
                        }
                        
                        ToolbarItem(placement: .navigationBarTrailing) {
                            Picker("Grid style", selection: $showGrid) {
                                ForEach(0..<2) { index in
                                    Label("Grid style \(index + 1)", systemImage: grids[index])
                                }
                            }
                            .pickerStyle(.menu)
                            .accentColor(Color("TextColor2"))
                        }
                    }
                }
                
                VStack {
                    if showFilterButtons {
                        FilterButton(imageName: "fire", backgroundColor: .red, show: $showFilterButtons) {
                            filterApplied = true
                            showFilterButtons = false
                            viewModel.filterPokemon(by: "fire")
                        }
                        
                        FilterButton(imageName: "leaf", backgroundColor: .green, show: $showFilterButtons) {
                            filterApplied = true
                            showFilterButtons = false
                            viewModel.filterPokemon(by: "grass")
                        }
                        
                        FilterButton(imageName: "water", backgroundColor: .blue, show: $showFilterButtons) {
                            filterApplied = true
                            showFilterButtons = false
                            viewModel.filterPokemon(by: "water")
                        }
                        
                        FilterButton(imageName: "lightning", backgroundColor: .yellow, show: $showFilterButtons) {
                            filterApplied = true
                            showFilterButtons = false
                            viewModel.filterPokemon(by: "electric")
                        }
                    }
                    
                    let imageName = filterApplied ? "refresh" : "filter"
                    FilterButton(imageName: imageName, height: 36, width: 36, show: $showFilterButtons) {
                        filterApplied ? (filterApplied = false) : (showFilterButtons = true)
                    }
                    .rotationEffect(.init(degrees: self.showFilterButtons ? 180 : 0))
                }
                .padding(24)
                .animation(.spring())
            }
        }
    }
}

struct PokedexView_Previews: PreviewProvider {
    static var previews: some View {
        PokedexView()
    }
}
