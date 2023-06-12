//
//  FoodCheckView.swift
//  kini
//
//  Created by OhSuhyun on 2023/06/03.
//

import SwiftUI
import PopupView

struct FoodCheckView: View {
    // Variable List
    var todayDate: String = "YYYY.MM.DD"    // !Sample!
    var historyDate: String = "MM.DD (W)"   // !Sample!
    let userName: String = "니코" // !Sample!
    var mealTime: String = "아침" // !Sample!
    
    // Color Extension List
    
    // MARK: for ReportView
    var nutrition1: [String] = ["탄수화물", "단백질", "지방"]
    var nutrition2: [String] = ["당", "열량", "콜레스테롤"]
    @State var shouldShowPopup : Bool = false   // Popup 여부
    var reportView = ReportView()
    // ~MARK
    
    var body: some View {
        ZStack {    // Navigation Button - (Photo - Menu)
            Color.yellow010.ignoresSafeArea()
            VStack {    // Navigation Button
                HStack {    // 버튼 '다시 찍을래요' - 버튼 '점수를 알려주세요'
                    // 버튼 '다시 찍을래요'
                    Button ("다시 찍을래요") {
                        
                    }
                    .modifier(ShortButtonDisabledModifier())
                    .shadow(color: Color.shadow,radius: 6, x: 0, y: 4)

                    Spacer().frame(width: 13)   // 버튼 사이 여백

                    // 버튼 '점수를 알려주세요'
                    Button ("점수를 알려주세요") {
                        shouldShowPopup = true
                    }
                    .modifier(ShortLongButtonAbledModifier())
                    .shadow(color: Color.shadow,radius: 6, x: 0, y: 4)
                }   // ~HStack
                .padding(.top, 748)
                .padding(.bottom, 46)
            }   // ~VStack(Navigation Button)
            .ignoresSafeArea()
            
            
            VStack(spacing: 0) {    // Date - Photo - Menu
                Text("\(todayDate)")  // date
                    .modifier(XXLBoldNavyTextModifier())
                    .padding(.top, 62)
                
                // Photo
                Circle()    // Phote Frame
                    .frame(width: 301, height: 301)
                    .foregroundColor(Color.navy)
                    .shadow(color: Color.shadow, radius: 6, x: 0, y: 4)
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
                    .shadow(color: Color.shadow, radius: 6, x: 0, y: 4)
                    .frame(width: 350, height: 270)
                    .overlay {  // Menu (Title - Line - List)
                        VStack(spacing: 0) {    // Menu // spacing: 0 -> 컴포넌트 간 기본 spacing = 0
                            Text("\(userName)의 오늘의 \(mealTime) 메뉴")  // Menu Title
                                .modifier(XXXLBoldNavyTextModifier())
                                .padding(.top, 20)
                            
                            Rectangle() // line
                                .frame(width: 300.82, height: 1)
                                .foregroundColor(Color.navy)
                                .padding(.top, 6.5)
                                .padding(.bottom, 32.5)
                            
                            ForEach(0..<6) { menuIndex in   // Menu List
                                Text("Menu \(menuIndex+1)")
                                    .modifier(SRegularNavyTextModifier())
                                    .padding(.top, 8)
                            }   // ~ForEach
                            
                            Spacer().frame(height: 27)
                        }   // ~VStack
                    }   // ~overlay(Menu)
                    .padding(.top, 24)
                    .padding(.bottom, 144)
                
                
            }   // ~VStack
            
            .popup(isPresented: $shouldShowPopup) {
                Color.gray010
                    .blur(radius: 2)
                    .animation(.easeInOut)
                    .ignoresSafeArea()
                reportView  // popup
            } customize: {
                $0
                    .backgroundColor(Color(red: 97/255, green: 97/255, blue: 97/255, opacity: 0.9))
            }
        }   // ~ZStack
        .ignoresSafeArea()
    }   // ~body
}

struct FoodCheckView_Previews: PreviewProvider {
    static var previews: some View {
        FoodCheckView()
    }
}
