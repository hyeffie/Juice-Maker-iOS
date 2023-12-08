//
//  StockDisplay.swift
//  JuiceMaker
//
//  Created by Effie on 12/8/23.
//

struct StockDisplay {
    private let fruitStore: FruitStore
    
    private var resultConverter: StockDisplayResultConvertable
    
    func displayStock() {
        let stocks = fruitStore.fetch()
        let result = StockDisplay.Respone(stocks: stocks)
        resultConverter.convertResult(result)
    }
}
