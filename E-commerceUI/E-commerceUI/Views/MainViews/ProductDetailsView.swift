//
//  ProductDetailsView.swift
//  E-commerceUI
//
//  Created by Mehmet Tuna Arıkaya on 14.12.2024.
//

import SwiftUI

struct ProductDetailsView: View {
    @State var presentSideMenu = false
    @State var presentSideCart = false
    
    var product: Product
    
    var body: some View {
        ZStack {
            Color.white.edgesIgnoringSafeArea(.all)
            ZStack {
                VStack(spacing: 0) {
                    ScrollView {
                        TabView {
                            ForEach(0..<product.images.count, id: \.self) { i in
                                
                                Image(product.images[i])
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(height: 500)
                                    .clipped()
                                
                            }
                        }
                        .tabViewStyle(.page)
                        .indexViewStyle(.page(backgroundDisplayMode: .always))
                        .frame(height: 500)
                        .padding([.leading, .trailing], 20)
                        
                        VStack(alignment: .leading) {
                            HStack(alignment: .top) {
                                Text(product.title)
                                    .font(tenorSans(16))
                                    .multilineTextAlignment(.leading)
                                    .foregroundColor(.black)
                                Spacer()
                                Image("Export")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 20, height: 20)
                                
                            }
                            
                            Text("₺\(product.price)")
                                .font(tenorSans(28))
                                .multilineTextAlignment(.leading)
                                .foregroundColor(.Default)
                        }
                        .frame(maxWidth: .infinity)
                        .padding([.leading, .trailing], 20)
                        
                        Text("Açıklama")
                            .font(tenorSans(18))
                            .foregroundColor(.black)
                            .padding(.top, 20)
                        
                        Text("\(product.description)")
                            .font(tenorSans(18))
                            .foregroundColor(.black)
                            .padding(.top, 3)
                            .padding([.leading, .trailing], 20)
                        
                        Text("Beğenebileceğiniz ürünler ")
                            .font(tenorSans(22))
                            .foregroundColor(.black)
                            .padding(.top, 20)
                        
                        Image("Divider")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 140)
                            .padding(.top, 10)
                        
                        VStack {
                            HStack(alignment: .top) {
                                ProductItemView(product: product2)
                                ProductItemView(product: product3)
                            }
                            
                            HStack(alignment: .top) {
                                ProductItemView(product: product4)
                                ProductItemView(product: product5)
                            }
                            
                            HStack(alignment: .center, spacing: 8) {
                                Text("Fazlasını keşfet")
                                    .font(tenorSans(20))
                                    .multilineTextAlignment(.center)
                                    .foregroundColor(.black)
                                
                                Image(systemName: "arrow.forward")
                                    .frame(width: 18, height: 18)
                                
                            }
                            .padding(12)
                            
                        }
                        FooterView()
                    }
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
            .overlay(alignment: .bottom) {
                ZStack {
                    Button {
                        
                    } label: {
                        HStack {
                            Image("Plus")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 24, height: 24)
                                .colorInvert()
                            
                            Text("Sepete ekle")
                                .font(tenorSans(20))
                                .kerning(0.14)
                                .multilineTextAlignment(.center)
                                .foregroundColor(.white)
                            
                            Spacer()
                            
                            Image("Heart")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 24, height: 24)
                                .colorInvert()
                            
                        }
                        .padding([.leading, .trailing], 24)
                    }

                }
                .frame(height: 66)
                .frame(maxWidth: .infinity)
                .background(.black)
            }
            
            SideMenu()
            SideCart()
        }
        .navigationBarHidden(true)
        .ignoresSafeArea(edges: .bottom)
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

struct ProductDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        ProductDetailsView(product: product1)
    }
}
