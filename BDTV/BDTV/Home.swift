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
    
    
    
    //var TVImages = [UIImage (named: "MohunaTV"),UIImage (named: "jamunaTV"),UIImage (named: "GanBangla TV"),UIImage (named: "chaneeli"),UIImage (named: "chaneel24"),UIImage (named: "bijoytv"),UIImage (named: "banglavisiontv"),UIImage (named: "atntv"),UIImage (named: "ATNNews"),UIImage (named: "RTV Music"),UIImage (named: "rtv"),UIImage (named: "satv"),UIImage (named: "somoytv"),UIImage (named: "TBN24RV") ]
    
    
    var okName = ["https://www.google.com/","http://10.1.1.1:8080/English%20TV%20Series/Animater%20TV%20Series/Hentai%20Ouji%20to%20Warawanai%20Neko%20720p/[SushiKushi]%20Hentai%20Ouji%20to%20Warawanai%20Neko%20-%2001%20[720p].mp4","https://www.youtube.com/watch?v=apt8KjklJGY","Chaneel 24","Bijoy TV","Bangla Vision","ATN TV","ATN News","R TV","Somoy TV","TBN 24 TV","SA TV","Mohuna TV"]
    
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
        
        
       // cell.TvImagesView.image = TVImages[indexPath.row]
        cell.TVNameLabel.text! = TVNames[indexPath.row]
    
        cell.layer.cornerRadius = 8
        cell.layer.masksToBounds = true
        
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
                            if let name = actorDict.value(forKey: "Username") {
                                self.TVNames.append(name as! String)
                            }
                            if let name = actorDict.value(forKey: "Cell") {
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
        
        let output = okName[indexPath.row]
        
       
        
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "FullChaneelView") as! FullChaneelViewController
        vc.Belal = okName[indexPath.row]
    
                self.navigationController?.pushViewController(vc, animated: true)

        
        
        
        }
        
    

    
   

}
