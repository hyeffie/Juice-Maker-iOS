//
//  StockModifier.swift
//  JuiceMaker
//
//  Created by Effie on 12/15/23.
//

final class StockModifier {
    private let fruitStore: FruitStore
    
    init(fruitStore: FruitStore) {
        self.fruitStore = fruitStore
    }
    
    func updateStock(of fruit: Fruit, to newCount: Int) {
        do {
            let _ = try fruitStore.updateStock(of: fruit, to: newCount)
        } catch {
            
        }
    }
}
