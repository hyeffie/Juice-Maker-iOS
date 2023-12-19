//
//  StoryboardIdentifiable.swift
//  JuiceMaker
//
//  Created by Effie on 12/11/23.
//

import UIKit

protocol StoryboardIdentifiable {
    static var storyboardIdentifier: String { get }
}

extension StoryboardIdentifiable {
    static var storyboardIdentifier: String {
        return String(describing: self)
    }
}

protocol StoryboardBased: StoryboardIdentifiable {
    static var sceneStoryboard: UIStoryboard { get }
}

extension StoryboardBased where Self: UIViewController {
    static var sceneStoryboard: UIStoryboard {
        return UIStoryboard(name: String(describing: self), bundle: nil)
    }
}
