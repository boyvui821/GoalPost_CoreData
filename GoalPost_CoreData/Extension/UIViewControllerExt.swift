//
//  UIViewControllerExt.swift
//  GoalPost_CoreData
//
//  Created by Nguyen Hieu Trung on 5/7/18.
//  Copyright © 2018 NHTSOFT. All rights reserved.
//

import UIKit

extension UIViewController{
    func presentDetail(viewControllerToPresent: UIViewController){
        let transition = CATransition()
        transition.duration = 1.0;
        transition.type = kCATransitionFade;
        transition.subtype = kCATransitionFromRight;
        self.view.window?.layer.add(transition, forKey: kCATransition);
        present(viewControllerToPresent, animated: false, completion: nil);
    }
    
    func presentSecondaryDetail(viewControllerToPresent: UIViewController){
        let transition = CATransition()
        transition.duration = 1.0;
        transition.type = kCATransitionFade;
        transition.subtype = kCATransitionFromRight;
        
        guard let vc = presentedViewController else {return};
        
        vc.dismiss(animated: false, completion: {
            self.view.window?.layer.add(transition, forKey: kCATransition);
            self.present(viewControllerToPresent, animated: false, completion: nil);
        })
        
    }
    
    func dismissDetail(){
        let transition = CATransition()
        transition.duration = 1.0;
        transition.type = kCATransitionPush;
        transition.subtype = kCATransitionFromRight;
        self.view.window?.layer.add(transition, forKey: kCATransition);
        dismiss(animated: false, completion: nil);
    }
}
