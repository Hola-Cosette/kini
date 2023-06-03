//
//  ReportView.swift
//  kini
//
//  Created by OhSuhyun on 2023/06/03.
//

import SwiftUI
import PopupView

struct ReportView: View {
    var nutrition1: [String] = ["탄수화물", "단백질", "지방"]
    var nutrition2: [String] = ["칼로리", "나트륨", "콜레스테롤"]
    
    @State var shouldShowPopup : Bool = false   // Popup 여부
    
    var body: some View {
            ZStack {
                Button(action: {    // Popup Button
                    self.shouldShowPopup = true
                }, label: {
                    Text("팝업")
                        .font(.system(size: 25))
                        .fontWeight(.bold)
                        .foregroundColor(Color.blue)
                        .padding()
                        .background(Color("8227b0"))
                        .cornerRadius(10)
                })
                .popup(isPresented: $shouldShowPopup) {
                    Rectangle()  // Popup
                        .stroke(.gray, lineWidth: 1)
                        .background(.white)
                        .cornerRadius(20)
                        .frame(width: 364, height: 418)
                        .overlay {
                            VStack(spacing: 0) {    // Button 'X' - Grade - Nutrition - Navigation Button
                                Image(systemName: "xmark")  // Button 'X'
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 16)
                                    .padding(EdgeInsets(top: 28, leading: 322, bottom: 4, trailing: 26))

                                Text("훌륭해요!")   // Grade
                                    .font(.system(size: 20))
                                    .lineSpacing(41)

                                Spacer().frame(height: 19)

                                HStack(spacing: 0) {    // Nutrition 1/2
                                    ForEach(nutrition1, id: \.self) { nutrition in   // nutrition1
                                        RoundedRectangle(cornerRadius: 15)  //  // Nutrition Frame
                                            .frame(width: 91, height: 91)
                                            .foregroundColor(.gray)
                                            .padding(.horizontal, 5)
                                            .overlay {
                                                VStack(spacing: 0) {
                                                    Image(systemName: "xmark")  // Nutrition Image
                                                        .resizable()
                                                        .scaledToFit()
                                                        .frame(width: 55, height: 57)
                                                        .cornerRadius(13)
                                                    Text(nutrition) // Nutrition Title
                                                        .font(.system(size: 12))
                                                        .lineSpacing(41)
                                                }   // ~VStack
                                            }   // ~overlay
                                    }   // ~ForEach
                                }   // ~HStack

                                Spacer().frame(height: 12)

                                HStack(spacing: 0) {    // Nutrition 2/2
                                    ForEach(nutrition1, id: \.self) { nutrition in   // nutrition2
                                        RoundedRectangle(cornerRadius: 15)  //  // Nutrition Frame
                                            .frame(width: 91, height: 91)
                                            .foregroundColor(.gray)
                                            .padding(.horizontal, 5)
                                            .overlay {
                                                VStack(spacing: 0) {
                                                    Image(systemName: "xmark")  // Nutrition Image
                                                        .resizable()
                                                        .scaledToFit()
                                                        .frame(width: 55, height: 57)
                                                        .cornerRadius(13)
                                                    Text(nutrition) // Nutrition Title
                                                        .font(.system(size: 12))
                                                        .lineSpacing(41)
                                                }   // ~VStack
                                            }   // ~overlay
                                    }   // ~ForEach
                                }   // ~HStack

                                Spacer().frame(height: 37)

                                Button(action: {    // action

                                }) {    // label
                                    RoundedRectangle(cornerRadius: 15)
                                        .frame(width: 324, height: 50)
                                        .overlay {
                                            Text("식사친구 끼니의 메세지가 도착했어요")
                                                .foregroundColor(.white)
                                        }
                                }
                                .padding(.bottom, 29)
                            }   // ~VStack
                        }

                    // Star
                    Image(systemName: "star.fill")   // Star1
                        .resizable()
                        .scaledToFit()
                        .frame(width: 97, height: 97)
                        .position(x: 59+97/2, y: 207)
                    Image(systemName: "star")   // Star2
                        .resizable()
                        .scaledToFit()
                        .frame(width: 97, height: 97)
                        .position(x: 143+97/2, y: 181)
                    Image(systemName: "star")   // Star3
                        .resizable()
                        .scaledToFit()
                        .frame(width: 97, height: 97)
                        .position(x: 226+97/2, y: 207)
                } customize: {
                    $0
                        .backgroundColor(Color(red: 97/255, green: 97/255, blue: 97/255, opacity: 0.9))
                }
                
                
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
