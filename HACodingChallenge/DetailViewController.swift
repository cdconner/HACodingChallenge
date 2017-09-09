//
//  DetailViewController.swift
//  HACodingChallenge
//
//  Created by Chris Conner on 9/6/17.
//  Copyright © 2017 Chris Conner. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    //image and labels
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var dateTimeLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    
   
    var titleString:String!
    var dateAndTimeString:String!
    var cityString:String!
    var imageLocationString:String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
        convertDateFormatter(date: dateAndTimeString)
        title = titleString
        
        let backbutton = UIButton(type: .custom)
        backbutton.setImage(UIImage(named: "BackButton.png"), for: .normal)
        backbutton.setTitle("Back", for: .normal)
        backbutton.setTitleColor(backbutton.tintColor, for: .normal)
        backbutton.addTarget(self, action: Selector(("backAction")), for: .touchUpInside)
        
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(customView: backbutton)
        print(imageLocationString)
        
        if imageLocationString != nil {
            if let url = URL.init(string: imageLocationString) {
                imgView.downloadedFrom(url: url)
            } else {
                if imageLocationString == nil {
                    let imgView = #imageLiteral(resourceName: "defaultPlaceholder.png")
                }
            }
            imgView.layer.cornerRadius = 10
            imgView.clipsToBounds = true
            
        }
    }
    

    @IBAction func backAction(_ sender: Any) {
        let _ = self.navigationController?.popViewController(animated: true)
    }

    override func viewWillAppear(_ animated: Bool) {
        navigationController?.isNavigationBarHidden = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        navigationController?.isNavigationBarHidden = false
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

    }
    
    func convertDateFormatter(date: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss"
        dateFormatter.timeZone = NSTimeZone(name: "UTC") as! TimeZone
        
        guard let date = dateFormatter.date(from: date) else {
            assert(false, "no date from string")
            return ""
        }
        
        dateFormatter.dateFormat = "EEE, dd MMM hh:mm a"
        dateFormatter.timeZone = TimeZone.current as! TimeZone
        dateTimeLabel.text = dateFormatter.string(from: date)
        return dateTimeLabel.text!
    }
    
    
    func updateUI() {
        dateTimeLabel.text = dateAndTimeString
        locationLabel.text = cityString
        titleLabel.text = titleString
    }
    
}
