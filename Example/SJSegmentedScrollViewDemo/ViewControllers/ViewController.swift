//
//  ViewController.swift
//  SJSegmentedScrollView
//
//  Created by Subins Jose on 06/10/2016.
//  Copyright © 2016 Subins Jose. All rights reserved.
//

import UIKit
import SJSegmentedScrollView

class ViewController: UIViewController {
    
    let segmentedViewController = SJSegmentedViewController()
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.title = "Segment"
    }
    
    //MARK:- Private Function
    //MARK:-
    
    func getSJSegmentedViewController() -> SJSegmentedViewController? {
        
        if let storyboard = self.storyboard {
            
            let headerViewController = storyboard.instantiateViewController(withIdentifier: "HeaderViewController1")

            let firstViewController = storyboard.instantiateViewController(withIdentifier: "FirstTableViewController")
            firstViewController.title = "Table View"
            
            let secondViewController = storyboard.instantiateViewController(withIdentifier: "SecondViewController")
            secondViewController.title = "Custom View"
            
            let thirdViewController = storyboard.instantiateViewController(withIdentifier: "ThirdViewController")
            thirdViewController.title = "View"

			let fourthViewController = storyboard.instantiateViewController(withIdentifier: "CollectionViewIdentifier")
			fourthViewController.title = "Collection View"
            
            segmentedViewController.headerViewController = headerViewController
            segmentedViewController.segmentControllers = [firstViewController, secondViewController, thirdViewController, fourthViewController]
            segmentedViewController.headerViewHeight = 200
            return segmentedViewController
        }
        return nil
    }
    
    //MARK:- Actions
    //MARK:-
    @IBAction func presentViewController() {
        if let viewController = getSJSegmentedViewController() {
            self.present(viewController, animated: true, completion: nil)
        }
    }
    
    @IBAction func pushViewController() {
        if let viewController = getSJSegmentedViewController() {
            self.navigationController?.pushViewController(viewController, animated: true)
        }
    }
    
    @IBAction func adddChildViewController() {
        if let viewController = getSJSegmentedViewController() {
            addChildViewController(viewController)
            self.view.addSubview(viewController.view)
            viewController.view.frame = self.view.bounds
            viewController.didMove(toParentViewController: self)
        }
    }
}
