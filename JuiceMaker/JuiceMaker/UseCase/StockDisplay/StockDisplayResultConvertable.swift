//
//  StockDisplayResultConvertable.swift
//  JuiceMaker
//
//  Created by Effie on 12/8/23.
//

protocol StockDisplayResultConvertable {
    func convertResult(_ result: StockDisplayModel.Respone)
}

final class StockDisplayResultConverter: StockDisplayResultConvertable {
    weak var display: StockDisplayResultDisplayable?
    
    func convertResult(_ result: StockDisplayModel.Respone) {
        guard let stocks = result.stocks else {
            let viewModel = StockDisplayModel.ViewModel(eachFruitCount: nil)
            display?.displayStock(viewModel: viewModel)
            return
        }
        
        guard let strawberryStock = stocks.first(where: { stock in stock.fruitType == .strawberry }),
              let bananaStock = stocks.first(where: { stock in stock.fruitType == .banana }),
              let pineappleStock = stocks.first(where: { stock in stock.fruitType == .pineapple }),
              let kiwiStock = stocks.first(where: { stock in stock.fruitType == .kiwi }),
              let mangoStock = stocks.first(where: { stock in stock.fruitType == .mango }) else {
            let viewModel = StockDisplayModel.ViewModel(eachFruitCount: nil)
            display?.displayStock(viewModel: viewModel)
            return
        }
        let eachFruitConut = StockDisplayModel.ViewModel.EachFruitCount(
            strawberryCount: strawberryStock.count,
            bananaCount: bananaStock.count,
            pineappleCount: pineappleStock.count,
            kiwiCount: kiwiStock.count,
            mangoCount: mangoStock.count
        )
        let viewModel = StockDisplayModel.ViewModel(eachFruitCount: eachFruitConut)
        display?.displayStock(viewModel: viewModel)
    }
}
