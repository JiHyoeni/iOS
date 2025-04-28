//
//  MyScrollView.swift
//  SwiftUIApp
//
//  Created by 박지현 on 4/28/25.
//

import SwiftUI

struct MyScrollView: View {
    var body: some View {
        VStack{
            ScrollView(.horizontal) {
                HStack {
                    Text("1")
                        .frame(width: 300, height: 100)
                        .background(.red)
                    Text("2")
                        .frame(width: 300, height: 100)
                        .background(.orange)
                    Text("3")
                        .frame(width: 300, height: 100)
                        .background(.yellow)
                }
            }
            .background(.gray)
            .scrollIndicators(.hidden)
            .padding(10)
            
            ScrollView(){
                VStack(alignment: .trailing) {
                    Text("1")
                        .frame(width: 300, height: 100)
                        .background(.red)
                    Text("2")
                        .frame(width: 300, height: 100)
                        .background(.orange)
                    Text("3")
                        .frame(width: 300, height: 100)
                        .background(.yellow)
                }
            }
            .scrollIndicators(.visible)
            
            //Default: Vertical
            ScrollView(){
                HStack(alignment: .top) {
                    Text("1")
                        .frame(width: 300, height: 100)
                        .background(.red)
                    Text("2")
                        .frame(width: 300, height: 100)
                        .background(.orange)
                    Text("3")
                        .frame(width: 300, height: 100)
                        .background(.yellow)
                }
            }
        }

    }
}
struct MyScrollView_Preview: PreviewProvider {
    static var previews: some View {
        MyScrollView()
    }
}
