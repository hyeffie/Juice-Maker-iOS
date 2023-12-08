//
//  StockDisplayModel.swift
//  JuiceMaker
//
//  Created by Effie on 12/8/23.
//

extension StockDisplay {
    struct Respone {
        let stocks: [FruitStock]?
    }
    
    struct ViewModel {
        struct EachFruitCount {
            let strawberryCount: Int
            let bananaCount: Int
            let pineappleCount: Int
            let kiwiCount: Int
            let mangoCount: Int
        }
        
        let eachFruitCount: EachFruitCount?
    }
}
