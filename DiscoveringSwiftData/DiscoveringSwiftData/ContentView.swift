//
//  ContentView.swift
//  DiscoveringSwiftData
//
//  Created by Vincent on 06/06/2023.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) private var modelContext
    
    @Query(sort: \.isDone, order: .forward) private var items: [TodoItem]
    
    @State private var searchText: String = ""
    @State private var filteredTodos: [TodoItem] = []
    
    var body: some View {
        NavigationView {
            List {
                ForEach(items) { item in
                    TodoItemRow(todoItem: item)
                }
                .onDelete(perform: deleteItems)
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    EditButton()
                }
                ToolbarItem {
                    Button(action: addItem) {
                        Label("Add Item", systemImage: "plus")
                    }
                }
            }
            .searchable(text: $searchText)
            .searchSuggestions {
                List {
                    ForEach(filteredTodos) { item in
                        Text(item.label)
                    }
                }
            }
            .onChange(of: searchText) {
                let filteredTodosFetchDescriptor = FetchDescriptor<TodoItem>(
                    predicate: #Predicate {
                        $0.label.starts(with: searchText)
                    }
                )
                
                self.filteredTodos = try! modelContext.fetch(filteredTodosFetchDescriptor)
                print(filteredTodos)
            }
        }
    }

    private func addItem() {
        withAnimation {
            let newItem = TodoItem()
            modelContext.insert(newItem)
        }
    }

    private func deleteItems(offsets: IndexSet) {
        withAnimation {
            for index in offsets {
                modelContext.delete(items[index])
            }
        }
    }
}

#Preview {
    ContentView()
        .modelContainer(for: TodoItem.self, inMemory: true)
}
