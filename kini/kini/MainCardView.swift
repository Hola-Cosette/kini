//
//  MainCardView.swift
//  kini
//
//  Created by qwd on 2023/06/12.
//

import SwiftUI

struct MainCardView: View {
    var body: some View {
        HStack{
            ZStack{
                Rectangle()
                    .fill(Color.pink)
                    .frame(width:110, height:140)
                Text("아침")
            }
            ZStack{
                Rectangle()
                    .fill(Color.pink)
                    .frame(width:110, height:140)
                Text("점심")
            }
            ZStack{
                Rectangle()
                    .fill(Color.pink)
                    .frame(width:110, height:140)
                Text("저녁")
            }
        }
    }
}

struct MainCardView_Previews: PreviewProvider {
    static var previews: some View {
        MainCardView()
    }
}
