//
//  StockManagerViewController.swift
//  JuiceMaker
//
//  Created by Effie on 12/11/23.
//

import UIKit

final class StockManagerViewController: UIViewController, StoryboardIdentifiable {
    @IBOutlet private weak var strawberryStockLabel: UILabel!
    
    @IBOutlet private weak var bananaStockLabel: UILabel!
    
    @IBOutlet private weak var pineappleStockLabel: UILabel!
    
    @IBOutlet private weak var kiwiStockLabel: UILabel!
    
    @IBOutlet private weak var mangoStockLabel: UILabel!
    
    private let stockDisplay: StockDisplay?
    
    private let stockModifier: StockModifier?
    
    required init?(coder: NSCoder) {
        self.stockDisplay = nil
        self.stockModifier = nil
        super.init(coder: coder)
    }
    
    init?(coder: NSCoder, fruitStore: FruitStore) {
        self.stockDisplay = StockDisplay(fruitStore: fruitStore)
        self.stockModifier = StockModifier(fruitStore: fruitStore)
        super.init(coder: coder)
        setUp()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        stockDisplay?.displayStock()
    }
    
    @IBAction private func completeManaging(_ sender: Any) {
        self.dismiss(animated: true)
    }
    
    private func setUp() {
        let stockDisplayResultConverter = StockDisplayResultConverter()
        stockDisplayResultConverter.display = self
        stockDisplay?.resultConverter = stockDisplayResultConverter
        
        let stockModifierResultConverter = StockModifierResultConverter()
        stockModifierResultConverter.display = self
        stockModifier?.resultConverter = stockModifierResultConverter
    }
}

extension StockManagerViewController: StockDisplayResultDisplayable {
    func displayStock(viewModel: StockDisplayModel.ViewModel) {
        guard let eachFruitCount = viewModel.eachFruitCount else { return }
        
        self.strawberryStockLabel.text = "\(eachFruitCount.strawberryCount)"
        self.bananaStockLabel.text = "\(eachFruitCount.bananaCount)"
        self.pineappleStockLabel.text = "\(eachFruitCount.pineappleCount)"
        self.kiwiStockLabel.text = "\(eachFruitCount.kiwiCount)"
        self.mangoStockLabel.text = "\(eachFruitCount.mangoCount)"
    }
}

extension StockManagerViewController: StockModifierResultDisplayable {
    func displayModifiedStock(viewModel: StockModifierModel.ViewModel) {
        
    }
}
