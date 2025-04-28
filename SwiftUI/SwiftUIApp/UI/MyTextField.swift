//
//  MyTextField.swift
//  SwiftUIApp
//
//  Created by 박지현 on 4/28/25.
//
import SwiftUI
struct MyTextField: View  {
    @State var id: String = ""
    @State var pw: String = ""
    @State var isShowPw: Bool = false
    
    @State private var myMoney: Double? = 300.0
    var body: some View {
        VStack {
            HStack {
                Image(systemName: "person.fill")
                
                TextField("id", text: $id)
                    .textFieldStyle(.roundedBorder)
                
            }
            .padding()
            
            HStack {
                Image(systemName: "lock")
                
                if isShowPw {
                    TextField("password", text: $pw)
                        .textFieldStyle(.roundedBorder)
                } else {
                    SecureField("password", text: $pw)
                        .textFieldStyle(.roundedBorder)
                }
                Button(action: {
                    isShowPw.toggle()
                }, label: {
                    Image(systemName: "eye")
                })
            }
            .padding()
            
            TextField(
                "Currency (USD)",
                value: $myMoney,
                format: .currency(code: "USD")
            )
            .onChange(of: myMoney) { oldValue, newValue in
                print ("preMoney: \(oldValue)")
                print ("myMoney: \(newValue)")
            }
            .padding()
            
        }
    }
}

struct MyTextField_Preview: PreviewProvider {
    static var previews: some View {
        MyTextField()
    }
}
