//
//  GoalCell.swift
//  GoalPost_CoreData
//
//  Created by Nguyen Hieu Trung on 5/7/18.
//  Copyright © 2018 NHTSOFT. All rights reserved.
//

import UIKit

class GoalCell: UITableViewCell {
    @IBOutlet weak var goalDescriptionLbl: UILabel!
    @IBOutlet weak var goalTypeLbl: UILabel!
    @IBOutlet weak var goalProgressLbl: UILabel!
    @IBOutlet weak var completeView: UIView!
    
    func configueCell(goal: Goal){
        self.goalDescriptionLbl.text = goal.goalDescription;
        self.goalTypeLbl.text = goal.goalType;
        self.goalProgressLbl.text = goal.goalProgress.description;
        
        if goal.goalProgress == goal.goalCompletionValue{
            self.completeView.isHidden = false;
        }else{
            self.completeView.isHidden = true;
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
