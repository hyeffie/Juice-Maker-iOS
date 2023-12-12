//
//  JuiceMakerResultConvertable.swift
//  JuiceMaker
//
//  Created by Effie on 12/8/23.
//

protocol JuiceMakerResultConvertable {
    func convertResult(_ result: JuiceMakerModel.Result)
}

final class JuiceMakerResultConverter: JuiceMakerResultConvertable {
    weak var display: JuiceMakerResultDisplayable?
    
    func convertResult(_ result: JuiceMakerModel.Result){
        guard let juice = result.juice else {
            let viewModel = JuiceMakerModel.ViewModel(juiceName: nil)
            display?.displayMakingResult(viewModel: viewModel)
            return
        }
        let viewModel = JuiceMakerModel.ViewModel(juiceName: juice.name)
        display?.displayMakingResult(viewModel: viewModel)
    }
}

