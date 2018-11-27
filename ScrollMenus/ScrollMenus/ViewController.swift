//
//  ViewController.swift
//  ScrollMenus
//
//  Created by iOS on 2018/11/20.
//  Copyright © 2018 weiman. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var menuView: UIView!
    private var menus: [MenuModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        
    }
    
    private func setup() {
        
        let menu1 = MenuModel(title: "购买记录",
                              imageNormal: nil,
                              imageSelected: nil)
        let menu2 = MenuModel(title: "680人",
                              imageNormal: #imageLiteral(resourceName: "personNumber_normal"),
                              imageSelected: #imageLiteral(resourceName: "personNumber_selected"))
        let menu3 = MenuModel(title: "商品详情",
                              imageNormal: nil,
                              imageSelected: nil)
        menus = [menu1, menu2, menu3]
        let menu = ScrollMenus(titles: menus,
                               frame: menuView.bounds,
                               menuHeight: 44)
        menu.dataSource = self
        menu.delegate = self
        menu.set(menuIndex: 1)
        menuView.addSubview(menu)
    }
}

extension ViewController: ScrollMenusDataSource {
    
    func menuViewNumberOfItems() -> Int {
        return menus.count
    }
    
    func menuViewViewForItems(atIndex: Int) -> UIView {
        guard atIndex < menus.count else {
            return UIView()
        }
        switch atIndex {
        case 0:
            let vc = FirstViewController.instance()
            return vc.view
        case 1:
            let vc = SecondViewController.instance()
            return vc.view
        case 2:
            let vc = FirstViewController.instance()
            return vc.view
        default:
            return UIView()
        }
    }
}

extension ViewController: ScrollMenusDelegate {
    
    func menuDidChange(currentIndex: Int) {
        print("------------  \(currentIndex)")
    }
}

