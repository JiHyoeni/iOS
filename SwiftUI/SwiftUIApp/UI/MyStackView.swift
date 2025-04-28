//
//  Untitled.swift
//  SwiftUIApp
//
//  Created by 박지현 on 4/28/25.
//

import SwiftUI

struct MyStackView: View {
    var body: some View {
        HStack(alignment: .center){
            Text("1")
            Text("2")
            Text("3")
            Divider()
                .frame(height: 30)
                .background(.black)
            VStack(alignment: .leading, spacing: 50) {
                Text("4")
                Divider()
                    .frame(width: 60, height: 10)
                    .background(.red)
                Text("5")
            }
            ZStack {
                Color.blue
                    .frame(width: 100, height: 100)
                Text("678")
            }
        }
    }
}

struct MyStackView_Preview: PreviewProvider {
    static var previews: some View {
        MyStackView()
    }
}
