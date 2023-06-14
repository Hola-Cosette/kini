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
    @AppStorage("setting") var setting: Bool?

    var body: some Scene {
        WindowGroup {
            if (setting == nil) {
                GuardianSelectionView()
                    .environment(\.managedObjectContext, dataController.container.viewContext)
            } else {
                MainView()
                    .environment(\.managedObjectContext, dataController.container.viewContext)
            }
        }
    }
}
