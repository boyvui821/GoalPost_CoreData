//
//  FinishGoalVC.swift
//  GoalPost_CoreData
//
//  Created by Nguyen Hieu Trung on 5/8/18.
//  Copyright © 2018 NHTSOFT. All rights reserved.
//

import UIKit
import CoreData

class FinishGoalVC: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var goalPointTxt: UITextField!
    @IBOutlet weak var createGoalBtn: UIButton!
    var goalDescription:String!
    var goalType: GoalType!
    
    func initData(description:String, type:GoalType){
        self.goalDescription = description;
        self.goalType = type;
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createGoalBtn.bindToKeyboard();
        goalPointTxt.delegate = self;
        
        // Do any additional setup after loading the view.
    }

    @IBAction func PressBack(_ sender: UIButton) {
        dismissDetail();
    }
    @IBAction func PressCreateGoal(_ sender: UIButton) {
        self.Save { (result) in
            if result{
                //var goalVC = storyboard?.instantiateViewController(withIdentifier: "GoalsVC") as? GoalsVC;
                //self.presentSecondaryDetail(viewControllerToPresent: goalVC!);
                dismiss(animated: true, completion: nil);
            }
        }
    }
    
    func Save(completion: (_ finished:Bool)->()){
        let goal = Goal(context: manageContext!);
        goal.goalDescription = self.goalDescription
        goal.goalType = self.goalType.rawValue;
        goal.goalCompletionValue = Int32(goalPointTxt.text!)!;
        
        
        do{
            try manageContext?.save()
            completion(true);
        }catch{
            print("error save context")
        }
        
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
