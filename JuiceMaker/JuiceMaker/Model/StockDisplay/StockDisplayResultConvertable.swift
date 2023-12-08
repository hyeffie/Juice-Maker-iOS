//
//  StockDisplayResultConvertable.swift
//  JuiceMaker
//
//  Created by Effie on 12/8/23.
//

protocol StockDisplayResultConvertable {
    func convertResult(_ result: StockDisplay.Respone)
}

struct StockDisplayResultConverter: StockDisplayResultConvertable {
    private weak var display: StockDisplayResultDisplayable?
    
    func convertResult(_ result: StockDisplay.Respone) {
        guard let stocks = result.stocks else {
            let viewModel = StockDisplay.ViewModel(eachFruitCount: nil)
            display?.displayStock(viewModel: viewModel)
            return
        }
        
        guard let strawberryStock = stocks.first(where: { stock in stock.fruitType == .strawberry }),
              let bananaStock = stocks.first(where: { stock in stock.fruitType == .banana }),
              let pineappleStock = stocks.first(where: { stock in stock.fruitType == .pineapple }),
              let kiwiStock = stocks.first(where: { stock in stock.fruitType == .kiwi }),
              let mangoStock = stocks.first(where: { stock in stock.fruitType == .mango }) else {
            let viewModel = StockDisplay.ViewModel(eachFruitCount: nil)
            display?.displayStock(viewModel: viewModel)
            return
        }
        let eachFruitConut = StockDisplay.ViewModel.EachFruitCount(
            strawberryCount: strawberryStock.count,
            bananaCount: bananaStock.count,
            pineappleCount: pineappleStock.count,
            kiwiCount: kiwiStock.count,
            mangoCount: mangoStock.count
        )
        let viewModel = StockDisplay.ViewModel(eachFruitCount: eachFruitConut)
        display?.displayStock(viewModel: viewModel)
    }
}
