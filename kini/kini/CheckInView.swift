//
//  CheckInView.swift
//  kini
//
//  Created by jaelyung kim on 2023/06/05.
//

import SwiftUI

struct CheckInView: View {
    var body: some View {
        VStack(spacing: 0) {
            LargeTitleView()
                .padding(.leading, 24)
            InputNickNameView()
                .padding(.leading, 24)
                .padding(.top, 32)
            InputGenderView()
                .padding(.leading, 24)
                .padding(.top, 39)
            //Number Picker
            InputAgeView()
                .padding(.leading, 24)
                .padding(.top, 39)
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

struct CheckInView_Previews: PreviewProvider {
    static var previews: some View {
        CheckInView()
    }
}

struct LargeTitleView: View {
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 0) {
                Text("우리 친구에 대해서 알고 싶어요")
                    .font(.largeTitle)
                    .bold()
            }
            Spacer()
        }
        
    }
}

struct InputNickNameView: View {
    var body: some View {
        
        HStack {
            VStack(alignment: .leading, spacing: 0) {
                Text("어떻게 불러주면 좋을까요?")
                    .bold()
                    .padding(.bottom, 10)
                RoundedRectangle(cornerRadius: 15)
                    .foregroundColor(Color.white)
                    .frame(width: 343, height: 62)
                    .overlay(
                        
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color.black, lineWidth: 1)
                            .overlay(
                                Text("닉네임 입력")
                                    .padding()
                                    .font(.system(size:17))
                                    .foregroundColor(Color.gray)
                            )
                )
            }
            Spacer()
        }
    }
}

struct InputGenderView: View {
    
    var body: some View {
        
        HStack {
            VStack(alignment: .leading, spacing: 0) {
                Text("성별을 알려주세요")
                    .bold()
                    .padding(.bottom, 10)
                HStack (spacing: 29){
                    RoundedRectangle(cornerRadius: 15)
                        .foregroundColor(Color.white)
                        .frame(width: 156, height: 146)
                        .overlay(
                            
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color.black, lineWidth: 1)
                                .overlay(
                                    Text("여아 아이콘")
                                        .padding()
                                        .font(.system(size:17))
                                        .foregroundColor(Color.gray)
                                )
                    )
                    RoundedRectangle(cornerRadius: 15)
                        .foregroundColor(Color.white)
                        .frame(width: 156, height: 146)
                        .overlay(
                            
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color.black, lineWidth: 1)
                                .overlay(
                                    Text("남아 아이콘")
                                        .padding()
                                        .font(.system(size:17))
                                        .foregroundColor(Color.gray)
                                )
                    )
                }
            }
            Spacer()
        }
    }
}

struct InputAgeView: View {
    @State private var number: Int = 1
    var gridItemLayout = [GridItem(.flexible()), GridItem(.flexible())]
    
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 0) {
                Text("마지막으로, 나이를 알려주세요")
                    .bold()
                    .padding(.bottom, 10)
//                Picker("Your age", selection: $number) {
//                    ForEach(8...19, id: \.self) { number in
//                        Text("\(number)")
//                            .rotationEffect(Angle(degrees: -270))
//
//                    }
//                }
//                .pickerStyle(.wheel)
//                .rotationEffect(Angle(degrees: -90))
//                .frame(maxWidth:.infinity, maxHeight: 68)
//                .clipped()
//                HorizontalNumberPicker()
//                    .frame(height:30)
                GeometryReaderStudy()
            }
            Spacer()
        }
    }
}

struct HorizontalNumberPicker: View {
    @State private var number: Int = 1
    
    var body: some View {
        ScrollView(.horizontal) {
            HStack (alignment: .top, spacing: 32){
                ForEach((1...19), id: \.self) { number in
                    Text("\(number)")
                        .font(.system(size: 40))
                        .bold()
                }
            }
            .frame(maxHeight: .infinity)
        }
        Spacer()
    }
}

struct GeometryReaderStudy: View {
    @State private var number: Int = 1
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                ForEach(8..<20 , id: \.self) { number in
                    GeometryReader { geometry in
                        Text("\(number)")
                            .font(.system(size: 40))
                            .bold()
                    }
                    .frame(width: 68, height: 68)
                }
            }
        }
    }
    func getPercentage(geo: GeometryProxy) -> Double {
        // 화면의 중앙 위치
        let maxDistance = UIScreen.main.bounds.width / 2
        // 화면 전체 영역 기준 카드의 현재 중앙 좌표
        let currentX = geo.frame(in: .global).midX
        // 두 위치에 대한 비율 계산
        return Double(1 - (currentX / maxDistance))
    }
}
