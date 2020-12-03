//
//  FeedBackScreenViewController.swift
//  NetBanking
//
//  Created by Tarun Reddy on 2020-12-02.
//

import UIKit

class FeedBackScreenViewController: UIViewController {
    @IBOutlet weak var ratingLabel1: UILabel!
    
    @IBOutlet weak var ratingLabel2: UILabel!
    @IBOutlet weak var ratingText: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        //setting the rating label hidden true
        ratingLabel1.isHidden = true
        ratingLabel2.isHidden = true
    }
    

    @IBAction func submitFeedBack(_ sender: UISlider) {
        // displaying the rating given
        ratingLabel1.isHidden = false
        ratingLabel2.isHidden = false
        ratingText.text = String(sender.value.rounded())
    }
}
