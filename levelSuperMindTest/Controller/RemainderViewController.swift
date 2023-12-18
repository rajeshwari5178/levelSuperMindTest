//
//  RemainderViewController.swift
//  levelSuperMindTest
//
//  Created by Rajeshwari Sharma on 18/12/23.
//

import UIKit

class RemainderViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    @IBOutlet weak var mTableView: UITableView!
    @IBOutlet weak var savebutton: UIButton!
    weak var delegate: RemainderViewControllerDelegate?
    var selectedTime: Date?
    override func viewDidLoad() {
        super.viewDidLoad()
        savebutton.layer.cornerRadius = 8
        mTableView.delegate=self
        mTableView.dataSource=self
        mTableView.register(UINib(nibName: "TimePickerTableViewCell", bundle: Bundle.main), forCellReuseIdentifier: "TimePickerTableViewCell")
        // Do any additional setup after loading the view.
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1   }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        switch section{
        case 0 :
        return 1
       
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
            let cell = tableView.dequeueReusableCell(withIdentifier: "TimePickerTableViewCell") as! TimePickerTableViewCell
            cell.Datepicker.date = Date()
                 
                 // Add a target to detect changes in the date picker's value
            cell.Datepicker.addTarget(self, action: #selector(datePickerValueChanged), for: .valueChanged)
                 
                 // Print the local timezone initially
       //     printLocalTimeAndTimeZone()
            return cell
       
          
        default:
            break
        }
        
       return UITableViewCell()
        
    }
    @objc func datePickerValueChanged(sender: UIDatePicker) {
        // Handle date picker value changes
        selectedTime = sender.date
        printLocalTimeAndTimeZone(datePicker: sender)
    }

    func printLocalTimeAndTimeZone(datePicker: UIDatePicker) {
        let selectedDate = datePicker.date
        let localTimeZone = TimeZone.current
        let dateFormatter = DateFormatter()
        dateFormatter.timeZone = localTimeZone
        dateFormatter.dateFormat = "h:mm a"

        let localTime = dateFormatter.string(from: selectedDate)

        print("Selected Time: \(localTime), Time Zone: \(localTimeZone.identifier)")
        
        
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let section = indexPath.section
        
        switch section{
            
            
        case 0 :
            
            return 280
       
        default:
            break
        }
        return 0
    }

    @IBAction func BackAction(_ sender: Any) {
        dismiss(animated: true)
    }
    
    
    @IBAction func saveAction(_ sender: Any) {
        if let selectedTime = selectedTime {
                   delegate?.didAddReminderTime(selectedTime)
               }
       
     

        dismiss(animated: true)
    }
    
}
protocol RemainderViewControllerDelegate: AnyObject {
    func didAddReminderTime(_ time: Date)
}
