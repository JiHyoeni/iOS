//
//  MyImageView.swift
//  SwiftUIApp
//
//  Created by 박지현 on 4/28/25.
//
import SwiftUI

struct MyImageView: View {
    var body: some View {
        VStack {
            //aspectRatio(fit)
            Image("MyIcon")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 50)
                .background(.blue)
            Image(systemName: "bolt")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 50, height: 50)
                .background(.yellow)

            //aspectRatio(fill)
            Image("MyIcon")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 50, height: 100)
                .background(.blue)
            Image(systemName: "bolt")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 50, height: 100)
                .background(.yellow)
            //scaledToFit
            Image("MyIcon")
                .resizable()
                .scaledToFit()
                .frame(width: 100, height: 150)
                .background(.blue)
            Image(systemName: "bolt")
                .resizable()
                .scaledToFit()
                .frame(width: 50, height: 150)
                .background(.yellow)
            
            //scaledToFill
            Image("MyIcon")
                .resizable()
                .scaledToFill()
                .frame(width: 50, height: 100)
                .background(.blue)
           
            Image(systemName: "bolt")
                .resizable()
                .scaledToFill()
                .frame(width: 100, height: 100)
                .background(.yellow)
        }
    }
}

struct MyImageView_Preview: PreviewProvider {
    static var previews: some View {
        MyImageView()
    }
}
