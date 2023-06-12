//
//  CameraView.swift
//  kini
//
//  Created by qwd on 2023/06/12.
//

import SwiftUI

struct CameraView: View {
    var body: some View {
        ZStack{
            Color.yellow010.edgesIgnoringSafeArea(.all)
            Button {
                print("button clicked")
            } label: {
                Image("camera_button")
            }
        }
    }
}

struct CameraView_Previews: PreviewProvider {
    static var previews: some View {
        CameraView()
    }
}
