//
//  NutritionChartView.swift
//  kini
//
//  Created by qwd on 2023/06/15.
//

import SwiftUI

struct DataItems: Identifiable {
    var id = UUID()
    var title: Image
    var size: CGFloat
    var color: Color
    var offset = CGSize.zero
}


struct NutritionChartView: View {
    // test data -> 사이즈는 state로 받아와서 변경해야 됨
    @State private var data: [DataItems] = [
        DataItems(title: Image("cereal"), size: 130, color: Color.cereal),
        DataItems(title: Image("vegetable"), size: 38, color: Color.vegetable),
        DataItems(title: Image("dairy"), size: 60, color: Color.dairy),
        DataItems(title: Image("sugar"), size: 70, color: Color.sugar),
        DataItems(title: Image("meat"), size: 40, color: Color.meat),
        DataItems(title: Image("fruit2"), size: 85, color: Color.fruit)
    ]
    
            
    var body: some View {
        ZStack {
//            Circle()
//            .foregroundColor(Color.navy)
//            .frame(width: 255, height: 255)
//            .padding(.bottom, 14)
            ForEach(data, id: \.id) { item in
                ZStack {
                    Circle()
                        .frame(width: CGFloat(item.size))
                        .foregroundColor(item.color)
                    Text(item.title)
                }
                .offset(item.offset)
            }
        }
        
        // calculate and set the offsets - could be done at other time or place in code
        .onAppear {
            data[0].offset = CGSize.zero
            data[1].offset = CGSize(width: (data[0].size + data[1].size) / 2, height: 0 )
                
            var alpha = CGFloat.zero
            
            for i in 2..<data.count {
                                
                // sides of the triangle from circle center points
                let c = (data[0].size + data[i-1].size) / 2
                let b = (data[0].size + data[i].size) / 2
                let a = (data[i-1].size + data[i].size) / 2
                
                alpha += calculateAlpha(a, b, c)
                                
                let x = cos(alpha) * b
                let y = sin(alpha) * b
                
                data[i].offset = CGSize(width: x, height: -y )
            }
        }
    }
    
    // Calculate alpha from sides - 1. Cosine theorem
    func calculateAlpha(_ a: CGFloat, _ b: CGFloat, _ c: CGFloat) -> CGFloat {
        return acos(
            ( pow(a, 2) - pow(b, 2) - pow(c, 2) )
            /
            ( -2 * b * c ) )

    }
}

struct NutritionChartView_Previews: PreviewProvider {
    static var previews: some View {
        NutritionChartView()
    }
}
