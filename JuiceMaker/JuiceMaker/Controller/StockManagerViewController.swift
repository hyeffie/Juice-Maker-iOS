//
//  StockManagerViewController.swift
//  JuiceMaker
//
//  Created by Effie on 12/11/23.
//

import UIKit

final class StockManagerViewController: UIViewController, StoryboardIdentifiale {
    @IBOutlet private weak var strawberryStockLabel: UILabel!
    
    @IBOutlet private weak var bananaStockLabel: UILabel!
    
    @IBOutlet private weak var pineappleStockLabel: UILabel!
    
    @IBOutlet private weak var kiwiStockLabel: UILabel!
    
    @IBOutlet private weak var mangoStockLabel: UILabel!
    
    private var stockDisplay: StockDisplay?
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    init?(coder: NSCoder, fruitStore: FruitStore) {
        self.stockDisplay = StockDisplay(fruitStore: fruitStore)
        super.init(coder: coder)
        setUp()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        stockDisplay?.displayStock()
    }
    
    private func setUp() {
        let resultConverter = StockDisplayResultConverter()
        resultConverter.display = self
        stockDisplay?.resultConverter = resultConverter
    }
}

extension StockManagerViewController: StockDisplayResultDisplayable {
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
