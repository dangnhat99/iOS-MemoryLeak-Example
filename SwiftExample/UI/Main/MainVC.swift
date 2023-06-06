//
//  MainVC.swift
//  SwiftExample
//
//  Created by Minh Nhat on 04/06/2023.
//

import UIKit

class MainVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func btnClosureExamTapped(_ sender: Any) {
        self.navigationController?.pushViewController(ClosureExampleVC(), animated: true)
    }
    
    @IBAction func btnMemoryLeakTapped(_ sender: Any) {
        self.navigationController?.pushViewController(MemoryLeakExamVC(), animated: true)
    }
}
