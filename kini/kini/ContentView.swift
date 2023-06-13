//
//  ContentView.swift
//  kini
//
//  Created by jaelyung kim on 2023/05/31.
//

import SwiftUI

struct ContentView: View {
    @Environment(\.managedObjectContext) var managedObjContext
    @FetchRequest(sortDescriptors: []) var users: FetchedResults<User>
    
    var body: some View {
        Text("contentView")
    }
    
    
}

//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView()
//    }
//}
