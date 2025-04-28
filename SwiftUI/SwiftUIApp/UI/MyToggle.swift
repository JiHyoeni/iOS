//
//  MyToggle.swift
//  SwiftUIApp
//
//  Created by 박지현 on 4/28/25.
//
import SwiftUI

struct MyToggle: View {
    @State var isOn: Bool = false
    var body: some View {
        Toggle(isOn: $isOn) {
            if isOn {
                Text("Light On")
            } else {
                Text("Light Off")
            }
        }
        .padding()
        .toggleStyle(.switch)
        .tint(.red)
    }
}
struct MyToggle_Preview: PreviewProvider {
    static var previews: some View {
        MyToggle()
    }
}
