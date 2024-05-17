//
//  ExpenseSection.swift
//  iExpense
//
//  Created by Dillon Teakell on 5/16/24.
//

import SwiftUI

struct ExpenseSection: View {
    let title: String
    let expenses: [ExpenseItem]
    let deleteItems: (IndexSet) -> Void
    let currencyCode = Locale.current.currency?.identifier ?? "USD"
    
    
    var body: some View {
        Section ("\(title)"){
            ForEach(expenses) { item in
                NavigationLink {
                    ExpenseDetailView()
                } label: {
                    HStack {
                        VStack (alignment: .leading) {
                            Text("\(item.name)")
                                .font(.headline)
                            
                            
                            Text("\(item.type)")
                                .font(.caption)
                                .foregroundStyle(.gray)
                        }
                        
                        Spacer()
                        
                        Text("\(item.price.formatted(.currency(code: currencyCode)))")
                            .font(.subheadline)
                            .fontWeight(.medium)
                    }
                }
            }
            .onDelete(perform: deleteItems)
        }
    }
}

#Preview {
    ExpenseSection(title: "Personal", expenses: []) { _ in}
}
