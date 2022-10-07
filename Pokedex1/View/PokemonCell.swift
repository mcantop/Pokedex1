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
    let viewModel: PokemonViewModel
    let backgroundColor: Color
    
    init(pokemon: Pokemon, viewModel: PokemonViewModel) {
        self.pokemon = pokemon
        self.viewModel = viewModel
        self.backgroundColor = viewModel.pokemonBackgroundColor(forType: pokemon.type)
    }
    
    var body: some View {
        ZStack {
            VStack(spacing: 16) {
                Text(pokemon.name.capitalized)
                    .font(.headline)
                    .foregroundColor(Color("TextColor"))
                
                KFImage(URL(string: pokemon.imageURL))
                    .placeholder({
                        ProgressView()
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
        }
        .background(backgroundColor)
        .cornerRadius(16)
        .shadow(color: backgroundColor, radius: 4, x: 0.0, y: 0.0)
    }
}
