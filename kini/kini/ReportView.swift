//
//  ReportView.swift
//  kini
//
//  Created by OhSuhyun on 2023/06/07.
//

import SwiftUI
import PopupView

struct ReportView: View {
    
    // Color Extension List
    let colorLightPumpkin = Color(red: 255/255, green: 246/255, blue: 231/255)
    
    // MARK: for ReportView
    var nutrition: [String] = ["탄수화물", "단백질", "지방", "당", "열량", "콜레스테롤"]
    
    var grade: String = "훌륭해요!"  // !Sample"
    
    @State var shouldShowPopup : Bool = false   // Popup 여부
    var scoreStar : [Bool] = [true, true, false]    // !Sample 별점!
    var scoreGrade : [String] = ["grade_01", "grade_02", "grade_02",
                                 "grade_03", "grade_01", "grade_01"]    // !Sample 포도 등급!
    
    var body: some View {
            ZStack {
                Rectangle()  // Popup
                    .cornerRadius(15)
                    .frame(width: 350, height: 418)
                    .foregroundColor(.white)
                    .shadow(color: Color.shadow, radius: 6, x: 0, y: 4)
                    .overlay {
                        VStack(spacing: 0) {    //Grade - Nutrition - Navigation Button
                            Text(grade)   // Grade
                                .modifier(XXXLBoldNavyTextModifier())
                                .padding(.top, 55)

                            HStack(spacing: 7.26) {    // Nutrition 1/2
                                ForEach(0..<3) { index in   // nutrition1
                                    RoundedRectangle(cornerRadius: 10)  //  // Nutrition Frame
                                        .frame(width: 102.37, height: 107.99)
                                        .foregroundColor(colorLightPumpkin)
                                        .overlay {
                                            VStack(spacing: 0) {
                                                Image(scoreGrade[index])  // Nutrition Image
                                                    .resizable()
                                                    .scaledToFit()
                                                    .clipShape(Circle())
                                                    .frame(width: 70, height: 70)
                                                    .padding(.top, 7)
                                                
                                                Text(nutrition[index]) // Nutrition Title
                                                    .modifier(XXSRegularNavyTextModifier())
                                                    .padding(.top, 10)
                                                    .padding(.bottom, 6.99)
                                            }   // ~VStack
                                        }   // ~overlay
                                }   // ~ForEach
                            }   // ~HStack
                            .padding(.top, 12)

                            HStack(spacing: 7.26) {    // Nutrition 2/2
                                ForEach(3..<6) { index in   // nutrition2
                                    RoundedRectangle(cornerRadius: 10)  //  // Nutrition Frame
                                        .frame(width: 102.37, height: 107.99)
                                        .foregroundColor(colorLightPumpkin)
                                        .overlay {
                                            VStack(spacing: 0) {
                                                Image(scoreGrade[index])  // Nutrition Image
                                                    .resizable()
                                                    .scaledToFit()
                                                    .clipShape(Circle())
                                                    .frame(width: 70, height: 70)
                                                    .padding(.top, 7)
                                                
                                                Text(nutrition[index]) // Nutrition Title
                                                    .modifier(XXSRegularNavyTextModifier())
                                                    .padding(.top, 10)
                                                    .padding(.bottom, 6.99)
                                            }   // ~VStack
                                        }   // ~overlay
                                }   // ~ForEach
                            }   // ~HStack
                            .padding(.top, 7.01)

                            // Navigation Button -> 4.1 FeedBackView
                            Button("식사친구 끼니의 메세지가 도착했어요!") {
                                
                            }
                            .modifier(PopUpButtonModifier())
                            .shadow(color: Color.shadow, radius: 6, x: 0, y: 4)
                            .padding(.top, 28.02)
                            .padding(.bottom, 19)
                        }   // ~VStack
                    }
                    .padding(.top, 253)
                    .padding(.bottom, 173)

                // Star
                Image("star_01")   // Star1
                    .resizable()
                    .scaledToFit()
                    .frame(width: 89, height: 86)
                    .grayscale(scoreStar[0] ? 0.0 : 1.0)
                    .padding(EdgeInsets(top: 220, leading: 68, bottom: 538, trailing: 233))
                Image("star_01")   // Star2
                    .resizable()
                    .scaledToFit()
                    .frame(width: 89, height: 86)
                    .grayscale(scoreStar[1] ? 0.0 : 1.0)
                    .padding(EdgeInsets(top: 187, leading: 153, bottom: 571, trailing: 148))
                Image("star_01")   // Star3
                    .resizable()
                    .scaledToFit()
                    .frame(width: 89, height: 86)
                    .grayscale(scoreStar[2] ? 0.0 : 1.0)
                    .padding(EdgeInsets(top: 220, leading: 238, bottom: 538, trailing: 63))
                
                
            }   // ~ZStack
            .ignoresSafeArea()
//        }
    }
}

struct ReportView_Previews: PreviewProvider {
    static var previews: some View {
        ReportView()
    }
}
