//
//  ViewController.swift
//  WBSwipeToOptionCell
//
//  Created by MacBook on 4/13/18.
//  Copyright © 2018 Waqas Sultan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    private var items: [MenuView]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.rowHeight = 190.0
    }
    
    @objc func moreBtnPressed(sender: UIButton) {
        
        for (_, cell) in tableView.visibleCells.enumerated() {
            if let optionView = cell.viewWithTag(-1) as? MenuView {
                if optionView.isMenuOpen {
                    optionView.close()
                }
            }
        }
        if let optionView = sender.superview?.superview?.viewWithTag(-1) as? MenuView {
            if optionView.isMenuOpen {
                optionView.close()
            } else {
                optionView.open()
            }
        }
        
    }
    
}

// MARK: - UITableViewDataSource
extension ViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as? CustomTableViewCell else {
            return UITableViewCell()
        }
        let item1 = MenuItem(title: "Delete", icon: "delete") { (item) in
            
        }
        item1.itemBorderColor = UIColor.white
        item1.itemBorderWidth = 2.0
        item1.itemIconSize = CGSize(width: 70, height: 70)
        item1.titleColor = UIColor.gray
        item1.titleFont = UIFont.systemFont(ofSize: 11.0)
      //  item1.backgroundColor = UIColor.blue
        let item2 = MenuItem(title: "Submit", icon: "save"){ (item) in
            
        }
        item2.itemBorderColor = UIColor.black
        item2.itemBorderWidth = 2.0
      //  item2.backgroundColor = UIColor.green
        let item3 = MenuItem(title: "Save", icon: "submit"){ (item) in
            
        }
        item3.itemBorderColor = UIColor.black
        item3.itemBorderWidth = 2.0
      //  item3.backgroundColor = UIColor.yellow
       // WBMenuView.addOptionsView(tableViewCell: cell, [item1, item2, item3])
        let menu = MenuView(tableViewCell: cell, items: [item1, item2, item3], indexPath: indexPath)
        menu.delegate = self
        menu.setupUI()
        menu.setMenuContentAlignment(.left)
        menu.setBackgroundColor(UIColor.blue)
        menu.setMenuItemSpacingVertical(10.0)
        menu.setMenuItemSpacingHorizontal(15.0)
        menu.setMenuContentInset(10, left: 10, bottom: 10, right: 10)
        menu.tag = -1
        cell.buttonMore.tag = indexPath.row
        cell.selectionStyle = .none
        cell.labelTitle.text = "sddfgsdfg"
        cell.buttonMore.addTarget(self, action: #selector(moreBtnPressed(sender:)), for: .touchUpInside)
        return cell
    }
}

extension ViewController: MenuViewDelegate {
//    func MenuView(_ view: WBMenuView, directionForRowAtIndexPath indexPath: IndexPath) -> Direction {
//
//    }
//    func MenuView(_ view: WBMenuView, menuLayoutForRowAtIndexPath indexPath: IndexPath) -> MenuLayout {
//
//    }
//    func MenuView(_ view: WBMenuView, showMenuIconForRowAtIndexPath indexPath: IndexPath) -> Bool {
//
//    }

}

