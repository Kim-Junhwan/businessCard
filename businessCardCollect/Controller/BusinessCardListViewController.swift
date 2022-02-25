//
//  businessCardListViewController.swift
//  businessCardCollect
//
//  Created by JunHwan Kim on 2022/02/22.
//

import UIKit
import CoreData

class BusinessCardListViewController: UITableViewController {
    var card : Profile?
    var cardList = [Profile]()
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext

    let datapath = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(datapath)
        tableView.register(UINib(nibName: "BusinessCardCell", bundle: nil), forCellReuseIdentifier: "ReusableCell")
        loadProfile()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        loadProfile()
    }

    // MARK: - Table view data source


    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return cardList.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ReusableCell", for: indexPath) as! BusinessCardCell
        cell.nameLabel.text = cardList[indexPath.row].name
        cell.cooperationLabel.text = cardList[indexPath.row].workPlace
        cell.phoneNumberLabel.text = cardList[indexPath.row].phoneNumber
        return cell
    }
    
    override func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let delete = UIContextualAction(style: .normal, title: "Delete") { (UIContextualAction, UIView, success: @escaping (Bool) -> Void) in
            self.context.delete(self.cardList[indexPath.row])
            self.cardList.remove(at: indexPath.row)
            self.saveProfile()
                }
        delete.backgroundColor = .systemPink
        return UISwipeActionsConfiguration(actions:[delete])
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        card = cardList[indexPath.row]
        performSegue(withIdentifier: "goToBusinessCard", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToBusinessCard"{
            let vc = segue.destination as! BusinessCardViewController
            vc.profile = card
        }
    }
    
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        performSegue(withIdentifier: "goToAddProfile", sender: self)
    }
    
    func loadProfile(){
        let request : NSFetchRequest<Profile> = Profile.fetchRequest()
        do{
            cardList = try context.fetch(request)
        }catch{
            print("error load data")
        }
        tableView.reloadData()
    }
    
    func saveProfile(){
        do{
            try context.save()
        }catch{
            print("profile saving error")
        }
        self.tableView.reloadData()
    }
    
    
    
}
