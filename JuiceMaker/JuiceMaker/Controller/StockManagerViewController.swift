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
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
}
