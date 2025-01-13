//
//  Constants.swift
//  Estatein
//
//  Created by Max on 30.09.2024.
//

import Foundation

enum Constants {
    enum REST {
        static let cryptoMarkets: String = "http://localhost:5500/api/cryptocurrencies"
    }
    enum WebSocketURLServer {
        static let webSocketURLServer: String = "ws://localhost:8080"
    }
    
    enum WebSocketSymbol {
        static let symbol = ["BTCUSDT", "ETHUSDT", "BNBUSDT", "XRPUSDT", "LTCUSDT", "ADAUSDT", "SOLUSDT", "DOTUSDT", "DOGEUSDT", "MATICUSDT", "TRXUSDT", "SHIBUSDT", "AVAXUSDT", "LINKUSDT", "XLMUSDT", "FILUSDT", "LUNAUSDT","ETUSDT","ICPUSDT", "NEARUSDT", "VETUSDT", "THETAUSDT", "EOSUSDT", "AAVEUSDT", "SANDUSDT", "MANAUSDT", "ZILUSDT", "QTUMUSDT", "BATUSDT", "ENJUSDT", "CHZUSDT", "DGBUSDT", "DASHUSDT", "NANOUSDT", "ZRXUSDT", "WAVESUSDT", "KSMUSDT", "BTTUSDT", "YFIUSDT", "GRTUSDT",
        ]
        
        static let topCryptoCurrencySymbols = ["BTCUSDT", "ETHUSDT", "USDTUSDT", "BNBUSDT", "XRPUSDT", "ADAUSDT","SOLUSDT", "DOTUSDT" ,"DOGEUSDT", "MATICUSDT", "TRXUSDT", "SHIBUSDT", "AVAXUSDT", "LINKUSDT", "LTCUSDT"]
        
        static let recentCryptoCurrencySymbols = ["APTUSDT", "FTMUSDT", "NEARUSDT", "GRTUSDT", "ATOMUSDT", "ICPUSDT", "FILUSDT", "ALGOUSDT", "VETUSDT", "AAVEUSDT", "FTTUSDT", "SANDUSDT", "MANAUSDT", "FLOWUSDT", "EOSUSDT"]
    }
}
