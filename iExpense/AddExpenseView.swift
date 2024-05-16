//
//  AddExpenseView.swift
//  iExpense
//
//  Created by Dillon Teakell on 5/15/24.
//

import SwiftUI

struct AddExpenseView: View {
    
    @Environment(\.dismiss) var dismiss
    @State private var name = ""
    @State private var type = "Personal"
    @State private var price: Double?
    
    var expenses: Expenses

    var body: some View {
        NavigationStack {
            Form {
                ExpenseNameView(name: $name)
                
                ExpenseTypeView(type: $type)
                
                ExpenseAmountView(price: $price)
            }
            .navigationTitle("New Expense")
            .toolbar {
                Button ("Save") {
                    let newItem = ExpenseItem(name: name, type: type, price: price ?? 0.0)
                    expenses.items.append(newItem)
                    dismiss()
                }
                .tint(.green)
            }
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct ExpenseNameView: View {
    @Binding var name: String
    var body: some View {
        Section("Expense Name") {
            TextField("Name", text: $name)
        }
    }
}

struct ExpenseTypeView: View {
    @Binding var type: String
    let types = ["Business","Personal"]
    var body: some View {
        Section("Expense Type") {
            Picker("Type", selection: $type) {
                ForEach(types, id: \.self) {
                    Text($0)
                }
            }
        }
    }
}

struct ExpenseAmountView: View {
    @Binding var price: Double?
    let currencyCode = Locale.current.currency?.identifier ?? "USD"
    var body: some View {
        Section("Expense Amount") {
            TextField("Amount", value: $price, format: .currency(code: currencyCode))
                .keyboardType(.decimalPad)
        }
    }
}

#Preview {
    AddExpenseView(expenses: Expenses())
}
