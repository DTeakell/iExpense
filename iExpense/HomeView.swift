//
//  HomeView.swift
//  iExpense
//
//  Created by Dillon Teakell on 5/15/24.
//

import SwiftUI

struct HomeView: View {
    
    @State private var expenses = Expenses()
    @State private var isShowingAddExpenseView = false
    
    var body: some View {
        NavigationStack {
            List {
                ExpenseSection(title: "Personal Expenses", expenses: expenses.personalItems, deleteItems: removePersonalItems)
                ExpenseSection(title: "Business Expenses", expenses: expenses.businessItems, deleteItems: removeBusinessItems)
            }
            .navigationTitle("My Expenses")
            .toolbar {
                Button ("Add Item", systemImage: "plus") {
                    isShowingAddExpenseView = true
                }
                .tint(.green)
            }
            .sheet(isPresented: $isShowingAddExpenseView) {
                AddExpenseView(expenses: expenses)
            }
        }
    }
    
    
    
    func removeItem(at offsets: IndexSet, in inputArray: [ExpenseItem]) {
        var objectsToDelete = IndexSet()
        
        for offset in offsets {
            let item = inputArray[offset]
            
            if let index = expenses.items.firstIndex(of: item) {
                objectsToDelete.insert(index)
            }
        }
        
        expenses.items.remove(atOffsets: objectsToDelete)
    }
    
    // Remove Personal Items
    func removePersonalItems(at offsets: IndexSet) {
        removeItem(at: offsets, in: expenses.personalItems)
    }
    
    // Remove Business Items
    func removeBusinessItems(at offsets: IndexSet) {
        removeItem(at: offsets, in: expenses.businessItems)
    }
    
    
    
}

#Preview {
    HomeView()
}
