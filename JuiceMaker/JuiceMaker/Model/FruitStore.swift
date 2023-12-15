//
//  JuiceMaker - FruitStore.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
//

final class FruitStore {
    private var fruitStocks: [Fruit: FruitStock]
    
    init(initialCount: Int) {
        let newStocks: [Fruit: FruitStock] = Fruit.allCases.reduce(into: [:]) { (result, fruit) in
            let stock = FruitStock(fruitType: fruit, count: initialCount)
            result[fruit] = stock
        }
        self.fruitStocks = newStocks
    }
    
    
    private func consume(_ fruitType: Fruit, numberOfFruits: Int) throws -> FruitStock {
        guard let copyOfTargetStock = fruitStocks[fruitType] else {
            throw JuiceMakerError.fruitStockNotFound
        }
        let newTarget = try copyOfTargetStock.consumedFruits(count: numberOfFruits)
        return newTarget
    }
    
    func consume(ingredients: JuiceIngredients) throws {
        let newFruitStocks: [FruitStock] = try ingredients.reduce(into: []) { (result, ingredient) in
            let newStock = try consume(ingredient.key, numberOfFruits: ingredient.value)
            result.append(newStock)
        }
        
        for newFruitStock in newFruitStocks {
            let fruitType = newFruitStock.fruitType
            self.fruitStocks[fruitType] = newFruitStock
        }
    }
    
    func fetch() -> [FruitStock] {
        return self.fruitStocks.map { stock in stock.value }
    }
    
    func updateStock(of fruitType: Fruit, to newCount: Int) throws -> FruitStock {
        // TODO: [refactor] 이 로직 consume이랑 같음
        guard let copyOfTargetStock = self.fruitStocks[fruitType] else {
            throw JuiceMakerError.fruitStockNotFound
        }
        let newStock = try copyOfTargetStock.updateCount(to: newCount)
        self.fruitStocks[fruitType] = newStock
        return newStock
    }
}
