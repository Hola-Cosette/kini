//
//  HistoryView.swift
//  kini
//
//  Created by OhSuhyun on 2023/06/04.
//

import SwiftUI

struct HistoryView: View {
    // Variable List
    var todayDate: String = "YYYY.MM.DD"    // !Sample!
    var historyDate: String = "MM.DD (W)"   // !Sample!
    let userName: String = "니코" // !Sample!
    var mealTime: String = "아침" // !Sample!
    
    // Image Assets
//    let star1: String = "star_01"
//    let star2: String = "star_02"
//    let star3: String = "star_03"
//    let grape1: String = "grape_01"
//    let grape2: String = "grape_02"
//    let grape3: String = "grape_03"
//    let grape4: String = "grape_04"
    
    // Color Extension List
    let colorLightGray = Color(red: 249/255, green: 249/255, blue: 249/255) // Star Background
    let nutritionColor: [Color] = [Color(red: 254/255, green: 226/255, blue: 125/255),
                                   Color(red: 237/255, green: 175/255, blue: 199/255),
                                   Color(red: 190/255, green: 210/255, blue: 125/255),
                                   Color(red: 240/255, green: 100/255, blue: 51/255),
                                   Color(red: 127/255, green: 177/255, blue: 225/255),
                                   Color(red: 216/255, green: 216/255, blue: 216/255)]
    
    let time: [String] = ["아침", "점심", "저녁"]
    let nutritionType: [String] = ["곡류", "고기, 생선, 달걀, 콩류", "채소류",
                                   "과일류", "우유, 유제품류", "유지, 당류"]
    let starGrade: [String] = ["star_01", "star_02", "star_03"]   // 아침 점심 저녁 별점  // !Sample!
    let grapeGrade: [String] = ["grape_01", "grape_02", "grape_03", "grape_04"] // 포도 등급
    
    var body: some View {
        ZStack {
            Color.yellow010.ignoresSafeArea()
            
            Text("나의 끼니 기록")    // Navigation Title
                .modifier(XXLBoldNavyTextModifier())
                .padding(.top, 62)
                .padding(.bottom, 754)
            
            Image(systemName: "chevron.left")    // Navigation BackButton
//                .font(.system(size: 24)
                .frame(width: 15, height: 23)
                .foregroundColor(Color.navy)
                .padding(EdgeInsets(top: 64, leading: 24, bottom: 757, trailing: 351))
            
            VStack {
                ZStack {    // Nutrition Score
                    Rectangle() // Background
                        .cornerRadius(15)
                        .foregroundColor(.white)
                        .shadow(color: Color.shadow, radius: 4, x: 0, y: 2)
                        .frame(width: 350, height: 254)
                        .padding(.top, 140)
                    
                    VStack(spacing: 0) {    // Date - Grade - Chart
                        Text(historyDate)  // Date
                            .modifier(XXSRegularNavyTextModifier())
                            .padding(.top, 50)
                        
                        Text("오늘의 영양점수")
                            .modifier(LSemiboldNavyTextModifier())
                            .padding(.top, 5)
                        
                        HStack {    // Grade
                            ForEach (0..<3) { index in
                                Rectangle()
                                    .cornerRadius(10)
                                    .frame(width: 106.07, height: 135)
                                    .foregroundColor(colorLightGray)
                                    .overlay {
                                        VStack(spacing: 0) {    // Grade Image - Time
                                            // 별점 계산 결과 별 Image 다르게
                                            
                                            Image(starGrade[index])   // Grade Image
                                                .resizable()
                                                .scaledToFit()
                                                .frame(width: 87, height: 84)
                                                .padding(.top, 8)
                                            
                                            Text(time[index])
                                                .modifier(XSSemiboldNavyTextModifier())
                                                .padding(.top, 16)
                                                .padding(.bottom, 9)
                                        }
                                    }
                            }   // ~ForEach
                        }   // ~HStack(Grade)
                        .padding(.top, 10)
                    }   // ~VStack
                    .padding(.top, 140)
                }   // ~ZStack(Score)
                
                ZStack {    // Nutrition Chart
                    Rectangle() // Background
                        .cornerRadius(15)
                        .foregroundColor(.white)
                        .shadow(color: Color.shadow, radius: 4, x: 0, y: 2)
                        .frame(width: 350, height: 387)
                        .padding(.top, 17)
                    
                    VStack {
                        Text("오늘의 영양차트")
                            .modifier(LSemiboldNavyTextModifier())
                            .padding(.top, 15)
                        
                        Circle() // Chart
                            .foregroundColor(Color.navy)
                            .frame(width: 254, height: 254)
                            .padding(.bottom, 14)
                        
                        HStack(spacing: 0) {    // Nutrition Item 1/2 (Color - Type)
                            ForEach(0..<2) {
                                Circle()    // Nutrition Color
                                    .frame(width: 15, height: 15)
                                    .foregroundColor(nutritionColor[$0])
                                    .padding(.trailing, 4)
                                
                                Text(nutritionType[$0]) // Nutrition Type
                                    .modifier(XXSRegularGrayTextModifier())
                                    .frame(minWidth: 32, alignment: .leading)
                                    .padding(.trailing, 8)
                            }
                        }   // ~HStack(Nutrition Item 1/2)
                        .padding(.leading, 15)
                        .padding(.trailing, 153)
                        
                        HStack(spacing: 0) {    // Nutrition Item 2/2 (Color - Type)
                            ForEach(2..<6) {
                                Circle()    // Nutrition Color
                                    .frame(width: 15, height: 15)
                                    .foregroundColor(nutritionColor[$0])
                                    .padding(.trailing, 4)
                                
                                Text(nutritionType[$0]) // Nutrition Type
                                    .modifier(XXSRegularGrayTextModifier())
                                    .frame(minWidth: 32, alignment: .leading)
                                    .padding(.trailing, 8)
                            }
                        }   // ~HStack(Nutrition Item 2/2)
                        .padding(.leading, 15)
                        .padding(.trailing, 52)
                        
                    }   // ~VStack
                }   // ~ZStack(Chart)
            }   // ~VStack
            .ignoresSafeArea()
            
            HStack(spacing: 0) {    // Arrow - Sticker - Arrow
                Image(systemName: "arrowtriangle.left.fill") // prev
                    .resizable()
                    .aspectRatio(CGSize(width: 0.75, height: 1), contentMode: .fit)
                    .foregroundColor(Color.navy)
                    .frame(width: 20, height: 15)
                    .padding(.trailing, 60)
                
                Image(grapeGrade[2])    // Sticker
                    .resizable()
                    .scaledToFit()
                    .frame(width: 80)
                    .clipShape(Circle())
                
                Image(systemName: "arrowtriangle.right.fill") // next
                    .resizable()
                    .aspectRatio(CGSize(width: 0.75, height: 1), contentMode: .fit)
                    .foregroundColor(Color.navy)
                    .frame(width: 20, height: 15)
                    .padding(.leading, 60)
            }   // ~HStack
            .padding(.top, 100)
            .padding(.bottom, 664)
        }   // ~ZStack
        .ignoresSafeArea()
//        .navigationBarBackButtonHidden()
    }
}

struct HistoryView_Previews: PreviewProvider {
    static var previews: some View {
        HistoryView()
    }
}
