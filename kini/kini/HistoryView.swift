//
//  HistoryView.swift
//  kini
//
//  Created by OhSuhyun on 2023/06/04.
//

import SwiftUI

struct HistoryView: View {
    @State var time: [String] = ["아침", "점심", "저녁"]
    
    var body: some View {
        ZStack {
            Text("나의 끼니 기록")
                .font(.system(size: 20))
                .position(x: 133+118/2, y: 60+22/2)
            VStack {
                Spacer()
                Rectangle() // Background
                    .cornerRadius(10)
                    .foregroundColor(Color.gray)
                    .frame(width: 371, height: 660)
                    .overlay {
                        VStack(spacing: 0) {    // Date - Grade - Chart
                            Text("(Date)")  // Date
                                .font(.system(size: 22, weight: .bold))
                                .frame(height: 25)
                                .padding(.top, 41)
                            
                            Spacer()
                            
                            Text("오늘의 영양점수")
                                .font(.system(size: 15, weight: .bold))
                                .frame(height: 41)
                            
                            HStack {    // Grade
                                ForEach(time, id: \.self) { time in
                                    Rectangle()
                                        .cornerRadius(10)
                                        .frame(width: 111, height: 148)
                                        .foregroundColor(.white)
                                        .overlay {
                                            VStack(spacing: 0) {    // Grade Image - Time
                                                Image(systemName: "face.smiling")   // Grade Image
                                                    .resizable()
                                                    .scaledToFit()
                                                    .frame(width: 86, height: 85)
                                                    .padding(.top, 17)
                                                
                                                Text(time)
                                                    .font(.system(size: 15))
                                                    .frame(height: 41)
                                                    .padding(.top, 5)
                                                
                                                Spacer()
                                            }
                                        }
                                }   // ~ForEach
                            }   // ~HStack(Grade)
                            
                            Text("오늘의 영양차트")
                                .font(.system(size: 15, weight: .bold))
                                .frame(height: 41)
                                .padding(.top, 14)
                            
                            Rectangle() // Chart
                                .cornerRadius(10)
                                .foregroundColor(.white)
                                .frame(width: 343, height: 305)
                                .padding(.bottom, 18)
                        }   // ~VStack
                    }   // ~overlay(Background)
                Spacer().frame(height: 35)
            }   // ~VStack
            
            VStack {    // Arrow - Sticker - Arrow
                Spacer()
                
                HStack(spacing: 0) {    // Sticker
                    Image(systemName: "arrowtriangle.left") // prev
                        .resizable()
                        .scaledToFit()
                        .frame(width: 26, height: 26)
                        .padding(.trailing, 60)
                    
                    Circle()    // Sticker
                        .frame(width: 80)
                    
                    Image(systemName: "arrowtriangle.right") // next
                        .resizable()
                        .scaledToFit()
                        .frame(width: 26, height: 26)
                        .padding(.leading, 60)
                }   // ~HStack
                
                Spacer().frame(height: 654)
            }
        }   // ~ZStack
        .ignoresSafeArea()
    }
}

struct HistoryView_Previews: PreviewProvider {
    static var previews: some View {
        HistoryView()
    }
}
