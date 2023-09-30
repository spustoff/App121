//
//  TradersViewModel.swift
//  App121
//
//  Created by IGOR on 12/06/2023.
//

import SwiftUI
import CoreData

final class TradersViewModel: ObservableObject {
    
    @Published var current_trader: TradersModel?
    @Published var history: [TradersModel] = []
    @Published var isDetail: Bool = false
    @Published var isFavs: Bool = false
    
    @AppStorage("saved_traders") var saved_traders: [String] = []
    
    func getItems() -> [TradersModel] {
        
        switch isFavs {
            
        case true:
            return history.filter{saved_traders.contains($0.tradersName ?? "")}
        case false:
            return history
        }
    }
    
    func fetchHistory() {
        
        let context = CoreDataStack.shared.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<TradersModel>(entityName: "TradersModel")

        do {
            
            let persons = try context.fetch(fetchRequest)
            
            self.history = persons
            
        } catch let error as NSError {
            
            print("Error fetching persons: \(error), \(error.userInfo)")
            
            self.history = []
        }
    }
}
