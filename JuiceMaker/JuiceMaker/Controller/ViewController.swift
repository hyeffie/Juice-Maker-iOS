//
//  JuiceMaker - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

final class ViewController: UIViewController {
    
    @IBOutlet weak var strawberryStockLabel: UILabel!
    
    @IBOutlet weak var bananaStockLabel: UILabel!
    
    @IBOutlet weak var pineappleStockLabel: UILabel!
    
    @IBOutlet weak var kiwiStockLabel: UILabel!
    
    @IBOutlet weak var mangoStockLabel: UILabel!
    
    private var stockDisplay: StockDisplay?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUp()
        stockDisplay?.displayStock()
    }
    
    private func setUp() {
        let fruitStore = FruitStore(initialCount: 10)
        let useCase = StockDisplay(fruitStore: fruitStore)
        let converter = StockDisplayResultConverter()
        let viewController = self
        viewController.stockDisplay = useCase
        useCase.resultConverter = converter
        converter.display = viewController
    }
}

extension ViewController: StockDisplayResultDisplayable {
    func displayStock(viewModel: StockDisplay.ViewModel) {
        guard let eachFruitCount = viewModel.eachFruitCount else {
            // TODO: 구현
            return
        }
        self.strawberryStockLabel.text = "\(eachFruitCount.strawberryCount)"
        self.bananaStockLabel.text = "\(eachFruitCount.bananaCount)"
        self.pineappleStockLabel.text = "\(eachFruitCount.pineappleCount)"
        self.kiwiStockLabel.text = "\(eachFruitCount.kiwiCount)"
        self.mangoStockLabel.text = "\(eachFruitCount.mangoCount)"
    }
}
