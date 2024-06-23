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
                Text(product.title ?? "")
                    .font(.title2)
                    .fontWeight(.bold)
                
                Text("Price \(String(format: "%.2f", product.price ?? 0.0)) \(product.currency ?? "")")
                    .font(.caption)
                    .foregroundColor(Color.secondary)
            }
            
            Spacer()
            
            AsyncImage(url: URL(string: product.thumbnail ?? "")) { phase in
                
                switch phase {
                case .success(let image):
                    image.resizable()
                    
                case .failure(_):
                    Image(systemName: "photo")
                        .scaledToFit()
                    
                default:
                    ProgressView()
                }
                
            }
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
