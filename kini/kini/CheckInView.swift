//
//  CheckInView.swift
//  kini
//
//  Created by jaelyung kim on 2023/06/05.
//

import SwiftUI
import SwiftUIWheelPicker

struct CheckInView: View {
    @State var genders = ["gender_01", "gender_02"]
    @State var genders_disabled = ["gender_01_disabled", "gender_02_disabled"]
    @State var genderSelected: Int?
    @State private var nickName: String = ""
    let background = Color.yellow010
    
    
    var body: some View {
        ZStack {
            background.ignoresSafeArea()
            
            VStack(spacing: 0) {
                Button(action: {
                    
                }) {
                    Image(systemName: "chevron.left")    // Navigation BackButton
                        .foregroundColor(Color.navy)
                        .frame(maxWidth: .infinity, maxHeight: 23, alignment: .leading)
                        .padding(.leading, 20)
                }
                
                LargeTitleView()
                    .padding(EdgeInsets(top:16, leading:20, bottom:0, trailing: 20))
                InputNickNameView(nickName: $nickName)
                    .padding(EdgeInsets(top:20, leading:20, bottom:0, trailing: 0))
                InputGenderView(genders: $genders, genders_disabled: $genders_disabled, genderSelected: $genderSelected)
                    .padding(EdgeInsets(top:50, leading:20, bottom:0, trailing: 10))
                //Number Picker
                InputAgeView()
                    .padding(EdgeInsets(top:39, leading:20, bottom:67, trailing: 10))
                
                Button("다 입력했어요!"){

                }
                .disabled(genderSelected == nil)
                .modifier(LongButtonIsSelectedModifier(isSelected: genderSelected != nil))
                .padding(.bottom, 46)
            }
        }
        
    }
}

struct CheckInView_Previews: PreviewProvider {
    static var previews: some View {
        CheckInView()
    }
}

struct LargeTitleView: View {
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 0) {
                Text("우리 친구에 대해서 \n알고 싶어요")
                    .modifier(XXXLBoldNavyTextModifier())
            }
            Spacer()
        }
        
    }
}

struct InputNickNameView: View {
    @Binding var nickName: String
    
    var body: some View {
        
        HStack {
            VStack(alignment: .leading, spacing: 0) {
                Text("어떻게 불러주면 좋을까요?")
                    .modifier(LSemiboldNavyTextModifier())
                
                    RoundedRectangle(cornerRadius: 15)
                        .foregroundColor(Color.white)
                        .frame(width: 350, height: 50)
                        .overlay(
                            TextField("닉네임 입력", text: $nickName)
                                .modifier(MRegularNavyTextModifier())
                        )
                        .padding(.top, 10)
                    
            }
            Spacer()
        }
    }
}

struct InputGenderView: View {
    @Binding var genders: [String]
    @Binding var genders_disabled: [String]
    @Binding var genderSelected: Int?
    var gridItemLayout = [GridItem(.flexible()), GridItem(.flexible())]
    
    var body: some View {
        
        HStack{
            VStack(alignment: .leading, spacing: 0) {
                Text("성별을 알려주세요")
                    .modifier(LSemiboldNavyTextModifier())
                HStack (spacing: 0){
                    LazyVGrid(columns: gridItemLayout,alignment: .leading, spacing:0) {
                        ForEach(0..<genders.count) { gender in
                            Button(action: {
                                self.genderSelected = gender
                            }){
                                if(self.genderSelected == gender) {
                                    Image(genders[gender])
                                } else {
                                    Image(genders_disabled[gender])
                                }
                                
                            }
                            .modifier(Select2GridButtonIsSelectedModifier(isSelected: self.genderSelected == gender))
                            
                        }
                    }
                }
                .padding(.top, 10)
            }
            
            Spacer()
        }
    }
}

struct InputAgeView: View {
    @State private var number: Int = 1
    var gridItemLayout = [GridItem(.flexible()), GridItem(.flexible())]
    
    @State var indexScale: Int = 0
    @State var items: [Int] = [8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20]
    
    var body: some View {
        
        HStack {
            VStack(alignment: .leading, spacing: 0) {
                Text("마지막으로, 나이를 알려주세요!")
                    .modifier(LSemiboldNavyTextModifier())
                
                SwiftUIWheelPicker($indexScale, items: $items) { value in
                    GeometryReader { reader in
                        Text("\(value)")
                            .frame(width: reader.size.width, height: reader.size.height, alignment: .center)
                    }
                }
                .scrollScale(0.6)
                .frame(height: 68)
                
//                Carousel(cardWidth: 68, spacing: 10) {
//                    ForEach(8..<20) { number in
//                        CarouselCard {
//                            Text("\(number)")
//                                .font(.system(size:34))
//                                .bold()
//                        }
//                        .padding(.top, 10)
//                    }
//                }
            }
            Spacer()
        }
    }
}

fileprivate class CarouselConfig: ObservableObject {
    @Published var cardWidth: CGFloat = 0
    @Published var cardCount: Int = 0
    @Published var selected: Int = 0
}

struct Carousel<Cards: View>: View {
    let cards: Cards

    private var config: CarouselConfig

    @GestureState private var isDetectingLongPress = false

    @State private var offset: CGFloat = 0
    @State private var gestureOffset: CGFloat = 0

    private let spacing: CGFloat

    init(
        cardWidth: CGFloat, selected: Int = 0, spacing: CGFloat = 20,
        @ViewBuilder cards: @escaping () -> Cards
    ) {
        self.config = CarouselConfig()
        self.config.cardWidth = cardWidth
        self.config.selected = selected

        self.spacing = spacing

        self.cards = cards()
    }

    func offset(for index: Int, geometry: GeometryProxy) -> CGFloat {
        return (geometry.size.width - self.config.cardWidth) / 2 - CGFloat(self.config.selected)
        * (self.config.cardWidth + spacing)
    }

    var body: some View {
        GeometryReader {
            geometry in
            HStack(alignment: .center, spacing: self.spacing) {
                cards
                    .environmentObject(config)
            }
            .offset(x: offset + gestureOffset)
            .onAppear {
                self.offset = self.offset(for: self.config.selected, geometry: geometry)
            }
            .gesture(
                DragGesture().updating($isDetectingLongPress) { currentState, gestureState, transaction in
                    self.gestureOffset = currentState.translation.width

                }.onEnded { value in
                    self.offset += self.gestureOffset
                    self.gestureOffset = 0
                    if value.translation.width < -(geometry.size.width / 6) {
                        self.config.selected = min(self.config.selected + 1, self.config.cardCount - 1)
                    } else if value.translation.width > (geometry.size.width / 6) {
                        self.config.selected = max(0, self.config.selected - 1)
                    }
                    withAnimation(.easeOut(duration: 0.3)) {
                        print(self.config.selected)
                        self.offset = self.offset(for: self.config.selected, geometry: geometry)
                    }
                }
            )
        }
    }
}

struct CarouselCard<Content: View>: View {
    @EnvironmentObject fileprivate var config: CarouselConfig

    let content: Content
    @State private var cardId: Int? = nil

    var isActive: Bool {
        // The cards are numbered in reverse order
        print(config.cardCount)
        print(config.selected )
        return cardId == config.cardCount - config.selected - 1
    }

    init(@ViewBuilder content: @escaping () -> Content) {
        self.content = content()
    }

    var body: some View {
        content
            .frame(width: config.cardWidth, height: config.cardWidth)
            .scaleEffect(isActive ? 1 : 0.8)
            .foregroundColor(isActive ? Color(red: 34/255, green: 49/255, blue: 116/255) : Color(red: 152/255, green: 157/255, blue: 180/255))
            .background(isActive ? Color(red: 251/255, green: 192/255, blue: 54/255) : Color.blue)
            .cornerRadius(8)
            .shadow(color: isActive ? Color.shadow : Color.clear, radius: 6, x: 0, y: 4)
            .animation(.easeInOut, value: isActive)
//            .zIndex(isActive ? 1 : 0)
            .onAppear {
                self.cardId = self.config.cardCount
                self.config.cardCount += 1
            }
    }
}

struct Carousel_Previews: PreviewProvider {
    static var previews: some View {
        Carousel(cardWidth: 68, spacing: 10) {
            ForEach(8..<20) { number in
                CarouselCard {
                    Text("\(number)")
                        .font(.system(size:34))
                        .bold()
                }
            }
        }
    }
}

