//
//  MainCardView.swift
//  kini
//
//  Created by qwd on 2023/06/12.
//

import SwiftUI

struct MainCardView: View {
    let data = ["아침", "점심", "저녁"]
    let columns = [
        GridItem(.adaptive(minimum: 100))
    ]
    var body: some View {
        LazyVGrid(columns: columns, spacing: 10){
            ForEach(data, id: \.self){i in
                //ZStack으로 도형 추가
                ZStack{
                    Rectangle()
                        .fill(Color.white)
                        .frame(width:110,height:140)
                        .cornerRadius(20)
                    Text(i)
                        .modifier(XSSemiboldBlackTextModifier())
                        .offset(x:0,y:50)
                }
            }
        }
    }
}

struct MainCardView_Previews: PreviewProvider {
    static var previews: some View {
        MainCardView()
    }
}



//struct InputGenderView: View {
//    @Binding var genders: [String]
//    @Binding var genders_disabled: [String]
//    @Binding var genderSelected: Int?
//    var gridItemLayout = [GridItem(.flexible()), GridItem(.flexible())]
//
//    var body: some View {
//        HStack{
//            VStack(alignment: .leading, spacing: 0) {
//                Text("성별을 알려주세요")
//                    .modifier(LSemiboldNavyTextModifier())
//                HStack (spacing: 0){
//                    LazyVGrid(columns: gridItemLayout,alignment: .leading, spacing:0) {
//                        ForEach(0..<genders.count) { gender in
//                            Button(action: {
//                                self.genderSelected = gender
//                            }){
//                                if(self.genderSelected == gender) {
//                                    Image(genders[gender])
//                                } else {
//                                    Image(genders_disabled[gender])
//                                }
//
//                            }
//                            .modifier(Select2GridButtonIsSelectedModifier(isSelected: self.genderSelected == gender))
//
//                        }
//                    }
//                }
//                .padding(.top, 10)
//            }
//
//            Spacer()
//        }
//    }
//}
