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
    
    @IBOutlet private weak var strawberryCountStepper: UIStepper!
    
    @IBOutlet private weak var bananaCountStepper: UIStepper!
    
    @IBOutlet private weak var pineappleCountStepper: UIStepper!
    
    @IBOutlet private weak var kiwiCountStepper: UIStepper!
    
    @IBOutlet private weak var mangoCountStepper: UIStepper!
    
    private let stockDisplay: StockDisplay?
    
    private let stockModifier: StockModifier?
    
    private weak var dismissingDelegate: StockManagerViewControllerDismissingDelegate?
    
    required init?(coder: NSCoder) {
        self.stockDisplay = nil
        self.stockModifier = nil
        self.dismissingDelegate = nil
        super.init(coder: coder)
    }
    
    init?(
        coder: NSCoder,
        fruitStore: FruitStore, 
        dismissingDelegate: StockManagerViewControllerDismissingDelegate
    ) {
        self.stockDisplay = StockDisplay(fruitStore: fruitStore)
        self.stockModifier = StockModifier(fruitStore: fruitStore)
        self.dismissingDelegate = dismissingDelegate
        super.init(coder: coder)
        setUp()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        stockDisplay?.displayStock()
    }
    
    @IBAction private func completeManaging(_ sender: Any) {
        self.dismissingDelegate?.handleDismising()
        self.dismiss(animated: true)
    }
    
    @IBAction func changeStockCount(_ sender: UIStepper) {
        let fruitType: Fruit
        switch sender {
        case strawberryCountStepper: 
            fruitType = .strawberry
        case bananaCountStepper: 
            fruitType = .banana
        case pineappleCountStepper: 
            fruitType = .pineapple
        case kiwiCountStepper: 
            fruitType = .kiwi
        case mangoCountStepper: 
            fruitType = .mango
        default: 
            return
        }
        let newCount = Int(sender.value)
        self.stockModifier?.updateStock(of: fruitType, to: newCount)
    }
    
    private func setUp() {
        let stockDisplayResultConverter = StockDisplayResultConverter()
        stockDisplayResultConverter.display = self
        stockDisplay?.resultConverter = stockDisplayResultConverter
        
        let stockModifierResultConverter = StockModifierResultConverter()
        stockModifierResultConverter.display = self
        stockModifier?.resultConverter = stockModifierResultConverter
    }
    
    private func setUI() {
        [
            strawberryCountStepper,
            bananaCountStepper,
            pineappleCountStepper,
            kiwiCountStepper,
            mangoCountStepper,
        ].forEach { stepper in
            stepper?.stepValue = 1.0
        }
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
        
        self.strawberryCountStepper.value = Double(eachFruitCount.strawberryCount)
        self.bananaCountStepper.value = Double(eachFruitCount.bananaCount)
        self.pineappleCountStepper.value = Double(eachFruitCount.pineappleCount)
        self.kiwiCountStepper.value = Double(eachFruitCount.kiwiCount)
        self.mangoCountStepper.value = Double(eachFruitCount.mangoCount)
    }
}

extension StockManagerViewController: StockModifierResultDisplayable {
    func displayModifiedStock(viewModel: StockModifierModel.ViewModel) {
        guard let newStock = viewModel.stock else {
            
            return
        }
        switch newStock.fruitType {
        case .strawberry:
            strawberryStockLabel.text = "\(newStock.count)"
        case .banana:
            bananaStockLabel.text = "\(newStock.count)"
        case .pineapple:
            pineappleStockLabel.text = "\(newStock.count)"
        case .kiwi:
            kiwiStockLabel.text = "\(newStock.count)"
        case .mango:
            mangoStockLabel.text = "\(newStock.count)"
        }
    }
}

protocol StockManagerViewControllerDismissingDelegate: NSObjectProtocol {
    func handleDismising()
}
