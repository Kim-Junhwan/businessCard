//
//  AddProfileController.swift
//  businessCardCollect
//
//  Created by JunHwan Kim on 2022/02/22.
//

import Foundation
import UIKit
import CoreData

class AddProfileController : UIViewController{
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    @IBOutlet weak var textFieldname: UITextField!
    @IBOutlet weak var workPlace: UITextField!
    @IBOutlet weak var phoneNumber: UITextField!
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var rank: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(red: 0.98, green: 0.77, blue: 0.19, alpha: 1.00)
    }
    
    @IBAction func pressedAddButton(_ sender: UIButton) {
        print("Pressed Add Button")
        let newProfile = Profile(context: self.context)
        newProfile.name = textFieldname.text!
        newProfile.phoneNumber = phoneNumber.text!
        newProfile.workPlace = workPlace.text!
        newProfile.email = email.text!
        newProfile.rank = rank.text!
        saveProfile()
        navigationController?.popToRootViewController(animated: true)
        
        }
    
    func saveProfile(){
        do{
            try context.save()
        }catch{
            print("profile saving error")
        }
    }
}
