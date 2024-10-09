//
//  ActivityViewModel.swift
//  Minus1
//
//  Created by Max on 09.10.2024.
//

import Foundation

class ActivityViewModel: ObservableObject {
    @Published var selectedIndex = 0
    @Published var activitiesImageString = ""
    
    let activitiesCategory = ["Widtdrawal", "Deposit", "Buy order"]
    let activitiesCategoryIcon = ["coin", "empty-wallet-tick", "shopping-cart"]
    
    @Published var activities = [
        ActivityInfoModel(symbol: "BTC/USD", amount: 0.4997, price: 3000.00, status: "Filled", activityDate: "2021-08-02 04:39:25"),
        ActivityInfoModel(symbol: "BTC/USD", amount: 0.4997, price: 3000.00, status: "Canceled", activityDate: "2021-08-02 04:39:25"),
        ActivityInfoModel(symbol: "BTC/USD", amount: 0.4997, price: 3000.00, status: "Filled", activityDate: "2021-08-02 04:39:25")
        ]
    
//    var changeActivitiesImage: String {
//        if activity.status == "Filled" {
//            activitiesImageString = "L/B"
//           return activitiesImageString
//        } else {
//            activitiesImageString = "L/S"
//            return activitiesImageString
//        }
//    }
}

struct ActivityInfoModel {
    var symbol: String
    var amount: Double
    var price: Double
    var status: String
    var activityDate: String
}
