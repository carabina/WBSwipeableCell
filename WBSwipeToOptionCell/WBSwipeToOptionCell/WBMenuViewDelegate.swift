//
//  WBMenuViewDelegate.swift
//  WBSwipeToOptionCell
//
//  Created by MacBook on 4/28/18.
//  Copyright © 2018 Waqas Sultan. All rights reserved.
//

import UIKit

protocol MenuViewDelegate: class {
    func menuView(_ menuview: MenuView, directionForRowAtIndexPath indexPath: IndexPath) -> Direction
    func menuView(_ menuview: MenuView, menuLayoutForRowAtIndexPath indexPath: IndexPath) -> MenuLayout
    func menuView(_ menuview: MenuView, showMenuIconForRowAtIndexPath indexPath: IndexPath) -> Bool
    func menuView(_ menuview: MenuView, positionOfMenuIconForRowAtIndexPath indexPath: IndexPath) -> Direction
}

extension MenuViewDelegate {
    func menuView(_ menuview: MenuView, directionForRowAtIndexPath indexPath: IndexPath) -> Direction {
        return .bottom
    }
    func menuView(_ menuview: MenuView, menuLayoutForRowAtIndexPath indexPath: IndexPath) -> MenuLayout {
        return .horizontal
    }
    func menuView(_ menuview: MenuView, showMenuIconForRowAtIndexPath indexPath: IndexPath) -> Bool {
        return true
    }
    func menuView(_ menuview: MenuView, positionOfMenuIconForRowAtIndexPath indexPath: IndexPath) -> Direction {
        return .top
    }
}
