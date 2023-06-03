//
//  GuardianSelectionView.swift
//  kini
//
//  Created by jaelyung kim on 2023/06/03.
//

import SwiftUI

struct GuardianSelectionView: View {
    private var imageNames = ["character"]
    
    var body: some View {
        VStack(spacing:0) {
            HeaderView()
                .padding(EdgeInsets(top:97, leading:23, bottom:0, trailing: 23))
                .ignoresSafeArea()
            GuardianGridView(imageNames: imageNames)
                .padding(EdgeInsets(top:29, leading:32, bottom:0, trailing: 32))
            Button("나의 식사 시간에 함께해주세요"){

            }
            .frame(maxWidth: .infinity, alignment: .center)
            .foregroundColor(.white)
            .bold()
            .padding()
            .background(Color.gray)
            .cornerRadius(15)
            .frame(width: 343, height: 50)

        }
    }
}

struct GuardianSelectionView_Previews: PreviewProvider {
    static var previews: some View {
        GuardianSelectionView()
    }
}

struct HeaderView: View {
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 20) {
                Text("누구와 함께 즐거운 식사시간을 가져볼까요?")
                    .font(.largeTitle)
                    .bold()
                Text("우리 친구의 식사 시간을 함께할 든든한 식사 친구들이 기다리고  있어요. 한 명을 골라보세요.")
            }
            Spacer()
        }
        
    }
}

struct GuardianGridView: View {
    var imageNames: [String]
    var gridItemLayout = [GridItem(.flexible()), GridItem(.flexible())]
    
    var body: some View {
        HStack {
            ScrollView {
                LazyVGrid(columns: gridItemLayout, spacing:20) {
                    ForEach((0...3), id: \.self) {_ in
                        Button(action: {
                            
                        }){
                            Image(imageNames[0])
                            
                        }
                        .frame(width:151, height: 195)
                        .cornerRadius(10)
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color.black, lineWidth: 1)
                        )
                    }
                }
            }
        }
    }
}
