//
//  Carousel.swift
//  kini
//
//  Created by jaelyung kim on 2023/06/14.
//

import SwiftUI

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
            .scaleEffect(isActive ? 1.4 : 1)
            .foregroundColor(isActive ? Color(red: 34/255, green: 49/255, blue: 116/255) : Color(red: 152/255, green: 157/255, blue: 180/255))
            .background(isActive ? Color(red: 251/255, green: 192/255, blue: 54/255) : Color.clear)
            .cornerRadius(8)
            .shadow(color: isActive ? Color.shadow : Color.clear, radius: 6, x: 0, y: 4)
            .animation(.easeInOut, value: isActive)
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
