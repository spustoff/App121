//
//  AnaliticsModel.swift
//  App121
//
//  Created by IGOR on 14/06/2023.
//

import SwiftUI

struct AnalyticsModel: Codable, Hashable {
    
    var errors: Bool
    
    var rows: [AnalyticsItem]
}

struct AnalyticsItem: Codable, Hashable {
    
    var id: Int
    var categoryId: Int
    var title: String
    var image: String
    var video: String
    
    var duration: Int
}
