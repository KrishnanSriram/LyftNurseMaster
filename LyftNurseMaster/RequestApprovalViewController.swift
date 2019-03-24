//
//  RequestApprovalViewController.swift
//  LyftNurseMaster
//
//  Created by Krishnan Sriram Rama on 3/24/19.
//  Copyright © 2019 lyftnurse. All rights reserved.
//

import UIKit

class RequestApprovalViewController: UIViewController {

    @IBOutlet weak var tableview: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableview.dataSource = self
        self.tableview.delegate = self
        // Do any additional setup after loading the view.
        
        let nib1 = UINib(nibName: "PhysicianDetailsCell", bundle: nil)
        self.tableview.register(nib1, forCellReuseIdentifier: "PhysicianDetailsCell")
        
        let nib2 = UINib(nibName: "PatientRequestCell", bundle: nil)
        self.tableview.register(nib2, forCellReuseIdentifier: "PatientRequestCell")
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    @IBAction func requestAprovalButtonTapped(_ sender: Any) {
        let alert = UIAlertController(title: "Request submitted", message: "Your request to assist cut or a bruise injury has been submitted. Please check time lines section for updates", preferredStyle: .alert)
        let OKAction = UIAlertAction(title: "OK", style: .default) { (action) in
            self.navigationController?.popViewController(animated: true)
            return
        }
        alert.addAction(OKAction)
        self.present(alert, animated: true, completion: nil)
    }
}

extension RequestApprovalViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 180
    }
}

extension RequestApprovalViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0 {
            return "Approver details"
        } else {
            return "Patient/Request details"
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            let serviceCell = tableView.dequeueReusableCell(withIdentifier: "PhysicianDetailsCell", for: indexPath) as! PhysicianDetailsCell
            return serviceCell
        } else {
            let serviceCell = tableView.dequeueReusableCell(withIdentifier: "PatientRequestCell", for: indexPath) as! PatientRequestCell
            return serviceCell
        }
    }
    
    
}
