//
//  StockManagerViewController.swift
//  JuiceMaker
//
//  Created by Effie on 12/11/23.
//

import UIKit

final class StockManagerViewController: UIViewController, StoryboardIdentifiale {
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
        
    }
}
