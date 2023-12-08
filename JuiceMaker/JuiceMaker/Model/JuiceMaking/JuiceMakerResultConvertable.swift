//
//  JuiceMakerResultConvertable.swift
//  JuiceMaker
//
//  Created by Effie on 12/8/23.
//

protocol JuiceMakerResultConvertable {
    func convertResult(_ result: JuiceMaker.Respone)
}

final class JuiceMakerResultConverter: JuiceMakerResultConvertable {
    weak var display: JuiceMakerResultDisplayable?
    
    func convertResult(_ result: JuiceMaker.Respone){
        guard let juice = result.juice else {
            let viewModel = JuiceMaker.ViewModel(juiceName: nil)
            display?.displayMakingResult(viewModel: viewModel)
            return
        }
        let viewModel = JuiceMaker.ViewModel(juiceName: juice.name)
        display?.displayMakingResult(viewModel: viewModel)
    }
}

