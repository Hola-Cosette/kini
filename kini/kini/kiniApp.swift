//
//  kiniApp.swift
//  kini
//
//  Created by jaelyung kim on 2023/05/31.
//

import SwiftUI

@main
struct kiniApp: App {
    @StateObject private var dataController = DataController()

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, dataController.container.viewContext)
        }
    }
}
