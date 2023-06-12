//
//  ContentView.swift
//  kini
//
//  Created by jaelyung kim on 2023/05/31.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        ZStack{
            Color.cyan.edgesIgnoringSafeArea(.all)
            VStack {
                //MARK: - 이번주의 끼니점수 텍스트
                Text("이번주의 끼니 점수")
                    .font(.system(size:17))
                //MARK: - 포도송이 이미지
                Image("logo_rounded")//예시로 넣어둠
                    .resizable()
                    .frame(width: 278,height:416)
                
                //MARK: - 오늘의 끼니점수
                Text("오늘의 끼니 점수")
                    .font(.system(size:17))
                HStack{
                    MainCardView()
                }
                Button(action: {
                    print("button tapped")
                }, label: {
                    Text("오늘의 식사 기록하기")
                })
                .background(Color.white)
            }
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
