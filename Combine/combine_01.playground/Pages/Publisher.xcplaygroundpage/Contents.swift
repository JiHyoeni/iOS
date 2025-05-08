//MARK: Publisher
import Foundation
import UIKit
import Combine

//MARK: AnyPublisher, eraseToAnyPublisher
func publisher1() -> Publishers.Sequence<[Int], Never>  {
    let publisher = [1,2,3].publisher
    return publisher
}
publisher1()
    .sink { num in
        print(num)
    }

//func publisher2() -> URLSession.DataTaskPublisher {
//func publisher2() -> Publishers.MapKeyPath<URLSession.DataTaskPublisher, Data> {
func publisher2() -> AnyPublisher<Data, URLError> {
    let publisher = URLSession.shared.dataTaskPublisher(for: URL(string: "https://www.naver.com")!)
        .map(\.data)
        .eraseToAnyPublisher()
    return publisher
}
let subscribtion = publisher2()
    .sink { _ in
        
    } receiveValue: { data in
        print(data)
    }

//MARK: Publisher
/// 클래스 프로퍼티에 @Published를 사용하면 간단하게 퍼블리셔 생성
/// 해당 프로퍼티에 접근할 때 $ 붙여 퍼블리셔로 활용
class IntClass {
    @Published var value = 0
}

let intClass = IntClass()
intClass.$value
    .sink { value in
        print("value : ", value)
    }
//intClass.value = 100
//intClass.value = 1


//MARK: Convinience Publisher
    //MARK: Futrure
    let futureSubscription = Future<Data, Never> { promise in
        URLSession.shared.dataTask(with: URL(string: "https://www.naver.com")!) { data, response, error in
            if let data = data {
                promise(.success(data))
            }
        }.resume()
    }
    .sink { data in
        print("future data:", data)
    }



    //MARK: Empty, Fail 활용
    func fetchSite() -> AnyPublisher<Data, URLError> {
        guard let url = URL(string: "https://www.naver.com") else {
    //    guard let url = URL(string: "ht!tps://www.naver.com") else {
    //        return Empty<Data, URLError>()
    //            .eraseToAnyPublisher()
            return Fail<Data, URLError>(error: URLError(.badURL))
                .eraseToAnyPublisher()
        }
        
        let publisher = URLSession.shared.dataTaskPublisher(for: url)
            .map { (data: Data, response: URLResponse) in
                return data
            }
            .eraseToAnyPublisher()
        return publisher
    }

    let subscription = fetchSite()
        .sink { completion in
            switch completion {
            case .finished:
                print("완료")
            case .failure(let error):
                print("에러 발생 \(error)")
            }
        } receiveValue: { data in
            print(data)
        }
        


    //MARK: Fail
    enum MyError : Error {
        case ohMyGod
        case godness
    }

    var failPublisher = Fail<Int, MyError>(error: .ohMyGod)
    failPublisher
        .sink { completion in
            switch completion {
            case .finished:
                print("finished")   //Fail Publisher는 완료 되지 않기 때문에 메세지 출력이 안됨
            case .failure(let error):
                print("error : ", error)
            }
        } receiveValue: { int in
            print("value : ", int)  //Fail Publisher는 값을 방출하지 않기 때문에 메세지 출력이 안됨
        }



    //MARK: Empty
    //let emptyPublisher = Empty<Int, Never>()
    let emptyPublisher = Empty<Int, Never>(completeImmediately: false)  //complete 완료 하지 않음
    emptyPublisher
        .sink { completion in
            print(completion)
        } receiveValue: { int in
            print(int)
        }

    //MARK: Sequence Publisher - Just
    Just("안녕하세요")
        .sink { string in
            print(string)
        }

    //MARK: Sequence Publisher - Dictionary
    ["A": 1, "b": 2, "C": 3].publisher
        .sink { key, value in
            print("key : ", key, ", value : ", value)
        }

    //MARK: Sequence Publisher - Set
    Set([1,2,3]).publisher
        .sink { num in
            print(num)
        }

    //MARK: Sequence Publisher - Array
    [1,2,3].publisher
        .sink { completion in
            switch completion {
            case .finished :
                print("완료")
            case .failure(let error):
                print("error")
            }
        } receiveValue: { num in
            print(num)
        }

