//
//  EnvironmentObject.swift
//  SwiftUIApp
//
//  Created by 박지현 on 4/28/25.
//

import SwiftUI

struct EnvironmentObjectView: View {
    /// EnvironmentObject 비교
    ///  Observed Object
    ///   전달 방식
    ///    인자를 통한 직접 전달
    ///   사용 가능한 뷰
    ///    1세대 > 2세대 > 3세대 > 4세대 연결된 하위뷰에 전부 전달
    ///   용도
    ///    가까운 하위 뷰 전달에 적합
    ///  EnvironmentObject
    ///   전달 방식
    ///    View의 Environment를 통해 전달
    ///    (.environmentObject)사용
    ///   사용 가능한 뷰
    ///    1세대에서 넣은 데이터를 하위뷰 어디서나 사용 가능
    ///   용도
    ///    앱 전반에 걸쳐 사용되는 데이터 전달에 적합
    @State var text: String = ""
    @ObservedObject var numberCounter = NumberCounter()
    
    var body: some View{
        VStack {
            TextField("글자를 입력해주세요.", text: $text)
                .padding()
            ChildView3(number: NumberCounter.init())
                .environmentObject(numberCounter)
        }
    }
}

struct ChildView3: View {
    @ObservedObject var number: NumberCounter
    var body: some View {
        VStack {
            Text("childView3 : \(number.number)")
            ChildView4()

        }
    }
}
struct ChildView4: View {
    @EnvironmentObject var number: NumberCounter
    var body: some View {
        VStack {
            Text("childView4 : \(number.number)")
            Text("\(self.number.number)")
            
            Button {
                self.number.increaseNumber()
            } label: {
                Text("click")
            }

        }
    }
}
struct EnvironmentObjectView_Preview: PreviewProvider {
    static var previews: some View {
        EnvironmentObjectView()
    }
}
