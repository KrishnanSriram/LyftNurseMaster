//
//  TimelineViewController.swift
//  LyftNurseMaster
//
//  Created by Krishnan Sriram Rama on 3/24/19.
//  Copyright © 2019 lyftnurse. All rights reserved.
//

import UIKit

class TimelineViewController: UIViewController {
    
    @IBOutlet weak var segmentControl: UISegmentedControl!
    @IBOutlet weak var tableview: UITableView!
    var selectedIndex: UInt = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableview.dataSource = self
        self.tableview.delegate = self
        // Do any additional setup after loading the view.
        
        let nib1 = UINib(nibName: "ServiceTimelineCellTableViewCell", bundle: nil)
        self.tableview.register(nib1, forCellReuseIdentifier: "ServiceTimelineCell")
        
        let nib2 = UINib(nibName: "ServiceTimelineHistoryCell", bundle: nil)
        self.tableview.register(nib2, forCellReuseIdentifier: "ServiceTimelineHistoryCell")
        
        self.segmentControl.insertSegment(withTitle: "All", at: 2, animated: false)
    }
    
    @IBAction func segmentControlTapped(_ sender: Any) {
        self.tableview.reloadData()
    }
    
}

extension TimelineViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if self.segmentControl.selectedSegmentIndex == 0 {
            return "Services In Que"
        }
        else if self.segmentControl.selectedSegmentIndex == 1 {
            return "My Service history"
        } else {
            return "All requests"
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if self.segmentControl.selectedSegmentIndex == 0 {
            return 3
        }
        else {
            return 5
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if self.segmentControl.selectedSegmentIndex == 0 {
            return self.loadMyQue(tableView, cellForRowAt: indexPath)
        }
        else if self.segmentControl.selectedSegmentIndex == 1 {
            return self.historyQue(tableView, cellForRowAt: indexPath)
        } else {
            return self.loadMainQue(tableView, cellForRowAt: indexPath)
        }
        
    }
    
    private func historyQue(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let serviceCell = tableView.dequeueReusableCell(withIdentifier: "ServiceTimelineHistoryCell", for: indexPath) as! ServiceTimelineHistoryCell
        switch indexPath.row {
        case 0:
            serviceCell.labelName.text = "Jeff Dujon"
            serviceCell.labelAddress.text = "1375 Chambers Rd, Columbus, OH 43212"
            serviceCell.labelSubject.text = "Cut"
            serviceCell.labelDescription.text = "Lorem Ipsum is simply dummy text of the printing and typesetting industry"
            serviceCell.labelServiceDate.text = "11/10/2018"
        case 1:
            serviceCell.labelName.text = "Vivan Richards"
            serviceCell.labelAddress.text = "150 W Sycamore St, Columbus, OH 43215"
            serviceCell.labelSubject.text = "Bandage"
            serviceCell.labelDescription.text = "Lorem Ipsum is simply dummy text of the printing and typesetting industry"
            serviceCell.labelServiceDate.text = "11/11/2018"
        case 2:
            serviceCell.labelName.text = "Desmond Haynes"
            serviceCell.labelAddress.text = "150 W Sycamore St, Columbus, OH 43215"
            serviceCell.labelSubject.text = "Bandage"
            serviceCell.labelDescription.text = "Lorem Ipsum is simply dummy text of the printing and typesetting industry"
            serviceCell.labelServiceDate.text = "11/13/2018"
        case 3:
            serviceCell.labelName.text = "Richie Richardson"
            serviceCell.labelAddress.text = "150 W Sycamore St, Columbus, OH 43215"
            serviceCell.labelSubject.text = "Bandage"
            serviceCell.labelDescription.text = "Lorem Ipsum is simply dummy text of the printing and typesetting industry"
            serviceCell.labelServiceDate.text = "11/18/2018"
        case 4:
            serviceCell.labelName.text = "Malcom marshal"
            serviceCell.labelAddress.text = "150 W Sycamore St, Columbus, OH 43215"
            serviceCell.labelSubject.text = "Bandage"
            serviceCell.labelDescription.text = "Lorem Ipsum is simply dummy text of the printing and typesetting industry"
            serviceCell.labelServiceDate.text = "11/21/2018"
        default:
            serviceCell.labelName.text = "Geoff Boycott"
            serviceCell.labelAddress.text = "1350 N High St, Columbus, OH 43201"
            serviceCell.labelSubject.text = "Cut"
            serviceCell.labelDescription.text = "Lorem Ipsum is simply dummy text of the printing and typesetting industry"
            serviceCell.labelServiceDate.text = "11/30/2018"
        }
        
        return serviceCell
    }
    
    private func loadMyQue(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let serviceCell = tableView.dequeueReusableCell(withIdentifier: "ServiceTimelineCell", for: indexPath) as! ServiceTimelineCellTableViewCell
        switch indexPath.row {
        case 0:
            serviceCell.labelName.text = "Jimmy Adams"
            serviceCell.labelAddress.text = "1375 Chambers Rd, Columbus, OH 43212"
            serviceCell.labelDistance.text = "1.0 miles"
            serviceCell.labelSubject.text = "Cut"
            serviceCell.labeldescription.text = "Lorem Ipsum is simply dummy text of the printing and typesetting industry"
            serviceCell.labelStatus.text = "Approved"
            serviceCell.labelStatus.backgroundColor = UIColor.green
            serviceCell.labelStatus.textColor = UIColor.white
        case 1:
            serviceCell.labelName.text = "Pattrick Patterson"
            serviceCell.labelAddress.text = "150 W Sycamore St, Columbus, OH 43215"
            serviceCell.labelDistance.text = "1.4 miles"
            serviceCell.labelSubject.text = "Bandage"
            serviceCell.labeldescription.text = "Lorem Ipsum is simply dummy text of the printing and typesetting industry"
            serviceCell.labelStatus.text = "Waiting for Approval"
            serviceCell.labelStatus.backgroundColor = UIColor.blue
            serviceCell.labelStatus.textColor = UIColor.white
        default:
            serviceCell.labelName.text = "Jimmy Adams"
            serviceCell.labelAddress.text = "1350 N High St, Columbus, OH 43201"
            serviceCell.labelDistance.text = "2.1 miles"
            serviceCell.labelSubject.text = "Cut"
            serviceCell.labeldescription.text = "Lorem Ipsum is simply dummy text of the printing and typesetting industry"
            serviceCell.labelStatus.text = "Rejected"
            serviceCell.labelStatus.backgroundColor = UIColor.red
            serviceCell.labelStatus.textColor = UIColor.white
        }
        
        return serviceCell
    }
    
    private func loadMainQue(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let serviceCell = tableView.dequeueReusableCell(withIdentifier: "ServiceTimelineCell", for: indexPath) as! ServiceTimelineCellTableViewCell
        switch indexPath.row {
        case 0:
            serviceCell.labelName.text = "Jonny Bairstow"
            serviceCell.labelAddress.text = "1375 Chambers Rd, Columbus, OH 43212"
            serviceCell.labelDistance.text = "1.0 miles"
            serviceCell.labelSubject.text = "Cut"
            serviceCell.labeldescription.text = "Lorem Ipsum is simply dummy text of the printing and typesetting industry"
            serviceCell.labelStatus.text = "New"
            serviceCell.labelStatus.backgroundColor = UIColor.clear
            serviceCell.labelStatus.textColor = UIColor.black
        case 1:
            serviceCell.labelName.text = "Alex Hales"
            serviceCell.labelAddress.text = "150 W Sycamore St, Columbus, OH 43215"
            serviceCell.labelDistance.text = "1.4 miles"
            serviceCell.labelSubject.text = "Bandage"
            serviceCell.labeldescription.text = "Lorem Ipsum is simply dummy text of the printing and typesetting industry"
            serviceCell.labelStatus.text = "New"
            serviceCell.labelStatus.backgroundColor = UIColor.clear
            serviceCell.labelStatus.textColor = UIColor.black
        default:
            serviceCell.labelName.text = "Joe Root"
            serviceCell.labelAddress.text = "1350 N High St, Columbus, OH 43201"
            serviceCell.labelDistance.text = "2.1 miles"
            serviceCell.labelSubject.text = "Cut"
            serviceCell.labeldescription.text = "Lorem Ipsum is simply dummy text of the printing and typesetting industry"
            serviceCell.labelStatus.text = "New"
            serviceCell.labelStatus.backgroundColor = UIColor.clear
            serviceCell.labelStatus.textColor = UIColor.black
        }
        
        return serviceCell
    }
    
}

extension TimelineViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 180
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if self.segmentControl.selectedSegmentIndex == 2 {
            let vc = self.storyboard!.instantiateViewController(withIdentifier: "RequestApproval")
            self.show(vc as! RequestApprovalViewController, sender: self)
            
        }
    }
}
