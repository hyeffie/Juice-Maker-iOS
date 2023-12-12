//
//  StoryboardIdentifiale.swift
//  JuiceMaker
//
//  Created by Effie on 12/11/23.
//

protocol StoryboardIdentifiale {
    static var storyboardIdentifier: String { get }
}

extension StoryboardIdentifiale {
    static var storyboardIdentifier: String {
        return String(describing: self)
    }
}
