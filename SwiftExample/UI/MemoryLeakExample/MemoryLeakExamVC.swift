//
//  FirstExamVC.swift
//  SwiftExample
//
//  Created by Minh Nhat on 04/06/2023.
//

import UIKit
import RxSwift

class MemoryLeakExamVC: UIViewController {
    @IBOutlet weak var labelData: UILabel!
    let bag = DisposeBag()
    let viewModel = ViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        bindViewModel()
    }
    
    init() {
        super.init(nibName: nil, bundle: nil)
        
        print("MemoryLeakExamVC", "init")
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func bindViewModel() {
        //Has weak self case
        self.viewModel.data.subscribe(onNext: { [weak self] data in
            guard let self = self else { return }
            
            self.labelData.text = data
        }).disposed(by: bag)
        
        //Doesn't have weak self case
//        self.viewModel.data.subscribe(onNext: {data in
//            self.labelData.text = data
//        }).disposed(by: bag)
    }
    
    @IBAction func btnGetDataImmediatelyTapped(_ sender: Any) {
        viewModel.getDataImmediately()
    }
    
    @IBAction func btnGetDataLongWaitingTimeTapped(_ sender: Any) {
        viewModel.getDataWithLongWaitingTime()
    }
    
    deinit {
        print("FirstExamVC", "deinit")
    }
}
