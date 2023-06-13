//
//  DataController.swift
//  kini
//
//  Created by jaelyung kim on 2023/06/13.
//

import Foundation
import CoreData

class DataController: ObservableObject {
    let container = NSPersistentContainer(name: "Model")
    
    init() {
        container.loadPersistentStores { desc, error in
            if let error = error {
                print("Fail to load the data \(error.localizedDescription)")
            }
        }
    }
    
    func save(context: NSManagedObjectContext) {
        do {
            try context.save()
            print("Data save!!! WUHU!!!")
        } catch {
            print("We could not save the data...")
        }
    }
    
    func addGuardian(guardian: String, context:NSManagedObjectContext) {
        let user = User(context: context)
        user.guardian = guardian
    }
    
    func addUser(nickName: String, gender: String, age: String, guardian: String, context: NSManagedObjectContext) {
        let user = User(context: context)
        user.nickName = nickName
        user.gender = gender
        user.age = age
        user.guardian = guardian
        
        save(context: context)
    }
    
}

