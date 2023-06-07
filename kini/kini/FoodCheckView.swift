//
//  FoodCheckView.swift
//  kini
//
//  Created by OhSuhyun on 2023/06/03.
//

import SwiftUI

struct FoodCheckView: View {
    // Variable List
    var todayDate: String = "YYYY.MM.DD"    // !Sample!
    var historyDate: String = "MM.DD (W)"   // !Sample!
    let userName: String = "니코" // !Sample!
    var mealTime: String = "아침" // !Sample!
    
    // Color Extension List
    let colorBackground = Color(red: 255/255, green: 246/255, blue: 231/255)
    let colorNavy = Color(red: 34/255, green: 49/255, blue: 116/255)    // Font, Frame Color
    let colorLightGray = Color(red: 249/255, green: 249/255, blue: 249/255) // Star Score
    let colorGray = Color(red: 60/255, green: 60/255, blue: 67/255, opacity: 60/100)    // Nutrition Type Text
    let colorShadow = Color(red: 153/255, green: 123/255, blue: 52/255, opacity: 40/100)    // Shadow Color
    let colorPre = Color(red: 251/255, green: 227/255, blue: 170/255)
    let colorPro = Color(red: 251/255, green: 192/255, blue: 54/255)
    var body: some View {
        ZStack {    // Navigation Button - (Photo - Menu)
            colorBackground.ignoresSafeArea()
            VStack {    // Navigation Button
                HStack {    // 버튼 '다시 찍을래요' - 버튼 '점수를 알려주세요'
                    // 버튼 '다시 찍을래요'
                    Button(action: {    // action

                    }) {    // label
                        RoundedRectangle(cornerRadius: 15)
                            .frame(width: 170, height: 50)
                            .foregroundColor(colorPre)
                            .shadow(color: colorShadow,radius: 6, x: 0, y: 4)
                            .overlay {
                                Text("다시 찍을래요")
                                    .foregroundColor(colorNavy)
                                    .font(.system(size: 17, weight: .semibold))
                            }
                    }

                    Spacer().frame(width: 13)   // 버튼 사이 여백

                    // 버튼 '점수를 알려주세요'
                    Button(action: {    // action

                    }) {    // label
                        RoundedRectangle(cornerRadius: 15)
                            .frame(width: 170, height: 50)
                            .foregroundColor(colorPro)
                            .shadow(color: colorShadow,radius: 6, x: 0, y: 4)
                            .overlay {
                                Text("점수를 알려주세요")
                                    .foregroundColor(colorNavy)
                                    .font(.system(size: 17, weight: .semibold))
                            }
                    }

                }   // ~HStack
                .padding(.top, 748)
                .padding(.bottom, 46)
            }   // ~VStack(Navigation Button)
            .ignoresSafeArea()
            
            
            VStack(spacing: 0) {    // Date - Photo - Menu
                Text("\(todayDate)")  // date
                    .font(.system(size: 22, weight: .bold))
                    .foregroundColor(colorNavy)
                    .padding(.top, 62)
                
                // Photo
                Circle()    // Phote Frame
                    .frame(width: 301, height: 301)
                    .foregroundColor(colorNavy)
                    .shadow(color: colorShadow, radius: 6, x: 0, y: 4)
                    .overlay {
                        Image(systemName: "circle.fill")    // Photo -> !test!
                            .resizable()
                            .scaledToFit()
                            .clipShape(Circle())
                            .frame(width: 266, height: 266)
                    }
                    .padding(.top, 15)
                
                Rectangle() // Background
                    .cornerRadius(15)
                    .foregroundColor(.white)
                    .shadow(color: colorShadow, radius: 6, x: 0, y: 4)
                    .frame(width: 350, height: 270)
                    .overlay {  // Menu (Title - Line - List)
                        VStack(spacing: 0) {    // Menu // spacing: 0 -> 컴포넌트 간 기본 spacing = 0
                            Text("\(userName)의 오늘의 \(mealTime) 메뉴")  // Menu Title
                                .font(.system(size: 28))
                                .foregroundColor(colorNavy)
                            
                            Rectangle() // line
                                .frame(width: 300.82, height: 1)
                                .foregroundColor(colorNavy)
                                .padding(.top, 6.5)
                                .padding(.bottom, 32.5)
                            
                            ForEach(0..<6) { menuIndex in   // Menu List
                                Text("Menu \(menuIndex+1)")
                                    .foregroundColor(colorNavy)
                                    .font(.system(size: 15))
                                    .padding(.top, 8)
                            }   // ~ForEach
                        }   // ~VStack
                    }   // ~overlay(Menu)
                    .padding(.top, 24)
                    .padding(.bottom, 144)
                
                
            }   // ~VStack
        }   // ~ZStack
        .ignoresSafeArea()
    }   // ~body
}

struct FoodCheckView_Previews: PreviewProvider {
    static var previews: some View {
        FoodCheckView()
    }
}
