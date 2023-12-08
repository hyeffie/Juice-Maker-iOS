//
//  StockDisplay.swift
//  JuiceMaker
//
//  Created by Effie on 12/8/23.
//

final class StockDisplay {
    private let fruitStore: FruitStore
    
    var resultConverter: StockDisplayResultConvertable?
    
    init(fruitStore: FruitStore) {
        self.fruitStore = fruitStore
    }
    
    func displayStock() {
        let stocks = fruitStore.fetch()
        let result = StockDisplay.Respone(stocks: stocks)
        resultConverter?.convertResult(result)
    }
}
