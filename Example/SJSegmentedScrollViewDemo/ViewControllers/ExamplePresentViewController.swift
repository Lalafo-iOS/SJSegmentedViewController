//
//  ExamplePresentViewController.swift
//  SJSegmentedScrollViewDemo
//
//  Created by Subins on 25/11/16.
//  Copyright © 2016 CocoaPods. All rights reserved.
//

import UIKit
import SJSegmentedScrollView

class ExamplePresentViewController: UIViewController {

	@IBAction func present(_ sender: AnyObject) {

		if let storyboard = self.storyboard {

			let headerViewController = storyboard
				.instantiateViewController(withIdentifier: "PresentHeader")

			let firstViewController = storyboard
				.instantiateViewController(withIdentifier: "FirstTableViewController")
			firstViewController.title = "First"

			let secondViewController = storyboard
				.instantiateViewController(withIdentifier: "SecondViewController")
			secondViewController.title = "Second"

			let segmentController = SJSegmentedViewController(headerViewController: headerViewController, segmentControllers: [])
            _ = segmentController.view
			segmentController.segmentControllers = [firstViewController,
			                                        secondViewController]
			segmentController.headerViewHeight = 200.0
			segmentController.headerViewOffsetHeight = 31.0
            segmentController.segmentTitleColor = .lightGray
            segmentController.segmentSelectedTitleColor = .black
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                segmentController.setSelectedSegmentAt(1, animated: false)
            }
            
            present(segmentController, animated: true, completion: nil)
		}
	}
}
