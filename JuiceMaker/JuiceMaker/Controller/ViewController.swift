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
    private var juiceMaker: JuiceMaker?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUp()
        stockDisplay?.displayStock()
    }
    
    private func setUp() {
        let fruitStore = FruitStore(initialCount: 10)
        let stockDisplay = StockDisplay(fruitStore: fruitStore)
        let stockDisplayConverter = StockDisplayResultConverter()
        let viewController = self
        viewController.stockDisplay = stockDisplay
        stockDisplay.resultConverter = stockDisplayConverter
        stockDisplayConverter.display = viewController
        
        let juiceMaker = JuiceMaker(fruitStore: fruitStore)
        let juiceConverter = JuiceMakerResultConverter()
        viewController.juiceMaker = juiceMaker
        juiceMaker.resultConverter = juiceConverter
        juiceConverter.display = viewController
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

extension ViewController: JuiceMakerResultDisplayable {
    func displayMakingResult(viewModel: JuiceMaker.ViewModel) {
        
    }
}
