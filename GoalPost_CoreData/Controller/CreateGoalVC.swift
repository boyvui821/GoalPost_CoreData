//
//  CreateGoalVC.swift
//  GoalPost_CoreData
//
//  Created by Nguyen Hieu Trung on 5/7/18.
//  Copyright © 2018 NHTSOFT. All rights reserved.
//

import UIKit

class CreateGoalVC: UIViewController {
    @IBOutlet weak var goalTextView: UITextView!
    @IBOutlet weak var shortTermBtn: UIButton!
    @IBOutlet weak var longTermBtn: UIButton!
    @IBOutlet weak var nextBtn: UIButton!
    
    var goalType:GoalType = .shorterm;
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nextBtn.bindToKeyboard();
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func PressShortTerm(_ sender: UIButton) {
        goalType = .shorterm;
        shortTermBtn.setSelectedColor();
        longTermBtn.setDeselectedColor();
    }
    @IBAction func PressLongTerm(_ sender: UIButton) {
        goalType = .longterm;
        longTermBtn.setSelectedColor();
        shortTermBtn.setDeselectedColor();
    }
    @IBAction func PressNext(_ sender: UIButton) {
        if goalTextView.text != "" && goalTextView.text != "What is your goal?"{
            guard let finishGoalVC = storyboard?.instantiateViewController(withIdentifier: "FinishGoalVC") as? FinishGoalVC else {return};
            finishGoalVC.initData(description: goalTextView.text!, type: goalType)
            
            //presentDetail(viewControllerToPresent: finishGoalVC);
            
            presentingViewController?.presentSecondaryDetail(viewControllerToPresent: finishGoalVC)
        }else{
            print("Please answer the question")
        }
    }
    @IBAction func PressBack(_ sender: UIButton) {
        dismissDetail();
    }
    
    
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
