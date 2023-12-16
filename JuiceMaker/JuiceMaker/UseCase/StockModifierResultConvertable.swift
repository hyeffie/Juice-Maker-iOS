//
//  StockModifierResultConvertable.swift
//  JuiceMaker
//
//  Created by Effie on 12/15/23.
//

protocol StockModifierResultConvertable {
    func convertResult(_ result: StockModifierModel.Result)
}

final class StockModifierResultConverter {
    weak var display: StockModifierResultDisplayable?
    
    func convertResult(_ result: StockModifierModel.Result) {
        let viewModel = StockModifierModel.ViewModel(stock: result.stock)
        display?.displayModifiedStock(viewModel: viewModel)
    }
}
