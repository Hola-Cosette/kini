//
//  OnBoardingView.swift
//  kini
//
//  Created by jaelyung kim on 2023/06/04.
//

import SwiftUI

struct OnBoardingView: View {
    @State var characters = ["gardian_carrot", "gardian_broccoli", "gardian_eggplant", "gardian_paprika"]
    let background = Color.yellow010
    @AppStorage("guardian") var selectedGuardian: Int!
    
    var body: some View {
        ZStack {
            background.ignoresSafeArea()
            
            VStack(spacing: 0) {
                
                //보호자 선택 뷰에서 선택된 캐릭터로 적용되도록 변경필요
                Image(characters[selectedGuardian])
                    .resizable()
                    .scaledToFit()
                    .frame(height:343)
                    .padding(.bottom, 30)
                
                SpeechBlockView()
                NavigationLink(destination: CheckInView(userInformation: UserInformation())){
                    Text("저에 대해 알려줄게요!")
                        .modifier(LongButtonAbledModifier())
                        .shadow(color: Color.shadow, radius: 6, x: 0, y: 4)
                        .padding(.top, 30)
                }
            }
        }
        
    }
}

//struct OnBoardingView_Previews: PreviewProvider {
//    static var previews: some View {
//        OnBoardingView()
//    }
//}

struct SpeechBlockView: View {
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 0) {
                RoundedRectangle(cornerRadius: 100)
                    .foregroundColor(Color.yellow030)
                    .frame(width: 160, height: 40)
                    .overlay(
                        Text("식사 친구 끼니")
                            .modifier(LSemiboldNavyTextModifier())
                                    
                    )
                    .padding(EdgeInsets(top:0, leading:19, bottom:-20, trailing: 0))
                    .zIndex(9)
               
               RoundedRectangle(cornerRadius: 15)
                   .foregroundColor(Color.white)
                   .frame(width: 350, height: 177)
                   .overlay(
                        Text("날 선택해주었구나, 정말 고마워! \n난 우리 친구가 건강하고 든든한 식사를 할 수 있도록 도와줄 식사친구 **끼니**야. \n이번엔 너에 대해 알려줄래?")
                            .modifier(MRegularNavyTextModifier())
                            .lineSpacing(6.0)
                            .padding(EdgeInsets(top:0, leading:19, bottom:0, trailing: 20))
                        , alignment: .leading
               )
            }
        }
    }
}
