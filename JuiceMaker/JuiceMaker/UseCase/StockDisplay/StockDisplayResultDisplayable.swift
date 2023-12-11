//
//  StockDisplayResultDisplayable.swift
//  JuiceMaker
//
//  Created by Effie on 12/8/23.
//

import Foundation

protocol StockDisplayResultDisplayable: NSObjectProtocol {
    func displayStock(viewModel: StockDisplayModel.ViewModel)
}
