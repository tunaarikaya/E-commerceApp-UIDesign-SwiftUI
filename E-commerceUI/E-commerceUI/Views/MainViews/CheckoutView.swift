//
//  CheckoutView.swift
//  E-commerceUI
//
//  Created by Mehmet Tuna Arıkaya on 14.12.2024.
//
import SwiftUI

struct CheckoutView: View {
    
    @State var presentSideMenu = false
    @State var presentSideCart = false
    
    @State private var totalPrice: Int = 0
    
    var body: some View {
        ZStack {
            MainCartView()
            //PaymentSuccessView()
        }
        .onAppear{
            updateCartValue()
        }
        .ignoresSafeArea(edges: .bottom)
        .navigationBarHidden(true)
    }
    
    @ViewBuilder
    private func MainCartView() -> some View {
        Color.white.edgesIgnoringSafeArea(.all)
        ZStack {
            VStack(spacing: 0) {
                Text("Ödeme")
                    .font(tenorSans(24))
                    .kerning(4)
                    .multilineTextAlignment(.center)
                    .foregroundColor(.black)
                .frame(height: 32, alignment: .center)
                
                Image("Divider")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 140)
                    .padding(.top, 10)
                
                ScrollView(.vertical) {
                    VStack {
                        ForEach(0..<cartItems.count, id: \.self) { i in
                            
                            if cartItems[i].count > 0 {
                                CartItemView(item: cartItems[i]) {
                                    updateCartValue()
                                }
                            }
                            
                        }
                    }
                }.padding([.leading, .trailing], 20)
                
                VStack(alignment: .leading, spacing: 15) {
                    
                    Rectangle()
                        .foregroundColor(.clear)
                        .frame(width: 343, height: 1)
                        .background(Color.BodyGrey)
                    
                    Button {
                        
                    } label: {
                        HStack {
                            Image ("Voucher")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 27, height: 27)
                            
                            Text("Promosyon kodu ekle")
                                .font(tenorSans(19))
                                .foregroundColor(.BodyGrey)
                        }
                    }
                    
                    Rectangle()
                        .foregroundColor(.clear)
                        .frame(width: 343, height: 1)
                        .background(Color.BodyGrey)
                    
                    Button {
                        
                    } label: {
                        HStack {
                            Image ("Door to Door Delivery")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 27, height: 27)
                            
                            Text("Teslimat")
                                .font(tenorSans(19))
                                .foregroundColor(.BodyGrey)
                        }
                    }
                    
                    Rectangle()
                        .foregroundColor(.clear)
                        .frame(width: 343, height: 1)
                        .background(Color.BodyGrey)

                }
                
                Spacer()
                
                HStack(alignment: .bottom) {
                    Text("Toplam Tutar")
                        .font(tenorSans(14))
                        .kerning(2)
                        .foregroundColor(.black)
                    
                    Spacer()
                    
                    Text("₺\(totalPrice)")
                        .font(tenorSans(16))
                        .foregroundColor(Color.Default)
                    
                }
                .padding([.leading, .trailing], 20)
                .frame(height: 80)
                
                Button {
                    
                } label: {
                    HStack {
                        Image("shopping bag")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 20, height: 20)
                            .colorInvert()
                        
                        Text("Sipariş ver")
                            .font(tenorSans(16))
                            .kerning(0.16)
                            .multilineTextAlignment(.center)
                            .foregroundColor(.white)
                    }
                    .frame(height: 56)
                    .frame(maxWidth: .infinity)
                    .background(.black)
                }
            }
            .padding(.top, 76)
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
    
    @ViewBuilder
    private func PaymentSuccessView() -> some View {
        ZStack {
            Color.BodyGrey.opacity(0.91).edgesIgnoringSafeArea(.all)
            
            VStack(alignment: .center, spacing: 10) {
                Text("Ödeme başarili")
                    .font(tenorSans(20))
                    .kerning(4)
                    .foregroundColor(.black)
                    .padding(.top, 20)
                
                Image("SuccessComplete")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 70, height: 70)
                    
                Text("Ödemeniz başariyla alındi")
                    .font(tenorSans(18))
                    .multilineTextAlignment(.center)
                    .foregroundColor(.BodyGrey)
                
                Text("Ödeme ID \(123456)")
                    .font(tenorSans(15))
                    .multilineTextAlignment(.center)
                    .foregroundColor(.Label)
                
                Button {
                    
                } label: {
                    HStack(alignment: .center, spacing: 10) {
                        Text("Ana sayfaya dön")
                            .font(tenorSans(16))
                            .multilineTextAlignment(.center)
                            .foregroundColor(.black)
                    }
                    .padding(.horizontal, 16)
                    .padding(.vertical, 12)
                    .overlay {
                        Rectangle()
                            .inset(by: 0.5)
                            .stroke(Color.black.opacity(0.5), lineWidth: 1)
                    }
                    .padding([.top, .bottom], 20)
                }

                
                
            }
            .frame(maxWidth: .infinity)
            .background(.white)
            .padding([.leading, .trailing], 16)
            
        }.frame(maxWidth: .infinity, maxHeight: .infinity)
    }
    
    @ViewBuilder
    private func SideMenu() -> some View {
        SideView(isShowing: $presentSideMenu, content: AnyView(SideMenuViewContents(presentSideMenu: $presentSideMenu)), direction: .leading)
    }
    
    @ViewBuilder
    private func SideCart() -> some View {
        SideView(isShowing: $presentSideCart, content: AnyView(SideCartViewContents(presentSideMenu: $presentSideCart)), direction: .trailing)
    }
    
    func updateCartValue() {
        print("\(totalPrice)")
        var value: Int = 0
        for item in cartItems {
            value += (item.count * item.product.price)
        }
        totalPrice = value
    }
}

struct CheckoutView_Previews: PreviewProvider {
    static var previews: some View {
        CheckoutView()
    }
}
