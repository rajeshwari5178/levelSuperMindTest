//
//  GoalsTableViewCell.swift
//  levelSuperMindTest
//
//  Created by Rajeshwari Sharma on 18/12/23.
//

import UIKit

class GoalsTableViewCell: UITableViewCell,UICollectionViewDelegate,UICollectionViewDataSource {
    @IBOutlet weak var mCollectionView: UICollectionView!
    override func awakeFromNib() {
        super.awakeFromNib()
        collectionViewSetup()
       
       
          
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    private func collectionViewSetup(){
        mCollectionView.delegate=self
        mCollectionView.dataSource=self
        //            mCollectionView.isScrollEnabled = true
        //TopratedCollectionViewCell
        mCollectionView.register(UINib(nibName: "GolasCollectionViewCell", bundle: Bundle.main), forCellWithReuseIdentifier: "GolasCollectionViewCell")
         mCollectionView.register(UINib(nibName: "SecondCollectionViewCell", bundle: Bundle.main), forCellWithReuseIdentifier: "SecondCollectionViewCell")
        
        setCollectionViewLayouts()
    }
    
    
    
    func setCollectionViewLayouts(){
        let flowLayout=UICollectionViewFlowLayout()
        
        flowLayout.scrollDirection = .horizontal
        flowLayout.itemSize = CGSize(width: mCollectionView.frame.width, height: mCollectionView.frame.height)
         flowLayout.itemSize=CGSize(width: 340, height: 180)
        flowLayout.minimumLineSpacing = 0
        flowLayout.minimumInteritemSpacing = 0
        
        mCollectionView.setCollectionViewLayout(flowLayout, animated: true)
        //   setTimer()
    }
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch section {
//
    case 0:
            return 1
        
        case 1:
                return 1
   
//
    default:
        break
    }
    return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let section = indexPath.section
        
        switch section{
//        case 0 :
//
        case 0 :
           
                       // This is the first item in the collection view
                       let cell = mCollectionView.dequeueReusableCell(withReuseIdentifier: "GolasCollectionViewCell", for: indexPath) as! GolasCollectionViewCell
         //   cell.ImageVieww.image=UIImage(named: Imagess[indexPath.row])
                       
        
 
            return cell
        case 1 :
           
                       // This is the first item in the collection view
                       let cell = mCollectionView.dequeueReusableCell(withReuseIdentifier: "SecondCollectionViewCell", for: indexPath) as! SecondCollectionViewCell
         //   cell.ImageVieww.image=UIImage(named: Imagess[indexPath.row])
                       
        
 
            return cell
             default:
                 break
             }
             
          
             return UICollectionViewCell()
    }
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        cell.transform = CGAffineTransform(scaleX: 0, y: 0)
                UIView.animate(withDuration: 2, animations: {
                    cell.transform = CGAffineTransform(scaleX: 1, y:1)
                })
    }

}
