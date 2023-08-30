//
//  Song.swift
//  Vapor-API-App
//
//  Created by Waldyr Schneider on 29/08/23.
//

import Foundation

struct Song: Identifiable, Codable {
    let id: UUID?
    var title: String
}
