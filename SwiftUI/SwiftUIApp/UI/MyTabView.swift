//
//  MyTabView.swift
//  SwiftUIApp
//
//  Created by 박지현 on 4/28/25.
//

import SwiftUI
struct MyTabView: View {
    @State var selection = 2
    var body: some View {
        TabView(selection: $selection) {
            TabView_1().tabItem {
                Image(systemName: "1.square")
                Text("tab 1")
            }
            .tag(0)
            TabView_2()
                .badge(2)
                .tabItem {
                Image(systemName: "2.square")
                Text("tab 2")
            }
            .tag(1)
            Text("tab 3 View").tabItem {
                Image(systemName: "3.square")
                Text("tab 3")
            }
            .tag(2)
        }
        .font(.headline)
    }
}
struct TabView_1: View {
    var body: some View {
        Text("tab 1 View")
    }
}
struct TabView_2: View {
    var body: some View {
        Text("tab 2 View")
    }
}

struct MyTabView_Preview: PreviewProvider {
    static var previews: some View {
        MyTabView()
    }
}

