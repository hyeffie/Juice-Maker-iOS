//
//  JuiceMakerAlert.swift
//  JuiceMaker
//
//  Created by Effie on 12/11/23.
//

import UIKit

enum JuiceMakerAlert {
    case juiceIsReady(juiceName: String)
    case fruitShortage(editAction: ((UIAlertAction) -> Void)?)
    
    private var title: String {
        return "알림"
    }
    
    private var body: String {
        switch self {
        case .juiceIsReady(let juiceName):
            return "\(juiceName) 쥬스 나왔습니다! 맛있게 드세요!"
        case .fruitShortage:
            return "재료가 모자라요. 재고를 수정할까요?"
        }
    }
    
    var alertController: UIAlertController {
        let alertController = UIAlertController(
            title: self.title,
            message: self.body,
            preferredStyle: .alert
        )
        
        switch self {
        case .juiceIsReady:
            return alertController
        case .fruitShortage(let editAction):
            alertController.addAction(UIAlertAction(title: "예", style: .default, handler: editAction))
            alertController.addAction(UIAlertAction(title: "아니오", style: .cancel))
            return alertController
        }
    }
}
