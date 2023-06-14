//
//  CheckInView.swift
//  kini
//
//  Created by jaelyung kim on 2023/06/05.
//

import SwiftUI

class UserInformation: ObservableObject {
    @Published var nickName: String = ""
    @Published var gender: Int = -1
    @Published var age: Int = 13
}

struct CheckInView: View {
    @State var userInformation: UserInformation
    
    let background = Color.yellow010
    
    @AppStorage("name") private var name = ""
    @AppStorage("gender") private var gender: Int?
    @AppStorage("age") private var age: Int?
    @AppStorage("setting") private var setting: Bool = false
    
    var body: some View {
        ZStack {
            background.ignoresSafeArea()
            VStack(spacing: 0) {
                
                LargeTitleView()
                    .padding(EdgeInsets(top:16, leading:20, bottom:0, trailing: 20))
                InputNickNameView(userInformation: $userInformation)
                    .padding(EdgeInsets(top:20, leading:20, bottom:0, trailing: 0))
                InputGenderView(userInformation: $userInformation)
                    .padding(EdgeInsets(top:50, leading:20, bottom:0, trailing: 10))
                //Number Picker
                InputAgeView()
                    .padding(EdgeInsets(top:39, leading:20, bottom:0, trailing: 10))
                
                NavigationLink(destination: OnBoardingView()){
                    Text("다 입력했어요!")
                    .modifier(LongButtonIsSelectedModifier(isSelected: true))
                        .padding(.bottom, 46)
                            
                }
                .simultaneousGesture(TapGesture().onEnded{
                    name = userInformation.nickName
                    gender = userInformation.gender
                    age = userInformation.age
                    setting = true
                })
            }
        }
    }
    
    
}

struct CheckInView_Previews: PreviewProvider {
    static var previews: some View {
        CheckInView(userInformation: UserInformation())
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
    @Binding var userInformation: UserInformation
    
    var body: some View {

        HStack {
            VStack(alignment: .leading, spacing: 0) {
                Text("어떻게 불러주면 좋을까요?")
                    .modifier(LSemiboldNavyTextModifier())

                    RoundedRectangle(cornerRadius: 15)
                        .foregroundColor(Color.white)
                        .frame(width: 350, height: 50)
                        .overlay(
                            TextField("닉네임 입력", text: $userInformation.nickName)
                                .padding(.leading, 18)
                                .modifier(MRegularNavyTextModifier())
                        )
                        .padding(.top, 10)
            }
            Spacer()
        }
    }
}

struct InputGenderView: View {
    @Binding var userInformation: UserInformation
    @State var gender: Int = -1
    var gridItemLayout = [GridItem(.flexible()), GridItem(.flexible())]

    var body: some View {

        HStack{
            VStack(alignment: .leading, spacing: 0) {
                Text("성별을 알려주세요")
                    .modifier(LSemiboldNavyTextModifier())
                HStack (spacing: 0){
                    LazyVGrid(columns: gridItemLayout,alignment: .leading, spacing:0) {
                       
                            Button(action: {
                                userInformation.gender = 0
                                self.gender = userInformation.gender
                            }){
                                if(gender == 0) {
                                    Image("gender_01")
                                } else {
                                    Image("gender_01_disabled")
                                }
                                
                            }
                            .modifier(Select2GridButtonIsSelectedModifier(isSelected: self.gender == 0))
                            
                            Button(action: {
                                userInformation.gender = 1
                                self.gender = userInformation.gender
                            }){
                                if(gender == 1) {
                                    Image("gender_02")
                                } else {
                                    Image("gender_02_disabled")
                                }
                                
                            }
                            .modifier(Select2GridButtonIsSelectedModifier(isSelected: self.gender == 1))
                        
                    }
                    .padding(.top, 10)
                }
                Spacer()
            }
        }
    }
}

struct InputAgeView: View {
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
