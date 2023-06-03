//
//  FoodCheckView.swift
//  kini
//
//  Created by OhSuhyun on 2023/06/03.
//

import SwiftUI

struct FoodCheckView: View {
    var body: some View {
        ZStack {    // Navigation Button - (Photo - Menu)
            VStack {    // Navigation Button
                Spacer()    // -> 버튼 위치 아래 기준 측정

                HStack {    // 버튼 '다시 찍을래요' - 버튼 '점수를 알려주세요'
                    // 버튼 '다시 찍을래요'
                    Button(action: {    // action

                    }) {    // label
                        RoundedRectangle(cornerRadius: 15)
                            .frame(width: 155, height: 50)
                            .foregroundColor(Color.gray)
                            .overlay {
                                Text("다시 찍을래요")
                                    .foregroundColor(Color.black)
                            }
                    }

                    Spacer().frame(width: 13)   // 버튼 사이 여백

                    // 버튼 '점수를 알려주세요'
                    Button(action: {    // action

                    }) {    // label
                        RoundedRectangle(cornerRadius: 15)
                            .frame(width: 155, height: 50)
                            .foregroundColor(Color.gray)
                            .overlay {
                                Text("점수를 알려주세요")
                                    .foregroundColor(Color.white)
                            }
                    }

                }   // ~HStack
                .padding(.bottom, 43)   // 버튼 위치 기준
            }   // ~VStack(Navigation Button)
            .ignoresSafeArea()
            
            
            VStack(spacing: 0) {    // Photo - Menu
                Spacer()
                ZStack {    // Photo
                    Image("사진 프레임")  // 사진 프레임
                        .frame(width: 390, height: 308)
                        .overlay(RoundedRectangle(cornerRadius: 5)
                                    .stroke(Color.secondary, lineWidth: 0.2))
                    Image("사진") // 음식 사진
                        .frame(width: 238, height: 236)
                        .foregroundColor(.red)
                        .overlay(RoundedRectangle(cornerRadius: 5)
                                    .stroke(Color.secondary, lineWidth: 0.2))
                        .padding(.vertical, 36)
                        .padding(.leading, 47)
                        .padding(.trailing, 105)
                }   // ~ZStack(Photo)
                
                VStack(spacing: 0) {    // Menu // spacing: 0 -> 컴포넌트 간 기본 spacing = 0
                    Text("(date)")  // date
                        .font(.system(size: 20))
                        .padding(.vertical, 0)
                    
                    Rectangle() // line
                        .frame(width: 247, height: 2)
                        .foregroundColor(Color.black)
                        .padding(.top, 6)
                        .padding(.bottom, 14)
                    
                    Text("(Username)의\n(Time) 메뉴")  // Menu Title
                        .font(.system(size: 22, weight: .bold))
                        .multilineTextAlignment(.center)
                        .padding(.top, 0)
                        .padding(.bottom, 9)
                    
                    ForEach(0..<6) { menuIndex in   // Menu List
                        Text("⋅ (menu \(menuIndex+1))")
                            .padding(.vertical, 2)
                    }
                }
                .padding(.top, 43)
                .padding(.bottom, 143)
            }   // ~VStack
            .ignoresSafeArea()
        }   // ~ZStack
    }   // ~body
}

struct FoodCheckView_Previews: PreviewProvider {
    static var previews: some View {
        FoodCheckView()
    }
}
