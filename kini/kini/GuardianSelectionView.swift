//
//  GuardianSelectionView.swift
//  kini
//
//  Created by jaelyung kim on 2023/06/03.
//

// 1. toggle할 때 다른 캐릭터들 비활성화
// 2. UserDefault 저장할 때 캐릭터 이미지 네임도 저장

import SwiftUI

struct GuardianSelectionView: View {
    @State var characters = ["gardian_carrot", "gardian_broccoli", "gardian_eggplant", "gardian_paprika"]
    @State var characters_disabled = ["gardian_carrot_disabled", "gardian_broccoli_disabled", "gardian_eggplant_disabled", "gardian_paprika_disabled"]
    @State var characterSelected: Int?
    
    var body: some View {
        VStack(spacing:0) {
            HeaderView()
                .padding(EdgeInsets(top:97, leading:20, bottom:0, trailing: 23))
                .ignoresSafeArea()
            GuardianGridView(characters: $characters, characters_disabled: $characters_disabled, characterSelected: $characterSelected)
                .padding(EdgeInsets(top:29, leading:32, bottom:0, trailing: 32))
            Button("나의 식사 시간에 함께해주세요"){

            }
            .disabled(characterSelected == nil)
            .frame(maxWidth: .infinity, alignment: .center)
            .foregroundColor(.white)
            .bold()
            .padding()
            .background(characterSelected != nil ? Color.blue : Color.gray)
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
    @State private var isFlagged = false
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 0) {
                Text("누구와 함께 즐거운 식사시간을 가져볼까요?")
                    .modifier(XXXLBoldNavyTextModifier())
                Text("우리 친구의 식사 시간을 함께 할 \n든든한 식사 친구들이 기다리고 있어요. \n한 명을 골라보세요.")
                    .modifier(LSemiboldNavyTextModifier())
                    .padding(.top, 20)
            }
            Spacer()
        }
        
    }
}

struct GuardianGridView: View {
    @Binding var characters: [String]
    @Binding var characters_disabled: [String]
    @Binding var characterSelected: Int?
    var gridItemLayout = [GridItem(.flexible()), GridItem(.flexible())]
    
    var body: some View {
        HStack {
            ScrollView {
                LazyVGrid(columns: gridItemLayout, spacing:20) {
                    ForEach(0..<characters.count) { character in
                        Button(action: {
                            self.characterSelected = character
                        }){
                            Image(characters_disabled[character])
                        }
                        .modifier(Select2GridButtonDisabledModifier())
                    }
                }
            }
        }
    }
}
