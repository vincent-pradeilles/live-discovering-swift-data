//
//  TodoItemRow.swift
//  DiscoveringSwiftData
//
//  Created by Vincent on 06/06/2023.
//

import SwiftUI

struct TodoItemRow: View {
    
    @Bindable var todoItem: TodoItem
    
    var body: some View {
        HStack {
            Button(
                todoItem.isDone ? "Done" : "Todo") {
                    withAnimation {
                        todoItem.isDone.toggle()
                    }
                }
                .fontWeight(.bold)
                .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
            
            TextField("", text: $todoItem.label)
                .strikethrough(todoItem.isDone)
        }
        .padding()
    }
}
