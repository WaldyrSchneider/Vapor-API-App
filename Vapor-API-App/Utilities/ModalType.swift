//
//  ModalType.swift
//  Vapor-API-App
//
//  Created by Waldyr Schneider on 29/08/23.
//

import Foundation

enum ModalType: Identifiable {
    var id: String {
        switch self {
        case .add: return "add"
        case .update: return "update"
        }
    }
    
    case add
    case update(Song)
}
