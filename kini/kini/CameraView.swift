//
//  CameraView.swift
//  kini
//
//  Created by qwd on 2023/06/12.
//

import SwiftUI

struct CameraView: View {
    @Environment(\.presentationMode) private var presentationMode : Binding <PresentationMode>
    var body: some View {
        ZStack{
            Color.yellow010.edgesIgnoringSafeArea(.all)
            Text("CameraView")
                .foregroundColor(Color.black)
                .navigationBarBackButtonHidden(true)
                .navigationBarItems(leading: Button(action : {
                    self.presentationMode.wrappedValue.dismiss()
                }){
                    Image(systemName: "multiply")
                        .foregroundColor(Color.navy)
                })
            
        }
    }
}

struct CameraView_Previews: PreviewProvider {
    static var previews: some View {
        CameraView()
    }
}


//import SwiftUI
//
//struct ContentView: View {
//
//    let count: Int = 5
//    let points: [[Int]] = [[1, 1], [3, 1], [0, 2], [2, 2], [4, 2], [1, 3], [3, 3], [2, 4]]
//
//    var body: some View {
//        GeometryReader { geometry in
//            let circleW = geometry.size.width/6
//            let circleH = geometry.size.height/6
//
//            let radi = sqrt(pow(circleW*2, 2) + pow(circleH*2, 2))/2
//
//            ForEach(Array(points.enumerated()), id: \.0) { index, point in
//                if index < 3 {
//                    Image(systemName: "circle")
//                        .resizable()
//                        .scaledToFit()
//                        .frame(width: radi)
//                        .offset(x: CGFloat(point[0]) * circleW, y: CGFloat(point[1]) * circleH)
//                } else if index < count {
//                    Image(systemName: "circle.circle")
//                        .resizable()
//                        .scaledToFit()
//                        .frame(width: radi)
//                        .offset(x: CGFloat(point[0]) * circleW, y: CGFloat(point[1]) * circleH)
//                } else {
//                    Image(systemName: "circle.fill")
//                        .resizable()
//                        .scaledToFit()
//                        .frame(width: radi)
//                        .offset(x: CGFloat(point[0]) * circleW, y: CGFloat(point[1]) * circleH)
//                }
//            }
//        }
//    }
//}
