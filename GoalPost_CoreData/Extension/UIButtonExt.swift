//
//  UIButtonExt.swift
//  GoalPost_CoreData
//
//  Created by Nguyen Hieu Trung on 5/8/18.
//  Copyright © 2018 NHTSOFT. All rights reserved.
//

import UIKit

extension UIButton{
    func setSelectedColor(){
       self.backgroundColor = #colorLiteral(red: 0.4274509804, green: 0.737254902, blue: 0.3882352941, alpha: 1)
    }
    
    func setDeselectedColor(){
        self.backgroundColor = #colorLiteral(red: 0.721568644, green: 0.8862745166, blue: 0.5921568871, alpha: 1)
    }
}
