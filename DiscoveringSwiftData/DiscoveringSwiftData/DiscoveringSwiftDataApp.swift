//
//  DiscoveringSwiftDataApp.swift
//  DiscoveringSwiftData
//
//  Created by Vincent on 06/06/2023.
//

import SwiftUI
import SwiftData

@main
struct DiscoveringSwiftDataApp: App {

    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: TodoItem.self)
    }
}
