//
//  Constant.swift
//  SwiftUIApp
//
//  Created by 박지현 on 4/28/25.
//

import SwiftUI

struct ConstantView: View {
    ///Constant
    ///Binding을 만드는 가장 손쉬운 방법
    ///Binding.constant()보다는 .constant()형태로 많이 사용
    ///State변수와 달리 고정된 값이라 수정이 안됨
    ///상위뷰로부터 State 변수를 넘겨받기 힘든, Preview에서 주로 사용
    @Binding var number: Int
    var body: some View {
        VStack {
            Text("\(number)")
        }
    }
}

struct ConstantView_Previews: PreviewProvider {
    static var previews: some View {
        ConstantView(number: .constant(1))
    }
}
