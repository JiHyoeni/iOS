//
//  ObservableObject.swift
//  SwiftUIApp
//
//  Created by 박지현 on 4/28/25.
//
import SwiftUI

/// ObservableObject
class NumberCounter: ObservableObject {
    @Published var number: Int = 0
    
    func increaseNumber() {
        number += 1
    }
}

struct ObservableObjectView: View {
    /// Observable
    /// ObservableObject 프로토콜 : 감지되어야 할 클래슨에 붙혀줌
    /// Published : 감지되어야 할 프로퍼티에 붙혀줌
    /// ObservedObject : 클래스의 인스턴스를 생성할 때 붙혀줌
    @State var text: String = ""
    var body: some View{
        VStack {
            TextField("글자를 입력해주세요.", text: $text)
                .padding()
            ChildView()
        }
    }
}

struct ChildView: View {
    @ObservedObject var numberCounter = NumberCounter()
    var body: some View {
        VStack {
            Text("\(self.numberCounter.number)")
            
            Button {
                self.numberCounter.increaseNumber()
            } label: {
                Text("click")
            }

        }
    }
}


struct ObservableObjectView_Preview: PreviewProvider {
    static var previews: some View{
        ObservableObjectView()
    }
}
