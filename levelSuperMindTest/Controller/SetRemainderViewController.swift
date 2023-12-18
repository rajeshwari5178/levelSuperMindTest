//
//  SetRemainderViewController.swift
//  levelSuperMindTest
//
//  Created by Rajeshwari Sharma on 18/12/23.
//

import UIKit

class SetRemainderViewController: UIViewController,UITableViewDelegate,UITableViewDataSource,RemainderViewControllerDelegate{
    
    var selectedTime: Date?
    
    var reminderTimes: [Date] = []
   
    @IBOutlet weak var mTableView: UITableView!
    @IBOutlet weak var addremaindebutton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        mTableView.reloadData()
        print(reminderTimes,"new")
        addremaindebutton.layer.cornerRadius = 8
        mTableView.delegate=self
        mTableView.dataSource=self
        mTableView.register(UINib(nibName: "ReminderTableViewCell", bundle: Bundle.main), forCellReuseIdentifier: "ReminderTableViewCell")
        // Do any additional setup after loading the view.
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1   }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        switch section{
        case 0 :
            return reminderTimes.count
          
        default:
            break
        }
        return 1
    }
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let section = indexPath.section
        //ActivityRoutineTableViewCell
        switch section{
        case 0 :
            let cell = tableView.dequeueReusableCell(withIdentifier: "ReminderTableViewCell") as! ReminderTableViewCell
        

                    let dateFormatter = DateFormatter()
                    dateFormatter.timeZone = TimeZone.current
                    dateFormatter.dateFormat = "h:mm a"

                    let reminderTime = reminderTimes[indexPath.row]
                    let formattedTime = dateFormatter.string(from: reminderTime)
                    cell.Timealbel.text = formattedTime
            
            cell.switchValueChanged = { [weak self] isOn in
                      self?.handleSwitchValueChanged(isOn: isOn, indexPath: indexPath)
                  }
            
            
          //  cell.SwitchButton action
            
            return cell
       
          
        default:
            break
        }
        
       return UITableViewCell()
        
    }
    func handleSwitchValueChanged(isOn: Bool, indexPath: IndexPath) {
        if !isOn {
            // Switch turned off, show confirmation dialog
            showDeleteConfirmation(indexPath: indexPath)
        }
    }

    func showDeleteConfirmation(indexPath: IndexPath) {
        let alertController = UIAlertController(title: "Delete Reminder", message: "Are you sure you want to delete this reminder?", preferredStyle: .alert)

        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        alertController.addAction(cancelAction)

        let deleteAction = UIAlertAction(title: "Delete", style: .destructive) { [weak self] _ in
            // Handle the deletion here, e.g., remove the reminder from the array
            self?.reminderTimes.remove(at: indexPath.row)
            self?.mTableView.reloadData()
        }
        alertController.addAction(deleteAction)

        present(alertController, animated: true, completion: nil)
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let section = indexPath.section
        
        switch section{
            
            
        case 0 :
            
            return 160
       
        default:
            break
        }
        return 0
    }
    func didAddReminderTime(_ time: Date) {
            reminderTimes.append(time)
            mTableView.reloadData()
        }
    @IBAction func BackAction(_ sender: Any) {
        let storyboard = UIStoryboard.init(name: "Main", bundle: nil)
        let nextVC = storyboard.instantiateViewController(identifier: "NewViewController") as! NewViewController
        print("RemainderViewController")
        nextVC.hidesBottomBarWhenPushed = true
        nextVC.modalPresentationStyle = .fullScreen
        present(nextVC, animated: true)
    }
    
    
    @IBAction func AddRemainderAction(_ sender: Any) {
        
        let storyboard = UIStoryboard.init(name: "Main", bundle: nil)
        let nextVC = storyboard.instantiateViewController(identifier: "RemainderViewController") as! RemainderViewController
        print("RemainderViewController")
        nextVC.hidesBottomBarWhenPushed = true
        nextVC.delegate = self
        nextVC.modalPresentationStyle = .fullScreen
        present(nextVC, animated: true)
    }
    
}
