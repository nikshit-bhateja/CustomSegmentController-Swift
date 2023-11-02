//
//  ViewController.swift
//  CustomSegmentController
//
//  Created by Nikk Bhateja on 02/11/23.
//

import UIKit

class ViewController: UIViewController {

    //MARK: - View life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.configureSegmentController()
    }

    //MARK: - custom methods.
    private func configureSegmentController() {
        let buttonTitles = ["Standard", "Live", "Unsplash"]
        let segmentController = CustomSegmentView(frame: CGRect(x: 0,
                                                                y: 50,
                                                                width: self.view.frame.width,
                                                                height: 50),
                                                  buttonTitles: buttonTitles)
        segmentController.backgroundColor = .clear
        self.view.addSubview(segmentController)
    }
    
}

