//
//  JuiceMaker - JuiceMakerViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

final class JuiceMakerViewController: UIViewController, StoryboardIdentifiale {
    
    @IBOutlet private weak var strawberryStockLabel: UILabel!
    
    @IBOutlet private weak var bananaStockLabel: UILabel!
    
    @IBOutlet private weak var pineappleStockLabel: UILabel!
    
    @IBOutlet private weak var kiwiStockLabel: UILabel!
    
    @IBOutlet private weak var mangoStockLabel: UILabel!
    
    private let stockDisplay: StockDisplay?
    
    private let juiceMaker: JuiceMaker?
    
    private let router: JuiceMakerRouter?
    
    required init?(coder: NSCoder) {
        self.stockDisplay = nil
        self.juiceMaker = nil
        self.router = nil
        super.init(coder: coder)
    }
    
    init?(coder: NSCoder, fruitStore: FruitStore) {
        self.stockDisplay = StockDisplay(fruitStore: fruitStore)
        self.juiceMaker = JuiceMaker(fruitStore: fruitStore)
        self.router = JuiceMakerRouter(dataStore: fruitStore)
        super.init(coder: coder)
        setUp()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        stockDisplay?.displayStock()
    }
    
    @IBAction func makeStrawberryBananaJuice(_ sender: UIButton) {
        juiceMaker?.makeJuice(flavor: .strawberryBanana)
    }
    
    @IBAction func makeMangoKiwiJuice(_ sender: UIButton) {
        juiceMaker?.makeJuice(flavor: .mangoKiwi)
    }
    
    @IBAction func makeStrawberryJuice(_ sender: UIButton) {
        juiceMaker?.makeJuice(flavor: .strawberry)
    }
    
    @IBAction func makeBananaJuice(_ sender: UIButton) {
        juiceMaker?.makeJuice(flavor: .banana)
    }
    
    @IBAction func makePineappleJuice(_ sender: UIButton) {
        juiceMaker?.makeJuice(flavor: .pineapple)
    }
    
    @IBAction func makeKiwiJuice(_ sender: UIButton) {
        juiceMaker?.makeJuice(flavor: .kiwi)
    }
    
    @IBAction func makeMangoJuice(_ sender: UIButton) {
        juiceMaker?.makeJuice(flavor: .mango)
    }
    
    @IBAction func editStock(_ sender: UIBarButtonItem) {
        router?.routeToStockManager()
    }
    
    private func setUp() {
        let stockDisplayConverter = StockDisplayResultConverter()
        self.stockDisplay?.resultConverter = stockDisplayConverter
        stockDisplayConverter.display = self
        
        let juiceConverter = JuiceMakerResultConverter()
        self.juiceMaker?.resultConverter = juiceConverter
        juiceConverter.display = self
        
        self.router?.sourceViewController = self
    }
}

extension JuiceMakerViewController: StockDisplayResultDisplayable {
    func displayStock(viewModel: StockDisplayModel.ViewModel) {
        guard let eachFruitCount = viewModel.eachFruitCount else {
            return
        }
        self.strawberryStockLabel.text = "\(eachFruitCount.strawberryCount)"
        self.bananaStockLabel.text = "\(eachFruitCount.bananaCount)"
        self.pineappleStockLabel.text = "\(eachFruitCount.pineappleCount)"
        self.kiwiStockLabel.text = "\(eachFruitCount.kiwiCount)"
        self.mangoStockLabel.text = "\(eachFruitCount.mangoCount)"
    }
}

extension JuiceMakerViewController: JuiceMakerResultDisplayable {
    func displayMakingResult(viewModel: JuiceMakerModel.ViewModel) {
        guard let juiceName = viewModel.juiceName else {
            let alertController = UIAlertController(
                title: "알림",
                message: "재료가 모자라요. 재고를 수정할까요?",
                preferredStyle: .alert
            )
            
            let yesAction: UIAlertAction = .init(title: "예", style: .default) { [weak self] action in
                self?.router?.routeToStockManager()
            }
            let noAction: UIAlertAction = .init(title: "아니오", style: .cancel)
            alertController.addAction(yesAction)
            alertController.addAction(noAction)
            present(alertController, animated: true)
            return
        }
        
        // 1. trigger fetch stock
        stockDisplay?.displayStock()
        
        // 2. alert
        let alertController = UIAlertController(
            title: "알림",
            message: "\(juiceName) 쥬스 나왔습니다! 맛있게 드세요!",
            preferredStyle: .alert
        )
        
        let okAction: UIAlertAction = .init(title: "확인", style: .default)
        alertController.addAction(okAction)
        present(alertController, animated: true)
    }
}
