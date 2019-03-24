//
//  RegisterViewController.swift
//  LyftNurseMaster
//
//  Created by Krishnan Sriram Rama on 3/24/19.
//  Copyright © 2019 lyftnurse. All rights reserved.
//

import UIKit

class RegisterViewController: UIViewController {

    @IBOutlet weak var continueButton: UIButton!
    @IBOutlet weak var tableview: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        tableview.isHidden = true
        continueButton.isHidden = true
        // Do any additional setup after loading the view.
        let nib1 = UINib(nibName: "RegisterCurrentEmploymentCell", bundle: nil)
        self.tableview.register(nib1, forCellReuseIdentifier: "RegisterCurrentEmploymentCell")
        
        let nib2 = UINib(nibName: "RegisterPreviousEmploymentCell", bundle: nil)
        self.tableview.register(nib2, forCellReuseIdentifier: "RegisterPreviousEmploymentCell")
        
        let nib3 = UINib(nibName: "RegisterEducationCell", bundle: nil)
        self.tableview.register(nib3, forCellReuseIdentifier: "RegisterEducationCell")
        
    }
    

    @IBAction func buttonSubmitDetailsTapped(_ sender: Any) {
        tableview.isHidden = false
        continueButton.isHidden = false
        self.tableview.delegate = self
        self.tableview.dataSource = self
        self.tableview.reloadData()
    }
    
    @IBAction func buttonContinueTapped(_ sender: Any) {
    }
    
    @IBAction func buttonCancelTapped(_ sender: Any) {
    }
    
    
}

extension RegisterViewController: UITableViewDelegate {
    
}

extension RegisterViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 0:
            return "Current employment status"
        case 1:
            return "Previous experiences"
        case 2:
            return "Educational Qualification"
        default:
            return ""
        }
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 1
        case 1:
            return 1
        case 2:
            return 2
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            let currentEmploymentCell = tableView.dequeueReusableCell(withIdentifier: "RegisterCurrentEmploymentCell", for: indexPath) as! RegisterCurrentEmploymentCell
            return currentEmploymentCell
        case 1:
            let previousEmploymentCell = tableView.dequeueReusableCell(withIdentifier: "RegisterPreviousEmploymentCell", for: indexPath) as! RegisterPreviousEmploymentCell
            return previousEmploymentCell
        case 2:
            let educationCell = tableView.dequeueReusableCell(withIdentifier: "RegisterEducationCell", for: indexPath) as! RegisterEducationCell
            return educationCell
        default:
            return UITableViewCell(frame: .zero)
        }
    }
    
    
}
