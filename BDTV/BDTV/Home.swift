//
//  Home.swift
//  BDTV
//
//  Created by Mazharul on 5/15/17.
//  Copyright © 2017 Mazharul. All rights reserved.
//

import UIKit



class Home: UICollectionViewController {

    var output2 = String()
    
    
    
    var TVImages = [UIImage (named: "setmax"),UIImage (named: "setsony") ]
    

    
    var TVNames = [String]()
    var CellArray = [String]()
var selectedRow = 0
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        downloadFromURL()

       self.view.backgroundColor = UIColor.red
        
        self.title = "Live TV"
    
        // Do any additional setup after loading the view.
    }

    

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return TVNames.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! CollectionViewCellindex
        
     
    
        cell.layer.cornerRadius = 5
        cell.layer.masksToBounds = true
        cell.layer.borderWidth = 1
       cell.layer.borderColor = UIColor.black.cgColor
        
        return cell
    }
    
    
    func downloadFromURL ()
    {
        let url = NSURL(string: "http://localhost/BDTV.PHP")
        URLSession.shared.dataTask(with: (url as? URL)!, completionHandler: {(data, response, error) -> Void in
            if let jsonObj = try? JSONSerialization.jsonObject(with: data!, options: .allowFragments) as? NSDictionary {
                if let actorArray = jsonObj!.value(forKey: "result") as? NSArray {
                    for actor in actorArray{
                        if let actorDict = actor as? NSDictionary {
                            if let name = actorDict.value(forKey: "CHNEEL_NAME") {
                                self.TVNames.append(name as! String)
                            }
                            if let name = actorDict.value(forKey: "CHNEEL_URL") {
                                self.CellArray.append(name as! String)
                            }
                            
                        }
                    }
                }
                OperationQueue.main.addOperation({
                    self.collectionView?.reloadData()
                })
            }
        }).resume()
        
    }
    
   
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
       
        
       
        
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "FullChaneelView") as! FullChaneelViewController
        vc.Belal = CellArray[indexPath.row]
    
                self.navigationController?.pushViewController(vc, animated: true)

        
        
        
        }
        
    

    
   

}
