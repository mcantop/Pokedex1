//
//  PokemonDetailsView.swift
//  Pokedex1
//
//  Created by Maciej on 07/10/2022.
//

import SwiftUI
import Kingfisher

struct PokemonDetailsView: View {
    let pokemon: Pokemon
    let viewModel: PokemonCellViewModel
    
    init(pokemon: Pokemon) {
        self.pokemon = pokemon
        self.viewModel = PokemonCellViewModel(pokemon: pokemon)
    }
    
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [viewModel.backgroundColor, Color("TextColor")]), startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()
            
            Color("TextColor").offset(y: 300)
            
            ScrollView {
                KFImage(URL(string: pokemon.imageURL))
                    .placeholder {
                        ProgressView()
                    }
                    .resizable()
                    .scaledToFit()
                    .frame(width: 200, height: 200)
                
                VStack(spacing: 10) {
                    HStack {
                        Text("#\(pokemon.id)")

                        Text(pokemon.name.capitalized)
                            .font(.largeTitle)
                    }
                    .padding(.top, 30)
                    
                    Text(pokemon.type.capitalized)
                        .font(.subheadline)
                        .bold()
                        .foregroundColor(Color("TextColor"))
                        .padding(.vertical, 8)
                        .padding(.horizontal, 16)
                        .background(viewModel.backgroundColor)
                        .cornerRadius(16)
                    
                    VStack(alignment: .leading, spacing: 16) {
                        VStack(alignment: .leading, spacing: 5) {
                            Text("Pokemon Description")
                                .font(.footnote)
                                .foregroundColor(.secondary)
                            
                            Text(pokemon.description)
                        }
                        
                        
                        if let evolutionChain = pokemon.evolutionChain {
                        VStack(alignment: .leading, spacing: 5) {
                            Text("Evolution Chain")
                                .font(.footnote)
                                .foregroundColor(.secondary)
                            
                                HStack {
                                    ForEach(evolutionChain) { evolvPokemon in
                                        HStack {
                                            Image(systemName: "arrow.forward.circle.fill")
                                                .foregroundColor(viewModel.backgroundColor)
                                            Text("\(evolvPokemon.name.capitalized)")
                                        }
                                    }
                                }
                            }
                        }
                        
                        VStack(alignment: .leading, spacing: 5) {
                            Text("Stats")
                                .font(.footnote)
                                .foregroundColor(.secondary)
                            
                            BarChartView(pokemon: pokemon)
                                .padding(.bottom, 16)
                        }
                    }
                    .padding(.horizontal, 16)
                }
                .frame(maxWidth: .infinity)
                .background(Color("TextColor"))
                .cornerRadius(40)
                .padding(.top, -40)
                .zIndex(-1)
            }
        }
        .navigationBarTitleDisplayMode(.inline)
        .accentColor(Color("TextColor"))
        .toolbarBackground(.hidden, for: .navigationBar)
    }
}

struct PokemonDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        let pokemon = Pokemon(id: 1, name: "Bulbasaur", type: "poison", imageURL: "https://firebasestorage.googleapis.com/v0/b/pokedex-bb36f.appspot.com/o/pokemon_images%2F2CF15848-AAF9-49C0-90E4-28DC78F60A78?alt=media&token=15ecd49b-89ff-46d6-be0f-1812c948e334", attack: 49, defense: 49, description: "Bulbasaur can be seen napping in bright sunlight.\nThere is a seed on its back. By soaking up the sun’s rays,\nthe seed grows progressively larger.",
                              evolutionChain: [EvolutionChain(id: "2", name: "ivysaur"),
                                               EvolutionChain(id: "3", name: "venusaur")], height: 7, weight: 69)
        
        PokemonDetailsView(pokemon: pokemon)
    }
}
