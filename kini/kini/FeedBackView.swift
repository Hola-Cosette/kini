//
//  FeedBackView.swift
//  kini
//
//  Created by OhSuhyun on 2023/06/09.
//

import SwiftUI

struct FeedBackView: View {
    
    // Color Extension List
    let colorBackground = Color(red: 255/255, green: 246/255, blue: 231/255)
    let colorNavy = Color(red: 34/255, green: 49/255, blue: 116/255)    // Font, Frame Color
    let colorLightGray = Color(red: 249/255, green: 249/255, blue: 249/255) // Star Score
    let colorGray = Color(red: 60/255, green: 60/255, blue: 67/255, opacity: 60/100)    // Nutrition Type Text
    let colorBlur = Color(red: 47/255, green: 47/255, blue: 47/255, opacity: 30/100)
    let colorShadow = Color(red: 153/255, green: 123/255, blue: 52/255, opacity: 40/100)    // Shadow Color
    let colorPre = Color(red: 251/255, green: 227/255, blue: 170/255)
    let colorPro = Color(red: 251/255, green: 192/255, blue: 54/255)
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct FeedBackView_Previews: PreviewProvider {
    static var previews: some View {
        FeedBackView()
    }
}
