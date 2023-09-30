//
//  DiaryViewModel.swift
//  App121
//
//  Created by Вячеслав on 6/15/23.
//

import SwiftUI

final class DiaryViewModel: ObservableObject {
    
    @Published var diaries: [DiaryModel] = [
    
        DiaryModel(date: Date().addingTimeInterval(-3500), currency: "EURUSD", text: "Hours of operation may vary during the day. Need to control", name: "John"),
        DiaryModel(date: Date().addingTimeInterval(-5347), currency: "USDJPY", text: "Associated with risk, therefore, it is necessary to conduct a market analysis before acceptance", name: "Steve"),
        DiaryModel(date: Date().addingTimeInterval(-7563), currency: "GBPUSD", text: "Fundamental analysis and others to determine the most profitable entry and exit points for a position", name: "Williams"),
        DiaryModel(date: Date().addingTimeInterval(-32645), currency: "AUDUSD", text: "I believe that trading is the fastest way to make a lot of money", name: "Andrew"),
        DiaryModel(date: Date().addingTimeInterval(-53467), currency: "USDCAD", text: "To make money, you need to learn the charts, not bet on random!", name: "Slava"),
        DiaryModel(date: Date().addingTimeInterval(-534745), currency: "USDCHF", text: "It's cool to be a trader, at home all day, no need to go anywhere", name: "Stas"),
    ]
}
