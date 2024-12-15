//
//  Constants.swift
//  E-commerceUI
//
//  Created by Mehmet Tuna Arıkaya on 14.12.2024.
//

import SwiftUI

var product1: Product = .init(title: "Rahat Uzun Kollu Renk Bloklu Turuncu Kadın Bluz", price: 2500, description: "Turuncu ve gri renkli, normal kesim bluz. Renk bloklu, V yakalı, uzun ve geniş kol detaylı. Bel bağlama detaylı. Örgü kumaş.", images: ["P01_01", "P01_02", "P01_03", "P01_04"], category: .TShirt, gender: .Female)

var product2: Product = .init(title: "Rahat Normal Kollu Düz Yeşil Kadın Bluz", price: 2550, description: "Lycra rib kumaştan yapılmış, yaka detayı olan, uzun kollu. Rib kumaş, astarsız, normal uzunluk, rahat kesim, düz etek uçları. Kontrast dikiş detaylarına sahip, bel bağlama detaylı. Örgü kumaş.", images: ["P02_01", "P02_02", "P02_03", "P02_04"], category: .TShirt, gender: .Female)

var product3: Product = .init(title: "Rahat Pelerin Kollu Renk Bloklu Mavi Kadın Bluz", price: 2550, description: "Fit Tipi: Slim Fit. Gün boyunca sizinle hareket eden ultra rahat bir yapı. Esnek, vücut hatlarını belirginleştiren sade renk tasarımı. Üç klasik rengin dikişi ile güçlü bir kontrast oluşturur, sizi daha sevimli ve çekici gösterir. Günlük, ev, iş, seyahat, parti, buluşma, tatil, alışveriş, eğlence gibi birçok etkinlik için uygundur. Tek Beden (Göğüs Ölçüsü: 76-105 cm arası)", images: ["P03_01", "P03_02", "P03_03", "P03_04"], category: .TShirt, gender: .Female)

var product4: Product = .init(title: "Parti Tarzı Kabarık Kollu Desenli Pembe Kadın Bluz", price: 3245, description: "Lavanta renkli, georgette kumaştan yapılmış üst. Yuvarlak yaka ve kabarık kol detaylı. Selvia'nın bu şık ve rahat bluzuyla tarzınızı yükseltin. Bu parçayı kafes topuklu ayakkabılar, favori çantanız ve minimalist gümüş takılarla tamamlayarak zarif bir buluşma kombini oluşturun.", images: ["P04_01", "P04_02", "P04_03", "P04_04"], category: .TShirt, gender: .Female)

var product5: Product = .init(title: "Rahat Normal Kollu Düz Beyaz Kadın Bluz", price: 2255, description: "Stylistico Saf Rayon Pamuk Yumuşak ve Premium Doku. Yuvarlak pileli yaka ve yarım kol (14 inç). Ön kısımda omuzda şeffaf dantel. 24 inç uzunluğunda, arkada düğmeli kapanış. 4 güzel renk ve 4 beden seçeneğiyle. Kot pantolon, kumaş pantolon, şort, kapri ve tayt ile kombinlenebilir. 15-35 yaş arası kadınlar için uygundur.", images: ["P05_01", "P05_02", "P05_03", "P05_04"], category: .TShirt, gender: .Female)

var product6: Product = .init(title: "Rahat Normal Kollu Düz Pembe Kadın Bluz", price: 2565, description: "Stylistico Saf Rayon Pamuk Yumuşak ve Premium Doku. Yuvarlak pileli yaka ve yarım kol (14 inç). Ön kısımda omuzda şeffaf dantel. 24 inç uzunluğunda, arkada düğmeli kapanış. 4 güzel renk ve 4 beden seçeneğiyle. Kot pantolon, kumaş pantolon, şort, kapri ve tayt ile kombinlenebilir. 15-35 yaş arası kadınlar için uygundur.", images: ["P06_01", "P06_02", "P06_03", "P06_04"], category: .TShirt, gender: .Female)

func tenorSans(_ size: CGFloat) -> Font {
    Font.custom("Tenor Sans", size: size)
}

let hashtags = ["#2025", "#kış", "#koleksiyon", "#sonbahar", "#elbise", "#sonbaharkoleksiyonu", "#openfashion"]

var cartItems: [CartItem] = [.init(product: product1, count: 1), .init(product: product2, count: 2), .init(product: product3, count: 1)]

var products: [Product] = [product1, product2, product3, product4, product5, product6]

