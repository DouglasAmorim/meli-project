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
                
                Text("Preço \(String(product.price)) \(product.currency)")
                    .font(.caption)
                    .foregroundColor(Color.secondary)
            }
            
            Spacer()
            
            AsyncImage(url: URL(string: product.thumbnail))
                .scaledToFit()
                .frame(alignment: .trailing)
        }
    }
}

struct ProductRowView_Previews: PreviewProvider {
    static var previews: some View {
        ProductRowView(product: ProductModel())
    }
}
