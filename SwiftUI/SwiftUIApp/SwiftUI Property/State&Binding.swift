//
//  Inflearn.swift
//  SwiftUIApp
//
//  Created by 박지현 on 4/25/25.
//

import SwiftUI

struct InflearnView: View {
    @State var word = ""
    @State var number = 0
    var body: some View {
        ///Preview 화면 cmd+option+enter
        ///Preview 실행 cmd+option+p
        ///
        ///@State
        ///state로 선언된 변수를 변경했을때, 이 변수를 가져다 쓴 뷰를 다시 그림
        ///뷰가 포함된 body 전체를 다시 그림
        ///
        ///@State의 단점
        ///@State는 값다입의 변수만 감지 가능
        /// Int, String, Bool + Enum, Struct
        /// 참조타입의 변수는 감지 불가능(클래스)
        /// 클래스를 감지하기 위해서는 Observable 3ObservableObject, @Published, @ObservedObject가 필요
    
        Text("\(number)")
        Button {
            number += 1
        } label: {
            Text("plus1")
        }
        SubView(number: $number)
        
        Text("\(word)")
            .padding()
        TextField(/*@START_MENU_TOKEN@*/"Placeholder"/*@END_MENU_TOKEN@*/, text: $word)
            .padding()
    }
}
struct SubView: View {
    @Binding var number: Int
    ///기본적으로 전달받은 곳에서 State 변수 수정불가
    ///전달받은 곳에서 수정하고 싶다면 Binding으로 변환해서 전달해주기
    ///넘겨주는 곳에서 $, 받는곳에서 @Binding
    ///이를 2-way connection 혹은 2-way binding이라고 부름
    ///
    ///$(Projected value)
    ///@State, @Binding과 같은 프로퍼티 래퍼는 확장 기능을 제공해줌
    ///프로퍼티의 래퍼가 제공해주는 기능중 Projected Value라는 기능이 있음
    ///$를 이용해서 사용함
    ///프로퍼티 래퍼를 통해 저장된 값을 지정된 방법으로 반환시켜줌
    ///이때 반환되는 값은 아무타입이나 상관없는데, 이 기능을 통해 @State프로퍼티 래퍼는 ProjectedValue를 통해 Binding으로 변환해서 반환시켜줌
    var body: some View {
        Text("\(number)")
        Button {
            number += 1
        } label: {
            Text("plus2")
        }
    }
}
#Preview {
    InflearnView()
        .previewInterfaceOrientation(.portrait)
}

