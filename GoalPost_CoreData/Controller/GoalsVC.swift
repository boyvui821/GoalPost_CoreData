//
//  GoalsVC.swift
//  GoalPost_CoreData
//
//  Created by Nguyen Hieu Trung on 5/7/18.
//  Copyright © 2018 NHTSOFT. All rights reserved.
//

import UIKit
import CoreData

class GoalsVC: UIViewController {

    @IBOutlet weak var tableGoal: UITableView!
    var goals = [Goal]();
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let goal = Goal();
        tableGoal.delegate = self;
        tableGoal.dataSource = self;
        tableGoal.isHidden = false;
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated);
        FetchCodeDataObject();
    }
    
    func FetchCodeDataObject(){
        self.fetch { (result) in
            if result{
                if (self.goals.count >= 1) {
                    self.tableGoal.isHidden = false;
                    self.tableGoal.reloadData()
                }else{
                    self.tableGoal.isHidden = true;
                }
            }
        }
    }
    
    
    @IBAction func PressAddGoal(_ sender: UIButton) {
        guard let createGoalVC = storyboard?.instantiateViewController(withIdentifier: "CreateGoalVC") as? CreateGoalVC else{return};
        
        presentDetail(viewControllerToPresent: createGoalVC);
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

extension GoalsVC:UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.goals.count;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ReuseCell", for: indexPath) as? GoalCell else {return UITableViewCell()};
        
        var item = self.goals[indexPath.row];
        
        cell.configueCell(goal: item);
        return cell;
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true;
    }
    
//    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCellEditingStyle {
//        return .none;
//    }
    
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        let actionDelete = UITableViewRowAction(style: .destructive, title: "Delete") { (action, indexPath) in
            self.removewGoal(atIndexPath: indexPath);
            self.FetchCodeDataObject();
        };
        
        let actionAdd = UITableViewRowAction(style: .normal, title: "ADD 1") { (action, indexPath) in
            self.setProgress(atIndexPath: indexPath);
            self.FetchCodeDataObject();
        }
        
        actionDelete.backgroundColor = #colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1);
        actionAdd.backgroundColor = #colorLiteral(red: 0.2196078449, green: 0.007843137719, blue: 0.8549019694, alpha: 1);
        return [actionDelete,actionAdd];
    }
}

//MARK: -fetch Data Core Data
extension GoalsVC{
    
    func setProgress(atIndexPath indexPath:IndexPath){
        var currGoal = self.goals[indexPath.row];
        if currGoal.goalProgress < currGoal.goalCompletionValue{
            currGoal.goalProgress += 1;
        }else{
            return;
        }
        
        do{
            try manageContext?.save()
        }catch{
            print("Error Update");
        }
        
    }
    
    //Xoá dữ liệu Core data
    func removewGoal(atIndexPath:IndexPath){
        var itemRemove = self.goals[atIndexPath.row];
        manageContext?.delete(itemRemove);
        
        //Sau khi xoá thì save context
        do{
            try manageContext?.save()
        }catch{
            print("Lỗi save sau khi xoá Data")
            print(error);
        }
    }
    
    func fetch(completed:(_ result:Bool)->()){
        var fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Goal");
        do{
            self.goals = try manageContext?.fetch(fetchRequest) as! [Goal];
            for item in goals{
                print(item.goalProgress);
            }
            completed(true);
        }catch{
            print("Error Fetch Data Goal");
            print(error);
        }
       
    }
}

