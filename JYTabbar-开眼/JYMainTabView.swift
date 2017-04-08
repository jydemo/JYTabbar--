//
//  JYMainTabView.swift
//  JYTabbar-开眼
//
//  Created by atom on 2017/3/14.
//  Copyright © 2017年 atom. All rights reserved.
//

import UIKit

protocol JYMainTabViewDelegate {
    func tabBar(didSelector from: Int, to: Int, title: String)
}

class JYMainTabView: UIView {

    @IBOutlet weak var choiceButton: UIButton!
    @IBOutlet weak var discoverButton: UIButton!
    @IBOutlet weak var selectorButton: UIButton!
    private var selectedButton: UIButton!
    var delegate: JYMainTabViewDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.bringSubview(toFront: choiceButton)
        self.bringSubview(toFront: discoverButton)
        self.bringSubview(toFront: selectorButton)
        
        setup(ButtonFont: choiceButton)
        setup(ButtonFont: discoverButton)
        setup(ButtonFont: selectorButton)
        selectedButton = choiceButton
    }
    
    class func tabBarView() -> JYMainTabView {
        
        return Bundle.main.loadNibNamed("JYMainTabView", owner: nil, options: nil)?.first as! JYMainTabView
    }
    
    fileprivate func setup(ButtonFont button: UIButton){
        button.setTitleColor(UIColor.lightGray, for: .normal)
        button.setTitleColor(UIColor.black, for: [.highlighted, .selected])
    }
    
    fileprivate func setup(selectButton button: UIButton) {
        guard selectedButton != button  else {
            return
        }
        selectedButton.isSelected = false
        button.isSelected = true
        delegate?.tabBar(didSelector: selectedButton.tag, to: button.tag, title: (button.titleLabel?.text)!)
        selectedButton = button
    }
    @IBAction func choicButton(_ sender: UIButton) {
        setup(selectButton: sender)
    }
    @IBAction func discoverButton(_ sender: UIButton) {
        setup(selectButton: sender)
    }
    @IBAction func selectorButton(_ sender: UIButton) {
        setup(selectButton: sender)
    }
    
    

}
