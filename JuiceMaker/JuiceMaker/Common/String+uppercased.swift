//
//  String+uppercased.swift
//  JuiceMaker
//
//  Created by Effie on 12/12/23.
//

extension String {
    func uppercasedFirst() -> String {
        let firstCharacter = prefix(1).capitalized
        let remainingCharacters = dropFirst().lowercased()
        return firstCharacter + remainingCharacters
    }
}
