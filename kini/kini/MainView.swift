//
//  MainView.swift
//  kini
//
//  Created by qwd on 2023/06/12.
//
import SwiftUI


struct MainView: View {
    var body: some View {
        NavigationView{
            ZStack{
                Color.yellow010.edgesIgnoringSafeArea(.all)
                VStack {
                    //MARK: - 이번주의 끼니점수 텍스트
                    Text("이번주의 끼니 점수")
                        .modifier(LSemiboldNavyTextModifier())
                    
                    //MARK: - 포도송이 이미지
                    GrapeView()
                        .frame(width: 270,height: 416)
//                    Image("bunchOfGrapes")ㄴ
//                        .resizable()
//                        .frame(width: 278,height:384)
//                        .padding()
                    
                    //MARK: - 오늘의 끼니점수
                    Text("오늘의 끼니 점수")
                        .modifier(LSemiboldNavyTextModifier())
                    
                    //MARK: - 아점저 버튼 뷰
                    NavigationLink(destination: HistoryView()) {
                        MainCardView()
                    }
                    .padding()
                    
                    //MARK: - 오늘의 식사 기록하기 버튼
                    NavigationLink(destination: ViewControllerView()) {
                        Text("오늘의 식사 기록하기")
                        .modifier(LongButtonAbledModifier())
                        .shadow(color: Color.shadow, radius: 6, x: 0, y: 4)
                    }
                }
            }
        }
    }
}



struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
