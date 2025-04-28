//
//  MyShape.swift
//  SwiftUIApp
//
//  Created by 박지현 on 4/29/25.
//

import SwiftUI
struct MyShape: View {
    var body: some View {
        VStack {
            Capsule(style: RoundedCornerStyle.circular)
                .foregroundColor(.yellow)
                .frame(height: 100)
            
            Image("MyIcon")
                .resizable()
                .frame(width: 100, height: 100)
                .background(.red)
                .aspectRatio(contentMode: .fit)
                .clipShape(Circle())
            Image("MyIcon")
                .resizable()
                .frame(width: 100, height: 100)
                .background(.red)
                .aspectRatio(contentMode: .fit)
            RoundedRectangle(cornerRadius: 30)
                .foregroundColor(.green)
                .frame(width: 100, height: 100)
                .background(.gray)
        }
    }
}
struct MyShape_Preview: PreviewProvider {
    static var previews: some View {
        MyShape()
    }
}
