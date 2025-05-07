//
//  studyPublisher.swift
//  SwiftUIApp
//
//  Created by 박지현 on 5/2/25.
//

///Publisher 종류
/// Foundation built-in Publisher
///  - URLSession, Timer, NotificationCenter
/// @Published
/// Convenience Publisher
///  - SequencePublishers, Just, Fail, Empty, Future...
/// Subject

//MARK: NotificationCenter
import Foundation
import UIKit
import Combine

class ViewController: UIViewController {
    var cancellables = Set<AnyCancellable>()
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        // 디바이스 방향 변경 알림을 옵저버로 등록
        super.viewWillAppear(animated)
        NotificationCenter.default.publisher(for: UIDevice.orientationDidChangeNotification)
            .sink { _ in
                self.handleOrientationChange()
            }
            .store(in: &cancellables)
    }

//    @objc
    func handleOrientationChange() {
        switch UIDevice.current.orientation {
        case .portrait:
            print("Portrait")
        case .landscapeLeft, .landscapeRight:
            print("Landscape")
        case .portraitUpsideDown:
            print("Upside Down")
        default:
            print("Unknown")
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        cancellables.removeAll()
    }
    
   
}

