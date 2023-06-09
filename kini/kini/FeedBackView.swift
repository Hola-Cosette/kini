//
//  FeedBackView.swift
//  kini
//
//  Created by OhSuhyun on 2023/06/09.
//

import SwiftUI

struct FeedBackView: View {
    
    var selectedCharacter = "gardian_carrot"  // 선택한 캐릭터 이미지
    
    @State private var message: [String] = ["", "", "", "", ""]
    let messageGood: [String] = ["오늘도 (Time)을 잘 챙겨 먹었구나,\n(Username).\n끼니를 거르지 않고 꼭꼭 챙겨먹다니\n정말 칭찬해!",
                             "특히 오늘 (time)에 먹은 음식은\n영양가가 정말 높고 훌륭했단다. ",
                             "우와 정말요?",
                             "그래! 정말 잘했어.\n이런 음식을 앞으로도 다양하게 챙겨 먹으면\n키도 쑥쑥 크고 근육도 튼튼해질 거야.",
                             "좋아요, 알려줘서 고마워요 끼니!"]
    
    let messageBad: [String] = ["오늘도 (Time)을 잘 챙겨 먹었구나,\n(Username).\n끼니를 거르지 않고 꼭꼭 챙겨먹다니\n정말 칭찬해!",
                             "오늘 (time)에서는 (영양소)가 우리 (Username)에게\n필요한 양보다 조금 (많이/적게) 먹은 것 같아.",
                             "(해당영양소)가 (부족하면/너무 많으면)\n(A문제)가 생길 수 있다고 들었어요.",
                             "잘 알고 있구나!\n그러면 다음에는 조금 더 균형 잡힌 음식을\n먹어 보는 건 어떨까? 끼니가 응원할게!",
                             "좋아요, 알려줘서 고마워요 끼니!"]
    
    var nextButtonLabel = "다음"
    
    @State var count = 0   // 채팅 창 수
    
    var body: some View {
        ZStack {    // NavigationBar - ChatLog - NavigationButtion
            Color.yellow010
                .ignoresSafeArea()
            
            // MARK: NavigationBar
            Rectangle() // NavagationBar
                .stroke(Color.gray030, lineWidth: 1)
                .background(.white)
                .frame(width: .infinity, height: 103)
                .padding(.bottom, 741)
                .overlay {  // Navigation BackButton - Character - (CharacterName - CharacterMessage)
                    HStack {
                        Image(systemName: "chevron.left")    // Navigation BackButton
                            .frame(width: 15, height: 23)
                            .foregroundColor(Color.navy)
                            .padding(.leading, 24)
                        
                        CharacterThumbnail(characterThumbnail: selectedCharacter, thumbnailWidth: 32, thumbnailHeight: 32)
                            .padding(.leading, 21)
                        
                        VStack(alignment: .leading) {    // CharacterName - CharacterMessage
                            Text("식사 친구 끼니")
                                .modifier(MSemiboldNavyTextModifier())
                            
                            Text("오늘도 건강하고 든든한 하루!")
                                .modifier(XSRegularGrayTextModifier())
                        }   // ~VStack
                        .padding(.leading, 10)
//                                .padding(.trailing, 139)  // 폰트 문제로 sketch 기준 수치 입력 시 text 짤림
                        
                        Spacer()    // HStack padding 대체 수단
                    }   // ~HStack
                    .padding(.top, 58)
                    .padding(.bottom, 747)
                }   // ~overlay
            
            // MARK: ChatLog
            VStack(spacing: 15) {    //ChatLog
                if (count >= 1) {  // 대화창 1,2
                    HStack(alignment: .bottom) {    // kini
                        CharacterThumbnail(characterThumbnail: selectedCharacter, thumbnailWidth: 28, thumbnailHeight: 28)
                            .padding(.leading, 21)
                        
                        VStack(alignment: .leading, spacing: 5) {    // 같은 사람 대화 // spacing 5
                            ChatLogKini(message: message[0], messageFeedBack: messageGood[0])
                                .onAppear {
                                    DispatchQueue.main.asyncAfter(deadline: .now() + 0) {
                                        message[0] = "․  ·  ․"
                                    }
                                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                                        message[0] = "·  ․  ·"
                                    }
                                    DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                                        message[0] = "․  ·  ․"
                                    }
                                    DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
                                        message[0] = messageGood[0]
                                    }
                                }
                            if count >= 2 {
                                ChatLogKini(message: message[1], messageFeedBack: messageGood[1])
                                
                            }
                        }
                        Spacer()
                    }   // ~HStack(Chat 1~2/5)
                }
                
                if (count >= 3) {  // 대화창 3
                    HStack(alignment: .bottom) {    // user
                        
                        Spacer()
                        
                        VStack(alignment: .trailing, spacing: 5) {    // 같은 사람 대화 // spacing 5
                            ChatLogUser(message: message[2], messageFeedBack: messageGood[2])
                        }
                        .padding(.trailing, 20)
                    }   // ~HStack(Chat 3/5)
                }
                
                if (count >= 4) {   // 대화창 4
                    HStack(alignment: .bottom) {    // kini
                        CharacterThumbnail(characterThumbnail: selectedCharacter, thumbnailWidth: 28, thumbnailHeight: 28)
                            .padding(.leading, 21)
                        
                        VStack(alignment: .leading, spacing: 5) {    // 같은 사람 대화 // spacing 5
                            ChatLogKini(message: message[3], messageFeedBack: messageGood[3])
                        }
                        Spacer()
                    }   // ~HStack(Chat 4/5)
                }
                
                if (count >= 5) {   // 대화창 5
                    HStack(alignment: .bottom) {    // user
                        
                        Spacer()
                        
                        VStack(alignment: .trailing, spacing: 5) {    // 같은 사람 대화 // spacing 5
                            ChatLogUser(message: message[4], messageFeedBack: messageGood[4])
                        }
                        .padding(.trailing, 20)
                    }   // ~HStack(Chat 3/5)
                }
                Spacer()
            }   // ~VStack
            .padding(.top, 103) // NavigationBar 영역
            .padding(.top, 13)  // NavigationBar과의 padding
            
            // MARK: NavigationButton
            // 버튼 '다음'
            Button(count == 5 ? "끼나와의 대화 마치기" : "다음"){
                if count == 5 {
                    self.count = 0  // 초기화
                    // Navigation
                } else {
                    count += 1  // 다음 채팅이 나오도록
                }
                self.message = ["", "", "", "", ""] // 출력 대화창 초기화
            }
            .modifier(LongButtonAbledModifier())
            .shadow(color: Color.shadow, radius: 6, x: 0, y: 4)
            .padding(.top, 748)
            .padding(.bottom, 46)
            
            
        }
        .ignoresSafeArea()
    }
}

struct FeedBackView_Previews: PreviewProvider {
    static var previews: some View {
        FeedBackView()
    }
}

struct CharacterThumbnail: View {
    let characterThumbnail: String    // 캐릭터 사진 이릅
    let thumbnailWidth: Double
    let thumbnailHeight: Double
    
    var body: some View {
        VStack {
            Circle()
                .foregroundColor(Color.yellow020)
                .frame(width: thumbnailWidth, height: thumbnailHeight)
                .overlay {
                Image(characterThumbnail)   //   !Sample!
                    .resizable()
                    .scaledToFit()
                    .frame(width: thumbnailWidth, height: thumbnailHeight)
                    .clipShape(Circle())
            }
        }
    }
}

struct ChatLogKini: View {
    @State var message: String
    let messageFeedBack: String
    
    var body: some View {
        VStack {
            Text(message)
                .modifier(XXSRegularNavyTextModifier())
                .multilineTextAlignment(.leading)
                .padding(EdgeInsets(top: 8, leading: 10, bottom: 8, trailing: 10))
                .background(.white)
                .cornerRadius(15)
                .overlay {
                    RoundedRectangle(cornerRadius: 15)
                        .stroke(Color.yellow030, lineWidth: 1)
                        .background(.clear)
                        .cornerRadius(15)
                        .frame(maxWidth: 270)
                        .frame(maxHeight: 80)
                }
                .onAppear { // 작성중 효과
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0) {
                        message = "․  ․  ․"
                    }
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                        message = "·  ․  ․"
                    }
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                        message = "․  ·  ․"
                    }
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                        message = "․  ․  ·"
                    }
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.4) {
                        message = "․  ․  ․"
                    }
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                        message = "·  ․  ․"
                    }
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.6) {
                        message = "․  ·  ․"
                    }
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.7) {
                        message = "․  ․  ·"
                    }
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.8) {
                        message = "․  ․  ․"
                    }
                    DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                        message = messageFeedBack
                    }
                }   // ~onAppear(작성중 효과)
        }
    }
}

struct ChatLogUser: View {
    @State var message: String
    let messageFeedBack: String
    
    var body: some View {
        VStack {
            Text(message)
                .modifier(XXSRegularNavyTextModifier())
                .multilineTextAlignment(.leading)
                .padding(EdgeInsets(top: 8, leading: 10, bottom: 8, trailing: 10))
                .background(Color.yellow030)
                .cornerRadius(15)
                .overlay {
                    RoundedRectangle(cornerRadius: 15)
                        .stroke(Color.yellow030, lineWidth: 1)
                        .background(.clear)
                        .cornerRadius(15)
                        .frame(maxWidth: 270)
                        .frame(maxHeight: 80)
                }
                .onAppear { // 작성중 효과
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0) {
                        message = "․  ․  ․"
                    }
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                        message = "·  ․  ․"
                    }
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                        message = "․  ·  ․"
                    }
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                        message = "․  ․  ·"
                    }
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.4) {
                        message = "․  ․  ․"
                    }
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                        message = "·  ․  ․"
                    }
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.6) {
                        message = "․  ·  ․"
                    }
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.7) {
                        message = "․  ․  ·"
                    }
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.8) {
                        message = "․  ․  ․"
                    }
                    DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                        message = messageFeedBack
                    }
                }   // ~onAppear(작성중 효과)
        }
    }
}
