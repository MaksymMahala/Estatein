//
//  TradingView.swift
//  Minus1
//
//  Created by Max on 10.10.2024.
//

import SwiftUI
import Minus1Chart

struct TradingView: View {
    @StateObject private var viewModel = TradingViewModel()

    var body: some View {
        NavigationStack {
            ZStack(alignment: .top) {
                Color.digitalBlack
                    .ignoresSafeArea()
                
                ScrollView(showsIndicators: false) {
                    
                    VStack {
                        CategoryValueType(selectValue: $viewModel.selectValue)
                            .padding(.vertical, 5)
                        
                        Minus1CandleStickChart(zoomLevel: .constant(1.0), chartHeight: 400, selectedTimeFrame: .constant("1m"), greenColor: Color.digitalDarkGreen, symbol: "BTCUSDT")
                        
                        buttomsSellBuy
                            .padding(.vertical, 10)
                        
                        OrderBookView()
                    }
                }
            }
            .applyToolbar()
        }
    }
    
    private var buttomsSellBuy: some View {
        HStack {
            Button {
                
            } label: {
                Text("Buy")
                    .foregroundStyle(Color.black)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background {
                        RoundedRectangle(cornerRadius: 10)
                            .foregroundStyle(Color.greenGrass)
                            .frame(maxWidth: .infinity)
                    }
            }
            
            Button {
                
            } label: {
                Text("Sell")
                    .foregroundStyle(Color.black)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background {
                        RoundedRectangle(cornerRadius: 10)
                            .foregroundStyle(Color.red)
                            .frame(maxWidth: .infinity)
                    }
            }
        }
        .padding(.horizontal)
        .font(Font.soraBold15)
    }
    
    private var orderSelection: some View {
        HStack {
            ForEach(viewModel.orderCategoties.indices, id: \.self) { order in
                Button {
                    viewModel.selectedOrder = order
                } label: {
                    Text(viewModel.orderCategoties[order])
                        .foregroundStyle(viewModel.selectedOrder == order ? Color.black : Color.gray)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background {
                            if viewModel.selectedOrder == order {
                                Rectangle()
                                    .foregroundStyle(Color.lightGrayColor)
                            }
                        }
                }
            }
        }
        .font(Font.soraRegular13)
    }
    
    @ViewBuilder private var ordersList: some View {
        switch viewModel.selectedOrder {
        case 0:
            HomeView()
                .frame(height: 160)
        case 1:
            OrderBookView()
                .frame(height: 160)
        case 2:
            HomeView()
                .frame(height: 160)
        default:
            OrderBookView()
        }
    }
}

#Preview {
    TradingView()
}
