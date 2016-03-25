//
//  TimelineViewController.swift
//  MyInstagram
//
//  Created by DE DPU on 3/25/2559 BE.
//  Copyright © 2559 mycompany. All rights reserved.
//

import UIKit

class TimelineViewController: UIViewController {

    var photoTakingHelper : PhotoTakingHelper?
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.tabBarController?.delegate = self
    }
    
    func takePhoto(){
        photoTakingHelper = PhotoTakingHelper(viewController: self.tabBarController!){
            (image:UIImage?) in
            if let image = image {
                let objKumulos = Kumulos()
                let imageNSData = UIImageJPEGRepresentation(image, 1)
                objKumulos.uploadPhotoWithImageData(imageNSData, andPostData: 1)
            }
            
        }
    }  
}

// MARK: Tab Bar Deligate

extension TimelineViewController:UITabBarControllerDelegate{
    func tabBarController(tabBarController: UITabBarController,
        shouldSelectViewController viewController: UIViewController) -> Bool{
            
            if (viewController is PhotoViewController){
                takePhoto()
                //print("Take Photo")
                return false
            } else{
                return true
            }            
    }
}

