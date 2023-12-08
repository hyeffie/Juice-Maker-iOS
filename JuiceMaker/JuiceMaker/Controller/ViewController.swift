//
//  JuiceMaker - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var strawberryStockLabel: UILabel!
    
    @IBOutlet weak var bananaStockLabel: UILabel!
    
    @IBOutlet weak var pineappleStockLabel: UILabel!
    
    @IBOutlet weak var kiwiStockLabel: UILabel!
    
    @IBOutlet weak var mangoStockLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
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
