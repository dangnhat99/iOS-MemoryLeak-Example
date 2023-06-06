//
//  ClosureExampleVC.swift
//  SwiftExample
//
//  Created by Minh Nhat on 04/06/2023.
//

import UIKit

class ClosureExampleVC: UIViewController {
    @IBOutlet weak var labelResult: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    init() {
        super.init(nibName: nil, bundle: nil)
        
        print("ClosureExampleVC", "init")
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    deinit {
        print("ClosureExampleVC", "deinit")
    }

    //escaping
    func getSumOfEscaping(numbers: [Int],  completion: @escaping (Int) -> Void) {
        var sum = 0
        
        for aNumber in numbers {
            sum += aNumber
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
            print("After 5 secs")
            completion(sum)
        }
    }
    
    //nonescaping
    func getSumOfNonEscaping(numbers: [Int], completion: (Int) -> Void) {
        var sum = 0
        
        for aNumber in numbers {
            sum += aNumber
        }
        
        completion(sum)
    }
    
    @IBAction func getSumNonEscapingTapped(_ sender: Any) {
        self.getSumOfNonEscaping(numbers: [1, 2, 3, 4, 5, 6]) { (result) in
            self.labelResult.text = "Sum is \(result)"
        }
    }
    
    @IBAction func getSumEscapingTapped(_ sender: Any) {
        self.labelResult.text = "Loading..."
        
        self.getSumOfEscaping(numbers: [1, 2, 3, 4, 5, 6]) { [weak self] result in
            guard let self = self else { return }
            
            self.labelResult.text = "Sum is \(result)"
        }
    }
}
