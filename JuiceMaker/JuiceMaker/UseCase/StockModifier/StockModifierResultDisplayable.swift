//
//  StockModifierResultDisplayable.swift
//  JuiceMaker
//
//  Created by Effie on 12/16/23.
//

import Foundation

protocol StockModifierResultDisplayable: NSObjectProtocol {
    func displayModifiedStock(viewModel: StockModifierModel.ViewModel)
}
