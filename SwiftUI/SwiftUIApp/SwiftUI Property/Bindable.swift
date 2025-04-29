//
//  BindableView.swift
//  SwiftUIApp
//
//  Created by 박지현 on 4/29/25.
//

import SwiftUI
@Observable class Book {
    var title: String
    init(title: String) {
        self.title = title
    }
}
struct BindableView: View {
    @Bindable var book = Book(title: "해리포터")
    @State var book2 = Book(title: "해리포터2")
    var body: some View {
        VStack {
            Text("\(book.title)")
            TextField("Title", text: $book.title)
                .padding()
            Text("\(book2.title)")
            TextField("Title", text: $book2.title)
                .padding()
        }
    }
}
struct BindableView_Preview: PreviewProvider {
    static var previews: some View{
        BindableView()
    }
}
