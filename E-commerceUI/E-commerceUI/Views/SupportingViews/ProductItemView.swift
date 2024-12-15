//
//  ProductItemView.swift
//  E-commerceUI
//
//  Created by Mehmet Tuna Arıkaya on 14.12.2024.
//

import SwiftUI

struct ProductItemView: View {
    var product : Product
    var body: some View {
        NavigationLink {
            ProductDetailsView(product: product)
        } label : {
            VStack{
                Image(product.images[0])
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 165, height: 200)
                    .cornerRadius(5)
                    .shadow(radius: 1)
                
                Text(product.title)
                    .font(Font.custom("Tenor Sans",size:12))
                    .multilineTextAlignment(.leading)
                    .foregroundColor(Color.BodyGrey)
                    .frame(width: 165,alignment: .leading)
                Text("₺ \(product.price)")
                    .font(Font.custom("Tenor Sans",size:16))
                    .multilineTextAlignment(.leading)
                    .foregroundStyle(Color.Default)
                    .frame(width: 165,alignment: .leading)
                    .padding(.top,2)
                    
                
            }
        }
    }
}
