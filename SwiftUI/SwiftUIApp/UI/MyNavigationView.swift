//
//  MyNavigationView.swift
//  SwiftUIApp
//
//  Created by 박지현 on 4/28/25.
//
import SwiftUI

struct MyNavigationView: View {
    var body: some View {
        VStack{
            NavigationStack {
                NavigationLink(destination: Text("a")) { Text("1") }
                NavigationLink(value: "b") {
                    Text("2").navigationDestination(for: String.self, destination: { value in
                        Text(value)
                        
                    })
                }
                NavigationLink(value: 3) {
                    Text("3").navigationDestination(for: Int.self, destination: { value in
                        Text("\(value*value)")
                        
                    })
                }
                .navigationTitle("navigationTitle")
            }
        }
    }
}
struct MyNavigationView_Preview: PreviewProvider {
    static var previews: some View {
        MyNavigationView()
    }
}
