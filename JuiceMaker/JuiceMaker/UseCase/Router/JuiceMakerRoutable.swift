//
//  JuiceMakerRoutable.swift
//  JuiceMaker
//
//  Created by Effie on 12/11/23.
//

import UIKit

struct JuiceMakerRouter {
    private let sourceViewController: ViewController
    private let sourceDataStore: FruitStore
    
    init(sourceViewController: ViewController, dataStore: FruitStore) {
        self.sourceViewController = sourceViewController
        self.sourceDataStore = dataStore
    }
    
    func routeToStockManager() {
        let storyboard = UIStoryboard(name: "Main", bundle: .none)
        let destinationViewController: StockManagerViewController = storyboard.instantiateViewController(identifier: StockManagerViewController.storyboardIdentifier) { coder in
            return StockManagerViewController(coder: coder, fruitStore: sourceDataStore)
        }
        
        navigateToStockManager(source: sourceViewController, destination: destinationViewController)
    }
    
    private func navigateToStockManager(
        source: ViewController,
        destination: StockManagerViewController
    ) {
        source.present(destination, animated: true)
    }
}
