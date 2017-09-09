//
//  TableViewCell.swift
//  HACodingChallenge
//
//  Created by Chris Conner on 9/6/17.
//  Copyright © 2017 Chris Conner. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {
    
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var dateTimeLabel: UILabel!
    
    var imageLocationString:String!
    
    func setEvent(event: Event) {   
        titleLabel.text = event.title
        locationLabel.text = event.location
        imageLocationString = event.locationImage
        
        if imageLocationString != nil {
            if let url = URL.init(string: imageLocationString) {
                imgView.downloadedFrom(url: url)
            } else {
                if imageLocationString == nil {
                    let imgView = #imageLiteral(resourceName: "defaultPlaceholder.png")
                }
            }
        }
        
        imgView.layer.cornerRadius = 12
        imgView.clipsToBounds = true
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
    
}
