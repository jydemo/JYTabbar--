//
//  JYMainViewController.swift
//  JYTabbar-开眼
//
//  Created by atom on 2017/3/14.
//  Copyright © 2017年 atom. All rights reserved.
//

import UIKit

class JYMainViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        //delegate = self
        tabBar.addSubview(tabBarView)
        
    }
    
    fileprivate lazy var  tabBarView: JYMainTabView = { [unowned self] in
        var tabBiew = JYMainTabView.tabBarView()
        tabBiew.frame = self.tabBar.bounds
        tabBiew.delegate = self
        return tabBiew
    }()

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
extension JYMainViewController: UITabBarControllerDelegate {
    
}
extension JYMainViewController: JYMainTabViewDelegate {

    func tabBar(didSelector from: Int, to: Int, title: String) {
        self.selectedIndex = to
    }

}
