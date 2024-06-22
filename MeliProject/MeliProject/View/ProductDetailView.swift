//
//  ProductDetailView.swift
//  MeliProject
//
//  Created by Douglas Amorim on 22/06/24.
//

import SwiftUI

struct ProductDetailView: View {
    var product: ProductModel
    
    var body: some View {
        NavigationView {
            ScrollView(.vertical, showsIndicators: false) {
                VStack(alignment: .leading, spacing: 20) {
                    
                    AsyncImage(url: URL(string: product.thumbnail))
                        .scaledToFit()
                        .frame(alignment: .center)
                    
                    VStack(alignment: .leading, spacing: 24) {
                        Text("Product: \(product.title)")
                            .font(.largeTitle)
                        
                        Text("Price: \(product.price) \(product.currency)")
                            .font(.title)
                            .multilineTextAlignment(.leading)
                    }
                
                    ForEach(product.attributes) { attribute in
                        VStack(alignment: .leading, spacing: 8) {
                            HStack {
                                Text(attribute.name ?? " - ")
                                    .font(.title3)

                                Spacer()
                                
                                Text(attribute.valueName ?? " - ")
                                    .font(.title3)
                            }//: HStack

                        }//: VStack
                    }//: For
                }//: VStack
                .padding(.horizontal, 24)
            }
        } //: NavigationView
    }
}

struct ProductDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ProductDetailView(product: ProductModel())
    }
}
