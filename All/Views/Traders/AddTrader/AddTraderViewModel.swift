//
//  AddTraderViewModel.swift
//  App121
//
//  Created by IGOR on 12/06/2023.
//

import SwiftUI
import CoreData

final class AddTraderViewModel: ObservableObject {
    
    @Published var tradersName: String = ""
    @Published var tradersBalance: String = ""
    @Published var tradersPortfoy: String = ""
    
    func addToHistory(completion: @escaping () -> (Void)) {
                
        let context = CoreDataStack.shared.persistentContainer.viewContext
        let people = NSEntityDescription.insertNewObject(forEntityName: "TradersModel", into: context) as! TradersModel
        
        people.tradersName = tradersName
        people.tradersBalance = Int32(Int(tradersBalance) ?? 0)
        people.tradersPortfoy = Int16(Int(tradersPortfoy) ?? 0)
        
        CoreDataStack.shared.saveContext()
                
        completion()
    }
}

