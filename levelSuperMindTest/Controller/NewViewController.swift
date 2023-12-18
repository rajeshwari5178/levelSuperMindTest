//
//  ViewController.swift
//  levelSuperMindTest
//
//  Created by Rajeshwari Sharma on 18/12/23.
//

import UIKit

class NewViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    @IBOutlet weak var Profilebutton: UIButton!
    
    @IBOutlet weak var Lbel1Xp: UILabel!
    
    @IBOutlet weak var halfView: UIView!
    
    @IBOutlet weak var LView: UIView!
    
    @IBOutlet weak var BlueView: UIView!
    @IBOutlet weak var Watchbutton: UIButton!
    @IBOutlet weak var mTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        if let backgroundImage = UIImage(named: "Tblebckground") {
            let backgroundImageView = UIImageView(image: backgroundImage)
            backgroundImageView.contentMode = .scaleAspectFit // Adjust the content mode as needed
            mTableView.backgroundView = backgroundImageView
        }
        mTableView.backgroundView?.contentMode = .scaleAspectFill
        
//
        let rightCornerRadius: CGFloat = 16
        let leftCornerRadius: CGFloat = 8.0

        BlueView.layer.cornerRadius = 0 // Resetting the corner radius first
        mTableView.reloadData()
        // Applying corner radius only to the right side
        BlueView.layer.maskedCorners = [.layerMaxXMaxYCorner, .layerMaxXMinYCorner]
        BlueView.layer.cornerRadius = rightCornerRadius

        // Optionally, if you want to set a different radius for the left side
        let leftMask = CAShapeLayer()
        leftMask.path = UIBezierPath(roundedRect: BlueView.bounds, byRoundingCorners: [.topLeft, .bottomLeft], cornerRadii: CGSize(width: leftCornerRadius, height: leftCornerRadius)).cgPath
        BlueView.layer.mask = leftMask
        Lbel1Xp.layer.cornerRadius=8
        Profilebutton.layer.cornerRadius=8
        Profilebutton.layer.borderWidth = 2
        halfView.layer.borderWidth = 2
        LView.layer.borderWidth = 2
        Lbel1Xp.layer.borderWidth = 2
        Profilebutton.layer.borderWidth = 2
        let hexColorString = "#57C5EE"

        if let hexColor = UIColor(hexString: hexColorString) {
            Profilebutton.layer.borderColor = hexColor.cgColor
            halfView.layer.borderColor = hexColor.cgColor
            LView.layer.borderColor = hexColor.cgColor
            Lbel1Xp.layer.borderColor = hexColor.cgColor
            Profilebutton.layer.borderColor = hexColor.cgColor
        } else {
            // Handle invalid hex color string
            print("Invalid hex color string")
        }
       
       
        mTableView.delegate=self
        mTableView.dataSource=self
        mTableView.register(UINib(nibName: "HeaderTableViewCell", bundle: Bundle.main), forCellReuseIdentifier: "HeaderTableViewCell")
        mTableView.register(UINib(nibName: "GoalsTableViewCell", bundle: Bundle.main), forCellReuseIdentifier: "GoalsTableViewCell")
        mTableView.register(UINib(nibName: "ActivityRoutineTableViewCell", bundle: Bundle.main), forCellReuseIdentifier: "ActivityRoutineTableViewCell")
        mTableView.register(UINib(nibName: "InnerpeaceTableViewCell", bundle: Bundle.main), forCellReuseIdentifier: "InnerpeaceTableViewCell")
        //InnerpeaceTableViewCell
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 4    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        switch section{
        case 0 :
        return 1
        case 1 :
        return 1
        case 2 :
        return 1
        case 3 :
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
            let cell = tableView.dequeueReusableCell(withIdentifier: "HeaderTableViewCell") as! HeaderTableViewCell
            print("HeaderTableViewCell")
            return cell
        case 1 :
            let cell = tableView.dequeueReusableCell(withIdentifier: "GoalsTableViewCell") as! GoalsTableViewCell
            
            return cell
        case 2 :
            let cell = tableView.dequeueReusableCell(withIdentifier: "ActivityRoutineTableViewCell") as! ActivityRoutineTableViewCell
            cell.alpha = 0.0

               // Perform animation
               UIView.animate(withDuration: 0.5, delay: 0.1 * Double(indexPath.row), options: .curveEaseInOut, animations: {
                   cell.alpha = 1.0
               }, completion: nil)
            return cell
        case 3 :
            let cell = tableView.dequeueReusableCell(withIdentifier: "InnerpeaceTableViewCell") as! InnerpeaceTableViewCell
            cell.alpha = 0.0

               // Perform animation
               UIView.animate(withDuration: 0.5, delay: 0.1 * Double(indexPath.row), options: .curveEaseInOut, animations: {
                   cell.alpha = 1.0
               }, completion: nil)
            return cell
        default:
            break
        }
        
       return UITableViewCell()
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let section = indexPath.section
        
        switch section{
            
            
        case 0 :
            
            return 100
        case 1 :
            
            return 240
        case 2 :
            
            return 180
        case 3 :
            
            return 150
        default:
            break
        }
        return 0
    }
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        cell.transform =  CGAffineTransform(translationX: 0, y:0)
       
              UIView.animate(withDuration: 1, delay: 0.05*Double(indexPath.row), options: .curveLinear) {
                  cell.transform =  CGAffineTransform(translationX: cell.contentView.frame.width, y: cell.contentView.frame.height)
              }
    }
    
    @IBAction func ClockAction(_ sender: Any) {
        
        let storyboard = UIStoryboard.init(name: "Main", bundle: nil)
        let nextVC = storyboard.instantiateViewController(identifier: "SetRemainderViewController") as! SetRemainderViewController
        print("SetRemainderViewController")
        nextVC.hidesBottomBarWhenPushed = true
        nextVC.modalPresentationStyle = .fullScreen
        present(nextVC, animated: true)
      
    }
    
    
}
