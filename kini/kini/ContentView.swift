//
//  ContentView.swift
//  kini
//
//  Created by jaelyung kim on 2023/06/16.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        if UserDefaults.standard.bool(forKey: "setting"){
            MainView()
        } else {
            GuardianSelectionView()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
