//
//  ButtonModifier.swift
//  kini
//
//  Created by jaelyung kim on 2023/06/10.
//

import SwiftUI

struct ButtonModifier: View {
    var body: some View {
        Button("텍스트") {
            
        }.modifier(LongButtonIsSelectedModifier(isSelected: true))
    }
}

struct ShortButtonDisabledModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .frame(width: 170, height: 50)
            .background(Color.yellow020)
            .foregroundColor(.navy)
            .font(.system(size:17, weight: .semibold))
            .cornerRadius(15)
            
    }
}

struct ShortLongButtonAbledModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .frame(width: 170, height: 50)
            .background(Color.yellow030)
            .foregroundColor(.navy)
            .font(.system(size:17, weight: .semibold))
            .cornerRadius(15)
            
    }
}

struct LongButtonDisabledModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .frame(width: 350, height: 50)
            .background(Color.yellow020)
            .foregroundColor(.navy)
            .font(.system(size:17, weight: .semibold))
            .cornerRadius(15)
            
    }
}

struct LongButtonAbledModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .frame(width: 350, height: 50)
            .background(Color.yellow030)
            .foregroundColor(.navy)
            .font(.system(size:17, weight: .semibold))
            .cornerRadius(15)
            
    }
}

struct LongButtonIsSelectedModifier: ViewModifier {
    let isSelected: Bool
    
    func body(content: Content) -> some View {
        if(isSelected) {
            content
                .frame(width: 350, height: 50)
                .background(Color.yellow030)
                .foregroundColor(.navy)
                .font(.system(size:17, weight: .semibold))
                .cornerRadius(15)
                .shadow(color: Color.shadow, radius: 6, x: 0, y: 4)
        } else {
            content
                .frame(width: 350, height: 50)
                .background(Color.yellow020)
                .foregroundColor(.navy)
                .font(.system(size:17, weight: .semibold))
                .cornerRadius(15)
        }
        
            
    }
}

struct PopUpButtonModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .frame(width: 322, height: 50)
            .background(Color.yellow030)
            .foregroundColor(.navy)
            .font(.system(size:17, weight: .semibold))
            .cornerRadius(15)
            
    }
}

struct Select2GridButtonAbledModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .frame(width:170, height: 178)
            .background(Color.yellow020)
            .cornerRadius(8)
    }
}

struct Select2GridButtonDisabledModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .frame(width:170, height: 178)
            .background(Color.white)
            .cornerRadius(8)

    }
}

struct Select2GridButtonIsSelectedModifier: ViewModifier {
    let isSelected: Bool
    
    func body(content: Content) -> some View {
        if(isSelected) {
            content
                .frame(width:170, height: 178)
                .background(Color.yellow030)
                .cornerRadius(8)
                .shadow(color: Color.shadow, radius: 6, x: 0, y: 4)
        } else {
            content
                .frame(width:170, height: 178)
                .background(Color.white)
                .cornerRadius(8)
        }
    }
}

struct Select3GridButtonAbledModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .frame(width:110, height: 140)
            .background(Color.yellow020)
            .cornerRadius(8)
    }
}

struct Select3GridButtonDisabledModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .frame(width:110, height: 140)
            .background(Color.white)
            .cornerRadius(8)

    }
}

struct ButtonModifier_Previews: PreviewProvider {
    static var previews: some View {
        ButtonModifier()
    }
}
