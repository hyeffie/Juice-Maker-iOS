//
//  JuiceMaker - JuiceMaker.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

final class JuiceMaker {
    private let fruitStore: FruitStore
    
    var resultConverter: JuiceMakerResultConvertable?
    
    init(fruitStore: FruitStore) {
        self.fruitStore = fruitStore
    }
    
    func makeJuice(flavor: JuiceFlavor) {
        do {
            try consumeFruitsForMakingJuice(flavor: flavor)
            let result = JuiceMakerModel.Result(juice: flavor)
            resultConverter?.convertResult(result)
        } catch {
            let result = JuiceMakerModel.Result(juice: nil)
            resultConverter?.convertResult(result)
        }
    }
    
    private func consumeFruitsForMakingJuice(flavor: JuiceFlavor) throws {
        try fruitStore.consume(ingredients: flavor.recipe)
    }
}
