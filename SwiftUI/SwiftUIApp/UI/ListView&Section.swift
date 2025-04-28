//
//  ListView&Section.swift
//  SwiftUIApp
//
//  Created by 박지현 on 4/28/25.
//

import SwiftUI

struct MyListView: View {
    var body: some View {
        /*
        List {
            Section {
              HStack {
                  Image(systemName: "heart")
                  Text("heart")
              }
              Spacer()
              HStack {
                  Image(systemName: "heart.fill")
                  Text("heart.fill")
              }
            } header: {
              Text("a group")
            }
            
            Spacer()
            Section {
              HStack {
                  Image(systemName: "bolt")
                  Text("bolt")
              }
              Spacer()
              HStack {
                  Image(systemName: "bolt.fill")
                  Text("bolt.fill")
              }
            } header: {
              Text("B group")
            }
        }
*/
        
        NavigationView {
            List {
                ForEach(list, id: \.self) { item in
                  Text(item)
                }
                .onDelete { list.remove(atOffsets: $0) }
                .onMove { list.move(fromOffsets: $0, toOffset: $1)}
            }
            .navigationTitle("numbers")
            .toolbar {
                EditButton()
            }
        }
    }
    @State var list = ["1", "2", "3", "4", "5"]
}

struct MyListView_Preview: PreviewProvider {
    static var previews: some View {
        MyListView()
    }
}

