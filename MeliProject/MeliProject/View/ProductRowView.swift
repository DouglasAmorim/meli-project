//
//  ProductRowView.swift
//  MeliProject
//
//  Created by Douglas Amorim on 22/06/24.
//

import SwiftUI

struct ProductRowView: View {
    var product: ProductModel
    
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 5) {
                Text(product.title)
                    .font(.title2)
                    .fontWeight(.bold)
                Text("Preço \(String(product.price))")
                    .font(.caption)
                    .foregroundColor(Color.secondary)
                
            Image(product.thumbnail)
                .renderingMode(.original)
                .resizable()
                .scaledToFit()
                .frame(width: 80, height: 80, alignment: .center)
                .shadow(color: Color(red: 0, green: 0, blue: 0, opacity: 0.3), radius: 3, x: 2, y: 2)
                .cornerRadius(8)
            }
        }
    }
}

struct ProductRowView_Previews: PreviewProvider {
    static var previews: some View {
        ProductRowView(product: ProductModel())
    }
}
