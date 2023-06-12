//
//  TextModifier.swift
//  kini
//
//  Created by jaelyung kim on 2023/06/10.
//

import SwiftUI

struct TextModifier: View {
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
            .modifier(XXSRegularGrayTextModifier())
    }
}

struct XXXLBoldNavyTextModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.system(size: 28))
            .fontWeight(.bold)
            .foregroundColor(Color.navy)
    }
}

struct XXLBoldNavyTextModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.system(size: 22))
            .fontWeight(.bold)
            .foregroundColor(Color.navy)
    }
}

struct XLBoldNavyTextModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.system(size: 19))
            .fontWeight(.semibold)
            .foregroundColor(Color.navy)
    }
}

struct LSemiboldNavyTextModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.system(size: 17))
            .fontWeight(.semibold)
            .foregroundColor(Color.navy)
    }
}

struct MSemiboldNavyTextModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.system(size: 16))
            .fontWeight(.semibold)
            .foregroundColor(Color.navy)
    }
}

struct MRegularNavyTextModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.system(size: 16))
            .fontWeight(.regular)
            .foregroundColor(Color.navy)
    }
}

struct SRegularNavyTextModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.system(size: 15))
            .fontWeight(.regular)
            .foregroundColor(Color.navy)
    }
}

struct XSSemiboldNavyTextModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.system(size: 13))
            .fontWeight(.semibold)
            .foregroundColor(Color.navy)
    }
}

struct XSSemiboldBlackTextModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.system(size: 13))
            .fontWeight(.semibold)
            .foregroundColor(Color.black)
    }
}

struct XSRegularBlackTextModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.system(size: 13))
            .fontWeight(.regular)
            .foregroundColor(Color.black)
    }
}

struct XSRegularGrayTextModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.system(size: 13))
            .fontWeight(.regular)
            .foregroundColor(Color(red: 0.51, green: 0.51, blue: 0.51)) //#828282
    }
}

struct XXSRegularNavyTextModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.system(size: 12))
            .fontWeight(.regular)
            .foregroundColor(Color.navy)
    }
}

struct XXSRegularGrayTextModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.system(size: 12))
            .fontWeight(.regular)
            .foregroundColor(Color.gray020)
            .opacity(0.61)
    }
}

struct XXSMediumNavyTextModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.system(size: 12))
            .fontWeight(.medium)
            .foregroundColor(Color.navy)
    }
}

struct TextModifier_Previews: PreviewProvider {
    static var previews: some View {
        TextModifier()
    }
}
