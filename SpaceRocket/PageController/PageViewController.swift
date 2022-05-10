//
//  PageViewController.swift
//  SpaceRocket
//
//  Created by Ravil Khayretdinov on 10.05.2022.
//

import UIKit

class PageViewController: UIPageViewController, UIPageViewControllerDataSource {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.dataSource = self
    }
    
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        return nil
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        return nil
    }
}
