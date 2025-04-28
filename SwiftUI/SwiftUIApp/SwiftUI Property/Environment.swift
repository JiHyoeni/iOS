//
//  Environment.swift
//  SwiftUIApp
//
//  Created by 박지현 on 4/28/25.
//
import SwiftUI
struct EnvironmentView : View {
    /// @EnvironmentObject vs @Environment
    ///  @EnvironmentObject
    ///   사용방식
    ///    ObservableObject데이터를 직접 Environment에 넣어줌
    ///   용도
    ///    개발자가 만든 데이터를 하위뷰에 전달할때 사용
    ///  @Environment
    ///   사용방식
    ///    이미 Environment에 저장되어 있는 값들을 사용함 (개발자가 넣어주는 것도 가능함)
    ///   용도
    ///    앱 시스템 전반에 걸쳐 사용되는 설정에 접근할 때 사용

    @Environment(\.colorScheme) var colorScheme
    @Environment(\.locale) var locale
    var body: some View {
        VStack {
            Text("Hello, World!")
                .padding()
                .background(colorScheme == .dark ? Color.black : Color.white)
                .foregroundColor(colorScheme == .dark ? Color.white : Color.black)
            Text("Locale \(locale)")
        }
    }
}

struct EnvironmentView_Preview: PreviewProvider {
    static var previews: some View {
         EnvironmentView()
    }
}
