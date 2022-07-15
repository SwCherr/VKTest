//
//  ViewController.swift
//  VkTest
//
//  Created by Yuliya Kungurova on 14.07.22.
//  Copyright © 2022 Yuliya Kungurova. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var nameLabels: UILabel!
    @IBOutlet weak var discriptionLabaels: UILabel!
    @IBOutlet weak var linkButtons: UIButton!
    @IBOutlet weak var iconLinkButtons: UIButton!
    
    
    @IBAction func clickLinkButtons(sender: UIButton) {
        //UIApplication.sharedApplication().openURL(NSURL(fileURLWithPath: iconUrlService) as NSURL, options: [:], competionHandler: nil)
        //UIApplication.sharedApplication().openURL(NSURL(string: "https://publicstorage.hb.bizmrg.com/sirius/vk.png")! as NSURL)

    }
    
    @IBAction func clickIconLinkButtons(sender: UIButton) {
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        guard let path = NSBundle.mainBundle().pathForResource("Directions", ofType: "geojson") else {
            print("Error finding file")
            return
        }
        
        do {
            let data: NSData? = NSData(contentsOfFile: path)
            if let jsonResult: NSDictionary =
                try NSJSONSerialization.JSONObjectWithData(
                    data!, options: NSJSONReadingOptions.MutableContainers) as? NSDictionary {
                //распаковали рута
    
                let bodyDictionary = jsonResult["body"] as! NSDictionary
                let serviceArray = bodyDictionary["services"] as! NSArray
                //print(serviceArray)
               
                
                var item = 0
                for _ in serviceArray {
                    let serviceDictionary = serviceArray[item] as! NSDictionary
                    // как получить значение по тегу без библиотек?
                    
                    
                    //nameLabels.tag = item
                    //nameLabels.text = String(serviceDictionary["name"]!)
                    
                    
                    /*
                    if item == nameLabels.tag {
                        nameLabels.text = String(serviceDictionary["name"]!)
                        descriptionLabels.text = String(serviceDictionary["description"]!)
                        print(item)
                    }
                    print(nameLabels)
                     */
                    
                    item += 1
                }
            }
        } catch let error as ErrorType {
            print("Error: \n \(error)")
            return
    }
}

 
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

