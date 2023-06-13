//
//  GrapeView.swift
//  kini
//
//  Created by qwd on 2023/06/13.
//
import SwiftUI

struct GrapeView: View {

    let count: Int = 10
//    let points: [[Int]] = [[1, 1], [3, 1], [0, 2], [2, 2], [4, 2], [1, 3], [3, 3], [2, 4]]

    let points : [[Int]] = [[2,1], [1,2], [3,2], [5,2], [0,3], [2,3], [2,3], [4,3], [6,3], [1,4], [3,4], [5,4], [2,5], [4,5], [3,6] ]
    var body: some View {
        ZStack{
            GeometryReader { geometry in
                let circleW = geometry.size.width/8
                let circleH = geometry.size.height/8
                
                let radi = sqrt(pow(circleW*2, 2) + pow(circleH*2, 2))/2
                
                ForEach(Array(points.enumerated()), id: \.0) { index, point in
                    if index < 3 {
                        Image("grape_01")
                            .resizable()
                            .scaledToFit()
                            .frame(width: radi)
                            .offset(x: CGFloat(point[0]) * circleW, y: CGFloat(point[1]) * circleH)
                    } else if index < 7 {
                        Image("grape_02")
                            .resizable()
                            .scaledToFit()
                            .frame(width: radi)
                            .offset(x: CGFloat(point[0]) * circleW, y: CGFloat(point[1]) * circleH)
                    } else if index < count {
                        Image("grape_03")
                            .resizable()
                            .scaledToFit()
                            .frame(width: radi)
                            .offset(x: CGFloat(point[0]) * circleW, y: CGFloat(point[1]) * circleH)
                    }else {
                        Image("grape_disabled")
                            .resizable()
                            .scaledToFit()
                            .frame(width: radi)
                            .offset(x: CGFloat(point[0]) * circleW, y: CGFloat(point[1]) * circleH)
                    }
                }
            }
            Image("grapevine")
                .resizable()
                .frame(width:72,height:75)
                .offset(x:45,y:-150)
        }
    }
}

struct GrapeView_Previews: PreviewProvider {
    static var previews: some View {
        GrapeView()
    }
}
