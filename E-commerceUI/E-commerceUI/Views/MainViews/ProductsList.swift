//
//  ProductList.swift
//  E-commerceUI
//
//  Created by Mehmet Tuna Arıkaya on 14.12.2024.
//

import SwiftUI

struct ProductsList: View {
    
    @State var presentSideMenu = false
    @State var presentSideCart = false
    
    private let adaptiveColumns = [GridItem(.adaptive(minimum: 150))]
    
    var body: some View {
        ZStack {
            Color.white.edgesIgnoringSafeArea(.all)
            ZStack {
                VStack(spacing: 0) {
                    HStack {
                        Text("Ürünler")
                            .font(tenorSans(24))
                            .foregroundColor(.black)
                        Spacer()
                    }
                    .padding()
                    
                    ScrollView(.vertical) {
                        VStack {
                            ScrollView(.vertical) {
                                LazyVGrid(columns: adaptiveColumns) {
                                    ForEach(0..<6, id: \.self) { i in
                                        ProductItemView(product: products[i])
                                    }
                                    
                                }
                            }
                            .scrollIndicators(.hidden)
                        }.padding([.leading, .trailing], 20)
                        FooterView()
                    }
                    .edgesIgnoringSafeArea(.all)
                }
                .padding(.top, 56)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .overlay(alignment: .top) {
                HeaderView {
                    presentSideMenu.toggle()
                } cartAction: {
                    presentSideCart.toggle()
                }
            }
            
            SideMenu()
            SideCart()
        }
        .navigationBarHidden(true)
    }
    
    @ViewBuilder
    private func SideMenu() -> some View {
        SideView(isShowing: $presentSideMenu, content: AnyView(SideMenuViewContents(presentSideMenu: $presentSideMenu)), direction: .leading)
    }
    
    @ViewBuilder
    private func SideCart() -> some View {
        SideView(isShowing: $presentSideCart, content: AnyView(SideCartViewContents(presentSideMenu: $presentSideCart)), direction: .trailing)
    }
    
}

struct ProductsList_Previews: PreviewProvider {
    static var previews: some View {
        ProductsList()
    }
}
