//
//  BusinessCardViewController.swift
//  businessCardCollect
//
//  Created by JunHwan Kim on 2022/02/23.
//

import Foundation
import UIKit


class BusinessCardViewController : UIViewController{
    var profile : Profile?
    
    @IBOutlet weak var userImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var phoneNumberLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var workPlaceLabel: UILabel!
    @IBOutlet weak var rankLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(red: 0.30, green: 0.82, blue: 0.22, alpha: 1.00)
        if let safeProfile = profile{
            nameLabel.text = safeProfile.name!
            phoneNumberLabel.text = safeProfile.phoneNumber!
            emailLabel.text = safeProfile.email!
            workPlaceLabel.text = safeProfile.workPlace!
            rankLabel.text = safeProfile.rank!
        }
        userImage.layer.cornerRadius = userImage.frame.height/2
        userImage.clipsToBounds = true
    }
    
}
