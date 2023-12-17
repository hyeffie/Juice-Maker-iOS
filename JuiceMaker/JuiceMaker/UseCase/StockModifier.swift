//
//  StockModifier.swift
//  JuiceMaker
//
//  Created by Effie on 12/15/23.
//

final class StockModifier {
    private let fruitStore: FruitStore
    
    var resultConverter: StockModifierResultConvertable?
    
    init(fruitStore: FruitStore) {
        self.fruitStore = fruitStore
    }
    
    func updateStock(of fruit: Fruit, to newCount: Int) {
        do {
            let updatedStock = try fruitStore.updateStock(of: fruit, to: newCount)
            let result = StockModifierModel.Result(stock: updatedStock)
            resultConverter?.convertResult(result)
        } catch {
            let result = StockModifierModel.Result(stock: nil)
            resultConverter?.convertResult(result)
        }
    }
}
