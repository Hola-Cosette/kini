//
//  ReportView.swift
//  kini
//
//  Created by OhSuhyun on 2023/06/03.
//

import SwiftUI
import PopupView

struct ReportView: View {
    
    // Color Extension List
    let colorBackground = Color(red: 255/255, green: 246/255, blue: 231/255)
    let colorNavy = Color(red: 34/255, green: 49/255, blue: 116/255)    // Font, Frame Color
    let colorLightPumpkin = Color(red: 255/255, green: 246/255, blue: 231/255)
    let colorLightGray = Color(red: 249/255, green: 249/255, blue: 249/255) // Star Score
    let colorGray = Color(red: 60/255, green: 60/255, blue: 67/255, opacity: 60/100)    // Nutrition Type Text
    let colorShadow = Color(red: 153/255, green: 123/255, blue: 52/255, opacity: 40/100)    // Shadow Color
    let colorBlur = Color(red: 47/255, green: 47/255, blue: 47/255, opacity: 30/100)
    let colorPre = Color(red: 251/255, green: 227/255, blue: 170/255)
    let colorPro = Color(red: 251/255, green: 192/255, blue: 54/255)
    
    // MARK: for ReportView
    var nutrition1: [String] = ["탄수화물", "단백질", "지방"]
    var nutrition2: [String] = ["당", "열량", "콜레스테롤"]
    
    var grade: String = "훌륭해요!"  // !Sample"
    
    @State var shouldShowPopup : Bool = false   // Popup 여부
    
    var body: some View {
            ZStack {
//                // for UI check
//                colorBlur
//                    .blur(radius: 2)
//                    .animation(.easeInOut, value: 0.5)
//                    .ignoresSafeArea()
                
                Rectangle()  // Popup
                    .cornerRadius(15)
                    .frame(width: 350, height: 418)
                    .foregroundColor(.white)
                    .overlay {
                        VStack(spacing: 0) {    //Grade - Nutrition - Navigation Button
                            Text(grade)   // Grade
                                .font(.system(size: 28))
                                .foregroundColor(colorNavy)
                                .padding(.top, 55)

                            HStack(spacing: 0) {    // Nutrition 1/2
                                ForEach(nutrition1, id: \.self) { nutrition in   // nutrition1
                                    RoundedRectangle(cornerRadius: 10)  //  // Nutrition Frame
                                        .frame(width: 102.37, height: 107.99)
                                        .foregroundColor(colorLightPumpkin)
                                        .padding(.horizontal, 5)
                                        .overlay {
                                            VStack(spacing: 0) {
                                                Image(systemName: "face.smiling.inverse")  // Nutrition Image
                                                    .resizable()
                                                    .scaledToFit()
                                                    .clipShape(Circle())
                                                    .frame(width: 70, height: 70)
                                                    .padding(.top, 7)
                                                
                                                Text(nutrition) // Nutrition Title
                                                    .font(.system(size: 12))
                                                    .foregroundColor(colorNavy)
                                                    .padding(.top, 10)
                                                    .padding(.bottom, 6.99)
                                            }   // ~VStack
                                        }   // ~overlay
                                }   // ~ForEach
                            }   // ~HStack
                            .padding(.top, 12)

                            HStack(spacing: 0) {    // Nutrition 2/2
                                ForEach(nutrition1, id: \.self) { nutrition in   // nutrition2
                                    RoundedRectangle(cornerRadius: 10)  //  // Nutrition Frame
                                        .frame(width: 102.37, height: 107.99)
                                        .foregroundColor(colorLightPumpkin)
                                        .padding(.horizontal, 5)
                                        .overlay {
                                            VStack(spacing: 0) {
                                                Image(systemName: "face.smiling.inverse")  // Nutrition Image
                                                    .resizable()
                                                    .scaledToFit()
                                                    .clipShape(Circle())
                                                    .frame(width: 70, height: 70)
                                                    .padding(.top, 7)
                                                
                                                Text(nutrition) // Nutrition Title
                                                    .font(.system(size: 12))
                                                    .foregroundColor(colorNavy)
                                                    .padding(.top, 10)
                                                    .padding(.bottom, 6.99)
                                            }   // ~VStack
                                        }   // ~overlay
                                }   // ~ForEach
                            }   // ~HStack
                            .padding(.top, 7.01)

                            // Navigation Button -> 4.1 FeedBackView
                            Button(action: {    // action

                            }) {    // label
                                RoundedRectangle(cornerRadius: 15)
                                    .foregroundColor(colorPro)
                                    .shadow(color: colorShadow,radius: 4, x: 0, y: 2)
                                    .frame(width: 322, height: 46)
                                    .overlay {
                                        Text("식사친구 끼니의 메세지가 도착했어요")
                                            .foregroundColor(.white)
                                    }
                                    .padding(.top, 28.01)
                                    .padding(.bottom, 19)
                            }
                            .padding(.top, 7.01)
                        }   // ~VStack
                    }
                    .padding(.top, 253)
                    .padding(.bottom, 173)

                // Star
                Image(systemName: "star.fill")   // Star1
                    .resizable()
                    .scaledToFit()
                    .frame(width: 89, height: 86)
                    .padding(EdgeInsets(top: 220, leading: 68, bottom: 538, trailing: 233))
                Image(systemName: "star.fill")   // Star2
                    .resizable()
                    .scaledToFit()
                    .frame(width: 89, height: 86)
                    .padding(EdgeInsets(top: 187, leading: 153, bottom: 571, trailing: 148))
                Image(systemName: "star")   // Star3
                    .resizable()
                    .scaledToFit()
                    .frame(width: 89, height: 86)
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
