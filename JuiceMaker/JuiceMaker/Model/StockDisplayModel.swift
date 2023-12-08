//
//  StockDisplayModel.swift
//  JuiceMaker
//
//  Created by Effie on 12/8/23.
//

enum StockDisplayModel {
    struct Respone {
        let stocks: [FruitStock]
    }
    
    struct ViewModel {
        let strawberryCount: Int
        let bananaCount: Int
        let pineappleCount: Int
        let kiwiCount: Int
        let mangoCount: Int
    }
}
