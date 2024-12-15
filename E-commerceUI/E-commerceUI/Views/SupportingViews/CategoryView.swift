//
//  CategoryView.swift
//  E-commerceUI
//
//  Created by Mehmet Tuna Arıkaya on 14.12.2024.
//

import SwiftUI

struct CategoryView: View {
    var isSelected:Bool = false
    var title:String = "All"
    var body: some View {
        VStack{
            Text(title)
                .font(Font.custom("Tenor Sans",size:16))
                .multilineTextAlignment(.center)
                .foregroundColor(isSelected ? Color.default : Color.Placehoder.opacity(0.5))
            
            if isSelected{
                Rectangle()
                    .foregroundColor(Color.Default)
                    .frame(width:5,height:5)
                    .rotationEffect(Angle(degrees: 45))
            }
        }
    }
}

