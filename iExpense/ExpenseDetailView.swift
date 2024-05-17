//
//  ExpenseDetailView.swift
//  iExpense
//
//  Created by Dillon Teakell on 5/17/24.
//

import SwiftUI

struct ExpenseDetailView: View {
    
    var title: String = "Example"
    var amount: Double = 10.00
    var type: String = "Personal"
    
    
    
    var body: some View {
        
        NavigationStack {
            Form {
                Section("Expense Name") {
                    HStack {
                        Text("Name")
                        
                        Spacer()
                        
                        Text("\(title)")
                            .foregroundStyle(.gray)
                    }
                }
                
                Section ("Expense Amount") {
                    
                    HStack {
                        
                        Text("Amount")
                        
                        Spacer()
                        
                        Text("\(amount.formatted(.currency(code: "USD")))")
                            .foregroundStyle(.gray)
                    }
                }
            }
            .navigationTitle("Expense Details")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    ExpenseDetailView()
}
