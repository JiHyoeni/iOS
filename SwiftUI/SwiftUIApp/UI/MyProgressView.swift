//
//  MyProgressView.swift
//  SwiftUIApp
//
//  Created by 박지현 on 4/28/25.
//

import SwiftUI
struct MyProgressView: View {
    var body: some View {
        VStack {
            ProgressView()
            ProgressView(value: 25, total: 100)
                .padding()
        }
    }
}
struct MyProgressView_Preview: PreviewProvider {
    static var previews: some View {
        MyProgressView()
    }
}
