//
//  PokemonCell.swift
//  Pokedex1
//
//  Created by Maciej on 07/10/2022.
//

import SwiftUI
import Kingfisher

struct PokemonCell: View {
    let pokemon: Pokemon
    let viewModel: PokemonCellViewModel
    let grid: Int
    
    init(pokemon: Pokemon, grid: Int) {
        self.pokemon = pokemon
        self.viewModel = PokemonCellViewModel(pokemon: pokemon)
        self.grid = grid
    }
    
    var body: some View {
        ZStack {
            if grid == 0 {
                VStack(spacing: 16) {
                    Text(pokemon.name.capitalized)
                        .font(.headline)
                        .foregroundColor(Color("TextColor"))
                    
                    KFImage(URL(string: pokemon.imageURL))
                        .placeholder({
                            ProgressView()
                                .foregroundColor(Color("TextColor"))
                        })
                        .resizable()
                        .scaledToFit()
                    
                    Text(pokemon.type.capitalized)
                        .font(.subheadline)
                        .bold()
                        .foregroundColor(Color("TextColor"))
                        .padding(.vertical, 8)
                        .padding(.horizontal, 16)
                        .overlay(
                            RoundedRectangle(cornerRadius: 16)
                                .fill(.white.opacity(0.25))
                        )
                    
                }
                .padding(16)
            } else {
                VStack(spacing: 8) {
                    Text(pokemon.name.capitalized)
                        .font(.title)
                        .bold()
                        .foregroundColor(Color("TextColor"))
                    
                    KFImage(URL(string: pokemon.imageURL))
                        .placeholder({
                            ProgressView()
                                .foregroundColor(Color("TextColor"))
                        })
                        .resizable()
                        .scaledToFit()
                        .frame(maxWidth: 200, maxHeight: 200)
                    
                    Text(pokemon.description)
                        .padding()
                        .lineLimit(4)
                        .frame(maxWidth: .infinity)
                        .foregroundColor(Color("TextColor"))
                    
                    HStack {
                        Text("🗡 \(pokemon.attack)")
                            .frame(maxWidth: .infinity)
                        
                        Text(pokemon.type.capitalized)
                            .font(.subheadline)
                            .padding(.vertical, 8)
                            .padding(.horizontal, 16)
                            .overlay(
                                RoundedRectangle(cornerRadius: 16)
                                    .fill(.white.opacity(0.25))
                        )
                            .frame(maxWidth: .infinity)
                        
                        Text("🛡 \(pokemon.defense)")
                            .frame(maxWidth: .infinity)
                    }
                    .foregroundColor(Color("TextColor"))
                    .bold()
                    .font(.title3)

                }
                .padding(16)
            }
        }
        .background(viewModel.backgroundColor)
        .cornerRadius(16)
        .shadow(color: viewModel.backgroundColor, radius: 4, x: 0.0, y: 0.0)
    }
}
