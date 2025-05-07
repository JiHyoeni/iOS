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
print("start")
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

