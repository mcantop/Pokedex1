//
//  FilterButton.swift
//  Pokedex1
//
//  Created by Maciej on 08/10/2022.
//

import SwiftUI

struct FilterButton: View {
    var imageName: String
    var height: CGFloat = 24
    var width: CGFloat = 24
    var backgroundColor: Color = .purple
    @Binding var show: Bool
    
    var action: () -> Void
    
    var body: some View {
        Button { action() } label: {
            Image(imageName)
                .resizable()
                .frame(width: width, height: height)
                .padding(16)
        }
        .background(backgroundColor)
        .foregroundColor(.white)
        .clipShape(Circle())
        .shadow(color: .black.opacity(0.75), radius: 30, x: 0.0, y: 0.0)

    }
}
