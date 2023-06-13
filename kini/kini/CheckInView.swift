//
//  CheckInView.swift
//  kini
//
//  Created by jaelyung kim on 2023/06/05.
//

import SwiftUI

struct CheckInView: View {
    @State var genders = ["gender_01", "gender_02"]
    @State var genders_disabled = ["gender_01_disabled", "gender_02_disabled"]
    @State var genderSelected: Int?
    @State private var nickName: String = ""
    let background = Color.yellow010
    
    var body: some View {
        ZStack {
            background.ignoresSafeArea()
            
            VStack(spacing: 0) {
                
                LargeTitleView()
                    .padding(EdgeInsets(top:16, leading:20, bottom:0, trailing: 20))
                InputNickNameView(nickName: $nickName)
                    .padding(EdgeInsets(top:20, leading:20, bottom:0, trailing: 0))
                InputGenderView(genders: $genders, genders_disabled: $genders_disabled, genderSelected: $genderSelected)
                    .padding(EdgeInsets(top:50, leading:20, bottom:0, trailing: 10))
                //Number Picker
                InputAgeView()
                    .padding(EdgeInsets(top:39, leading:20, bottom:0, trailing: 10))
                
                Button("다 입력했어요!"){
                    
                }
                .disabled(genderSelected == nil)
                .modifier(LongButtonIsSelectedModifier(isSelected: genderSelected != nil))
                .padding(.bottom, 46)
            }
        }
    }
}

struct CheckInView_Previews: PreviewProvider {
    static var previews: some View {
        CheckInView()
    }
}

struct LargeTitleView: View {
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 0) {
                Text("우리 친구에 대해서 \n알고 싶어요")
                    .modifier(XXXLBoldNavyTextModifier())
            }
            Spacer()
        }
        
    }
}

struct InputNickNameView: View {
    @Binding var nickName: String

    var body: some View {

        HStack {
            VStack(alignment: .leading, spacing: 0) {
                Text("어떻게 불러주면 좋을까요?")
                    .modifier(LSemiboldNavyTextModifier())

                    RoundedRectangle(cornerRadius: 15)
                        .foregroundColor(Color.white)
                        .frame(width: 350, height: 50)
                        .overlay(
                            TextField("닉네임 입력", text: $nickName)
                                .modifier(MRegularNavyTextModifier())
                        )
                        .padding(.top, 10)
            }
            Spacer()
        }
    }
}

struct InputGenderView: View {
    @Binding var genders: [String]
    @Binding var genders_disabled: [String]
    @Binding var genderSelected: Int?
    var gridItemLayout = [GridItem(.flexible()), GridItem(.flexible())]

    var body: some View {

        HStack{
            VStack(alignment: .leading, spacing: 0) {
                Text("성별을 알려주세요")
                    .modifier(LSemiboldNavyTextModifier())
                HStack (spacing: 0){
                    LazyVGrid(columns: gridItemLayout,alignment: .leading, spacing:0) {
                        ForEach(0..<genders.count) { gender in
                            Button(action: {
                                self.genderSelected = gender
                            }){
                                if(self.genderSelected == gender) {
                                    Image(genders[gender])
                                } else {
                                    Image(genders_disabled[gender])
                                }
                                
                            }
                            .modifier(Select2GridButtonIsSelectedModifier(isSelected: self.genderSelected == gender))
                        }
                    }
                    .padding(.top, 10)
                }
                Spacer()
            }
        }
    }
}

struct InputAgeView: View {
    @State private var number: Int = 1
    var gridItemLayout = [GridItem(.flexible()), GridItem(.flexible())]
    
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 0) {
                Text("마지막으로, 나이를 알려주세요!")
                    .modifier(LSemiboldNavyTextModifier())
                Carousel(cardWidth: 68, spacing: 10) {
                    ForEach(8..<20) { number in
                        CarouselCard {
                            Text("\(number)")
                                .font(.system(size:34))
                                .bold()
                        }
                        .padding(.top, 10)
                    }
                }
            }
            Spacer()
        }
    }
}
