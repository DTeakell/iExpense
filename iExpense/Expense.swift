//
//  Expense.swift
//  iExpense
//
//  Created by Dillon Teakell on 5/15/24.
//

import Foundation

struct ExpenseItem: Identifiable, Codable, Equatable {
    let name: String
    let type: String
    let price: Double
    var id = UUID()
}

@Observable
class Expenses {
    // This is the array housing all of the expenses and is what is being appended to.
    var items = [ExpenseItem]() {
        didSet {
            // To save the data, a JSON encoder is needed
            if let encoded = try? JSONEncoder().encode(items) {
                UserDefaults.standard.set(encoded, forKey: "Items")
            }
        }
    }
    
    init() {
        if let savedItems = UserDefaults.standard.data(forKey: "Items") {
            if let decodedItems = try? JSONDecoder().decode([ExpenseItem].self, from: savedItems) {
                items = decodedItems
                return
            }
        }

        items = []
    }
    
    // Array for personal items
    var personalItems: [ExpenseItem] {
        items.filter { $0.type == "Personal" }
    }
    
    // Array for business items
    var businessItems: [ExpenseItem] {
        items.filter { $0.type == "Business" }
    }
    
    
}
