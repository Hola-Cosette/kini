//
//  OnBoardingView.swift
//  kini
//
//  Created by jaelyung kim on 2023/06/04.
//

import SwiftUI

struct OnBoardingView: View {
    var body: some View {
        ZStack {
            Image("character")
                .resizable()
                .frame(width:223, height:321)
                .offset(y:-85)
            VStack {
                
                HStack {
                    ZStack {
                        
                        RoundedRectangle(cornerRadius: 10)
                            .foregroundColor(Color.white)
                            .frame(width: 331, height: 196)
                            .overlay(
                                
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(Color.black, lineWidth: 1)
                                    .overlay(
                                        Text("날 선택해주었구나, 정말 고마워. 난 우리 친구가 건강하고 든든한 식사를 할 수 있도록 도와줄 식사친구 끼니야. 이번엔 너에 대해 알려줄래?")
                                            .padding(EdgeInsets(top:0, leading:25, bottom:0, trailing: 25))
                                            .font(.system(size:20))
                                            .lineSpacing(7.5)
                                    )
                        )
                        
                        RoundedRectangle(cornerRadius: 100)
                            .foregroundColor(Color.black)
                            .frame(width: 128, height: 38)
                            .overlay(
                                Text("식사친구 끼니")
                                    .foregroundColor(.white)
                                    .padding()
                                    .font(.system(size:15))
                                    .bold()
                                            
                            )
                            .offset(x:-113, y:-100)
                    }
                }
                
                    
                Button("저에 대해 알려줄게요"){

                }
                .frame(maxWidth: .infinity, alignment: .center)
                .foregroundColor(.white)
                .bold()
                .padding()
                .background(Color.gray)
                .cornerRadius(15)
                .frame(width: 343, height: 50)
            }
            .offset(y:150)
        }
    }
}

struct OnBoardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnBoardingView()
    }
}
