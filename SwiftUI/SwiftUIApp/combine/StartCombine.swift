//
//  StartCombine.swift
//  SwiftUIApp
//
//  Created by 박지현 on 4/30/25.
//

///combine장점
/// 비동기 코드의 가독성 향상(콜백헬 방지)_
/// 에러 처리의 용이성
/// 복잡한 비동기 시나리오의 간편한 구현
/// SwiftUI와의 원활한 통합을 통한 반응형 UI구현
///
/// Reactive Programming
/// 정의 :
///  컴퓨팅에서 리액티브 프로그래밍은 데이터 스트림과 변화의 전파에 관련된 선언적 프로그래밍 패러다임입니다.
///  Reactive programming은 이벤트가 발생하기를 기다리는 대신 데이터와 이벤트의 변화에 반응하는 개념을 중심으로 하는 프로그래밍 패러다임 또는 모델입니다.
///  combine프레임워크는 시간이 지남에 따라 값을 처리하기 위한 선언적 Swift API를 제공합니다. 이러한 값들은 다양한 종류의 비동기 이벤트를 나타낼 수 있습니다.
///  Comvine은 시간이 지남에 따라 변경될 수 있는 값을 노출하는 퍼블리셔를 선언하고 퍼블리셔로부터 해당 값을 수신하는 습스크라이버를 선언합니다.
/// combine : 애플이 만듬, 뛰어난 속도
/// RxSwift : 오픈소스, 다양한 기능
///
/// Observable -> Publisher
/// Operator -> Operator
/// Observer -> Subscriber
/// Subject -> Subject
///
///


//no Combine, 일반적인 비동기 코드(completion handler)
//import Foundation
//
//struct CatFact: Decodable {
//    let fact: String
//    let length: Int
//}
//
//func fetchCatFact(completion: @escaping (CatFact) -> Void) {
//    let url = URL(string: "https://catfact.ninja/fact")!
//
//    let task = URLSession.shared.dataTask(with: url) { data, response, error in
//        //에러 처리 코드 생략
//        let decoder = JSONDecoder()
//        let catFact = try! decoder.decode(CatFact.self, from: data!)
//        completion(catFact)
//    }
//    task.resume()
//}
//print("run")
//fetchCatFact { catFactString in
//    DispatchQueue.main.async {
//        //뷰에 데이터 장착하는 부분
//        print(catFactString)
//    }
//}



//컴바인 적용 후
import Foundation
import Combine

struct CatFact: Decodable {
    let fact: String
    let length: Int
}
//func fetchCatFactPublisher() -> AnyPublisher<CatFact, Error> {
//    let url = URL(string: "https://catfact.ninja/fact")!
//
//    return URLSession.shared.dataTaskPublisher(for: url)
//        .map { (data: Data, response: URLResponse) in //map하면 자동으로 어떤 인자가 들어오는지 보임
//            return data
//        }
//        .decode(type: CatFact.self, decoder: JSONDecoder())
//        .receive(on: DispatchQueue.main)
//        .eraseToAnyPublisher()
//}
//
//
//let subscription = fetchCatFactPublisher()
//    .sink { completion in //얘는 컴플리션 핸들러가 아님
//        print(completion) //제대로 완료되었는지, 에러가 났는지 알려줌, 위치가 좀 이상하긴함
//    } receiveValue: { catFact in
//        //뷰에 데이터 장착하는 부분
//        print(catFact)
//    }
//
let url = URL(string: "https://catfact.ninja/fact")!
let subscription = URLSession.shared.dataTaskPublisher(for: url) //publisher : 값을 쏴주는 경보기
    .map { (data, response) in
        return data
    }
//MARK: decode
//    .map { data in
//        let decoder = JSONDecoder()
//        let catFact = try! decoder.decode(CatFact.self, from: data)
//        return catFact
//    }
    .decode(type: CatFact.self, decoder: JSONDecoder())
    .receive(on: DispatchQueue.main)

    //MARK: complete
//    .sink { completion in
//        switch completion {
//        case .finished:
//            print("정상 완료")
//        case .failure(let error):
//            print("error : \(error)")
//        }
//    } receiveValue: { data, response in
//        let decoder = JSONDecoder()
//        let catFact = try! decoder.decode(CatFact.self, from: data)
//        DispatchQueue.main.async {
//            print("data : \(catFact)")
//        }
//    }
    .sink { completion in
        switch completion {
        case .finished:
           print("정상 완료")
        case .failure(let error):
           print("error : \(error)")
        }
    } receiveValue: { data in
        print(data)
    }

