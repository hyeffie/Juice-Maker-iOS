//
//  JuiceMaker - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

final class ViewController: UIViewController {
    
    @IBOutlet private weak var strawberryStockLabel: UILabel!
    
    @IBOutlet private weak var bananaStockLabel: UILabel!
    
    @IBOutlet private weak var pineappleStockLabel: UILabel!
    
    @IBOutlet private weak var kiwiStockLabel: UILabel!
    
    @IBOutlet private weak var mangoStockLabel: UILabel!
    
    private var stockDisplay: StockDisplay?
    
    private var juiceMaker: JuiceMaker?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUp()
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
        guard let juiceName = viewModel.juiceName else {
            let alertController = UIAlertController(
                title: "알림",
                message: "재료가 모자라요. 재고를 수정할까요?",
                preferredStyle: .alert
            )
            
            let yesAction: UIAlertAction = .init(title: "예", style: .default) { action in
                // TODO: 화면 전환 구현
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
