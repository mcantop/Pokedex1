//
//  BarView.swift
//  Pokedex1
//
//  Created by Maciej on 07/10/2022.
//

import SwiftUI

struct BarView: View {
    var value = 100
    var title = "HP"
    var color: Color = .blue
    
    var body: some View {
        
        HStack {
            Text(title)
                .frame(maxWidth: 70, alignment: .leading)
            
            Text("\(value)")
                .lineLimit(1)
                .frame(width: 50)
            
            ZStack(alignment: .leading) {
                Capsule()
                    .frame(width: 150, height: 20)
                    .foregroundColor(Color(.systemGray5))
                
                Capsule()
                    .frame(width: value > 150 ? CGFloat(150) : CGFloat(value), height: 20)
                    .foregroundColor(color)
            }
            
            Spacer()
        }
    }
}

struct BarChartView: View {
    let pokemon: Pokemon
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            BarView(value: pokemon.attack, title: "Attack", color: .red)
            BarView(value: pokemon.defense, title: "Defense", color: .blue)
            BarView(value: pokemon.height, title: "Height", color: .orange)
            BarView(value: pokemon.weight, title: "Weight", color: .purple)
        }
    }
}

struct BarView_Previews: PreviewProvider {
    static var previews: some View {
        //        BarView()
        BarChartView(pokemon: samplePokemon)
    }
}
