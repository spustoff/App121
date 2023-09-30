//
//  DiaryModel.swift
//  App121
//
//  Created by Вячеслав on 6/15/23.
//

import SwiftUI

struct DiaryModel: Identifiable {
    
    var id = UUID().uuidString
    
    var date: Date
    var currency: String
    var text: String
    var name: String
}
