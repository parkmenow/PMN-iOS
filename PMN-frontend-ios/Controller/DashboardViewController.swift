//
//  DashboardViewController.swift
//  PMN-frontend-ios
//
//  Created by bharath on 2019/02/16.
//  Copyright © 2019 bharath. All rights reserved.
//

import UIKit

class DashboardViewController: UIViewController {

    struct Input {
        var name: String?
    }
    
    var state: Input
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    init(input: Input) {
        self.state = input
        super.init(nibName: "DashboardViewController", bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func input(_ input: Input) {
        state = input
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
