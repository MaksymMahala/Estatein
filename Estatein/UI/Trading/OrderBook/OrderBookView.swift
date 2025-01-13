//
//  OrderBookView.swift
//  Minus1
//
//  Created by Max on 17.10.2024.
//

import SwiftUI

struct Order {
    let price: Double
    let amount: Double
}

struct OrderBookView: View {
    let bids: [Order] = [
        Order(price: 1.234, amount: 1.5),
        Order(price: 1.233, amount: 2.0),
        Order(price: 1.237, amount: 1.2),
        Order(price: 1.237, amount: 1.2),
        Order(price: 1.232, amount: 1.8)
    ]
    
    let asks: [Order] = [
        Order(price: 1.236, amount: 2.5),
        Order(price: 1.237, amount: 1.2),
        Order(price: 1.237, amount: 1.2),
        Order(price: 1.237, amount: 1.2),
        Order(price: 1.238, amount: 3.0)
    ]
    
    var body: some View {
        VStack(spacing: 0) {
            Divider()
                .background(Color.gray.opacity(0.5))
                .frame(height: 1)
                .padding(.horizontal)
            
            HStack {
                Text("Bid")
                    .foregroundColor(.gray)
                    .font(Font.orbitronBold15)
                    .padding(.leading)
                Spacer()
                
                Text("Ask")
                    .foregroundColor(.gray)
                    .font(Font.orbitronBold15)
                    .padding(.trailing)
            }
            .padding(.top, 10)
            
            Divider()
                .background(Color.gray.opacity(0.5))
                .padding(.horizontal)
            
            HStack(alignment: .top) {
                // Bids Column
                VStack(alignment: .leading, spacing: 8) {
                    ForEach(bids, id: \.price) { bid in
                        HStack {
                            Text(String(format: "%.3f", bid.price))
                                .foregroundColor(.green)
                                .font(Font.soraBold15)
                            Spacer()
                            Text(String(format: "%.2f", bid.amount))
                                .foregroundColor(.gray)
                                .font(Font.soraRegular12)
                        }
                        .padding(.horizontal, 4)
                        .padding(.vertical, 6)
                        .background(
                            LinearGradient(gradient: Gradient(colors: [.green.opacity(0.15), .clear]),
                                           startPoint: .leading,
                                           endPoint: .trailing)
                        )
                        .cornerRadius(5)
                    }
                }
                
                Divider()
                    .background(Color.gray.opacity(0.5))
                    .frame(width: 1, height: 200)
                    .padding(.horizontal)
                
                // Asks Column
                VStack(alignment: .trailing, spacing: 8) {
                    ForEach(asks, id: \.price) { ask in
                        HStack {
                            Text(String(format: "%.2f", ask.amount))
                                .foregroundColor(.gray)
                                .font(Font.soraRegular12)
                            Spacer()
                            Text(String(format: "%.3f", ask.price))
                                .foregroundColor(.red)
                                .font(Font.soraBold15)
                        }
                        .padding(.vertical, 6)
                        .padding(.horizontal, 4)
                        .background(
                            LinearGradient(gradient: Gradient(colors: [.red.opacity(0.15), .clear]),
                                           startPoint: .trailing,
                                           endPoint: .leading)
                        )
                        .cornerRadius(5)
                    }
                }
            }
            .padding(.horizontal)
            .padding(.vertical, 10)
            
            Spacer()
        }
        .padding(.horizontal)
        .background(Color.blackDigital)
        .foregroundColor(.white)
    }
}

#Preview {
    OrderBookView()
}
