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



