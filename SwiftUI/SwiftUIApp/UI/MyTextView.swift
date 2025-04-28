//
//  MyTextView.swift
//  SwiftUIApp
//
//  Created by 박지현 on 4/28/25.
//
import SwiftUI
struct MyTextView: View {
    var body: some View {
        VStack {
            Text("Hello World")
                .padding(10)
                .frame(width: 100)
                .background(.yellow)
                .border(.black,width: 2)
                .cornerRadius(20)
            Text("Hello World")
                .padding(10)
                .frame(width: 100)
                .overlay(
                    RoundedRectangle(cornerRadius: 20)
                        .stroke(Color.black, lineWidth: 2)
                )
            Text("Hello World")
                .padding(10)
                .border(.black, width: 2)
                .frame(width: 100)
                .background(.red)
                .overlay(
                    RoundedRectangle(cornerRadius: 20)
                        .stroke(Color.black, lineWidth: 2)
                )
            Text("Hello World")
                .padding(10)
                .frame(width: 100)
                .background(.red)
                .clipShape(RoundedRectangle(cornerRadius: 20))
                .overlay(
                    RoundedRectangle(cornerRadius: 20)
                        .stroke(Color.black, lineWidth: 2)
                )
            
            Text("Hello World")
                .bold()
                .italic()
                .tag(0)
                .strikethrough()
            Text("Hello World")
                .underline(true, color: .orange)
                .foregroundColor(.blue)
                .font(.system(size: 30, weight: .bold, design: .monospaced))

        }
    }
}

struct MyTextView_Preview: PreviewProvider {
    static var previews: some View {
        MyTextView()
    }
}
