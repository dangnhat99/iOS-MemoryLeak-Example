//
//  FirstExamViewModel.swift
//  SwiftExample
//
//  Created by Minh Nhat on 04/06/2023.
//

import Foundation
import RxRelay
import RxSwift

class ViewModel {
    var bag = DisposeBag()
    
    var data = PublishRelay<String>()
    
    func getDataImmediately() {
        //Demo an API Request
        print("FirstExamViewModel", "start get Data")
        
        DispatchQueue.main.async {
            self.data.accept("Mockup Data 1")
            print("FirstExamViewModel", "end get Data")
        }
    }
    
    func getDataWithLongWaitingTime() {
        //Demo an API Request
        print("FirstExamViewModel", "start get Data")
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) { [weak self] in
            guard let self = self else { return }
            self.data.accept("Mockup Data 2")
            print("FirstExamViewModel", "end get Data")
        }
    }
    
    init() {
        print("ViewModel", "init")
    }
    
    deinit {
        print("ViewModel", "deinit")
    }
}
