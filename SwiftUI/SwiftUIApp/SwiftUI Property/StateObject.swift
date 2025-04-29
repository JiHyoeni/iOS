//
//  StateObject.swift
//  SwiftUIApp
//
//  Created by 박지현 on 4/28/25.
//
import SwiftUI
struct StateObjectView: View {
    /// @State vs Observable
    /// 공통점 : 변수의 변화를 감지해서 뷰를 자동으로 업데이트함
    /// 차이점
    ///  : 값타입 변수 -> State
    ///  : 참조타입 변수 감지 -> ObservableObject, @Published, @ObservedObject
    ///
    ///  Observable 단점
    ///   뷰가 재생성될 때 뷰안의 선언된 ObservedObject 또한 재생성 되어서 데이터가 초기화 될 수 있음
    ///   참고로 state는 swiftUi가 따로 관리해주어서 문제가 생기지 않음
    ///    방법 1.  @ObservedObject -> @StateObject로 변경
    ///     뷰의 재생성과 상관없이 클래스의 인스턴스가 소멸, 재생성되지 않음
    ///     인스턴스가 계속 존재함
    ///    방법 2. 뷰가 갖고 있던 @ObservedObject를 상위 뷰로 옮기기
    ///     뷰가 재생성되더라도 데이터가 상위에 존재하기 때문에 재생성되지 않음
    @State var text: String = ""
    
    var body: some View{
        VStack {
            TextField("글자를 입력해주세요.", text: $text)
                .padding()
            ChildView2()
            ChildView2_2()
        }
    }
}

struct ChildView2: View {
    @StateObject var number = NumberCounter()
    var body: some View {
        VStack {
            Text("\(self.number.number)")
            
            Button {
                self.number.increaseNumber()
            } label: {
                Text("click")
            }

        }
    }
}
struct ChildView2_2: View {
    @State var number = NumberCounter_2()
    var body: some View {
        VStack {
            Text("\(self.number.number)")
            
            Button {
                self.number.increaseNumber()
            } label: {
                Text("click")
            }
        }
    }
}
struct StateObjectView_Preview: PreviewProvider {
    static var previews: some View {
        StateObjectView()
    }
}
