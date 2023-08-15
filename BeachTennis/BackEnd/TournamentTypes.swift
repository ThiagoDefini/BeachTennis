//
//  TournamentTypes.swift
//  BeachTennis
//
//  Created by Lucas Cunha on 31/07/23.
//

import Foundation

enum TournamentTypes: String, Codable{
    case Tree
    case Group
    
    static func fromString(_ string: String) -> TournamentTypes?{
        return TournamentTypes(rawValue: string)
    }
}
