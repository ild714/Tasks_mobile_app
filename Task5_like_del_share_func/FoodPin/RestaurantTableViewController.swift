//
//  RestaurantTableViewController.swift
//  FoodPin
//
//  Created by Ильдар Нигметзянов on 26/07/2019.
//  Copyright © 2019 Learning with Swift. All rights reserved.
//

import UIKit

class RestaurantTableViewController: UITableViewController {

    var restaurantNames = ["Cafe Deadend","Homei","Teakha","Cafe Loisl","Petite Oyster","For Kee Restaurant","Po's Atelier","Bourke Street Bakery","Haigh's Chocolate","Palomino Espresso","Upstate","Traif","Graham Avenue Meats","Waffle & Wolf","Five Leaves","Cafe Lore","Confessional","Barrafina","Donostia","Royal Oak","CASK Pub and Kitchen"]
    
    var restaurantImages = ["cafedeadend","homei","teakha","cafeloisl","petiteoyster","forkeerestaurant","posatelier","bourkestreetbakery","haighschocolate","palominoespresso","upstate","traif","grahamavenuemeats","wafflewolf","fiveleaves","cafelore","confessional","barrafina","donostia","royaloak","caskpubkitchen"]
    
    var restaurantLocations = ["Hong Kong","Hong Kong","Hong Kong","Hong Kong","Hong Kong","Hong Kong","Hong Kong","Sydney","Sydney","Sydney","New York","New York","New York","New York","New York","New York","New york","London","London","London","London"]
    
    var restaurantTypes = ["Coffee & Tea Shop","Cafe","Tea House","Austrian / Causual Drink","French","Bakery","Bakery","Chocolate","Cafe","American/Seafood","American","American","Breakfast & Brunch","Coffee & Tea","Coffee & Tea","Latin American","Spanish","Spanish","Spanish","British","Thai"]
    
    var restaurantIsVisited = Array(repeating: false,count:21)
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.cellLayoutMarginsFollowReadableWidth = true
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return restaurantNames.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cellIdentifier = "Cell"
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! RestaurantTableViewCell

        
        
        cell.nameLabel.text = restaurantNames[indexPath.row]
        cell.thumbnailImageView.image = UIImage(named:restaurantImages[indexPath.row])
        cell.locationLabel.text = restaurantLocations[indexPath.row]
        cell.typeLabel.text = restaurantTypes[indexPath.row]
        
        if restaurantIsVisited[indexPath.row] {
            cell.like.isHidden = false
        } else {
            cell.like.isHidden = true
        }
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView,didSelectRowAt indexPath: IndexPath){
        
        let optionMenu = UIAlertController(title: nil,message:"What do you want to do?",preferredStyle: .actionSheet)
        
        if let popoverController = optionMenu.popoverPresentationController {
            if let cell = tableView.cellForRow(at: indexPath){
                popoverController.sourceView = cell
                popoverController.sourceRect = cell.bounds
            }
        }
        
        let callActionHandler = { (action:UIAlertAction!) -> Void in
            let alertMessage = UIAlertController(title:"Service Unavailable",message:"Sorry, the call feature is not avaliable yet. Please retry later.",preferredStyle: .alert)
            alertMessage.addAction(UIAlertAction(title:"Ok",style:.default,handler: nil))
            
            self.present(alertMessage,animated: true ,completion: nil)
        }
        
        let callAction = UIAlertAction(title:"Call"+"123-000-\(indexPath.row)",style:.default,handler: callActionHandler)
        
        optionMenu.addAction(callAction)
        
        let checkInAction = UIAlertAction(title:"Check in",style:.default,handler:{
            (action:UIAlertAction!) -> Void in
            
            let cell = tableView.cellForRow(at:indexPath) as! RestaurantTableViewCell
            
            self.restaurantIsVisited[indexPath.row] = self.restaurantIsVisited[indexPath.row] ? false : true
            cell.like.isHidden = self.restaurantIsVisited[indexPath.row] ? false : true
            
          
        })
        
        optionMenu.addAction(checkInAction)
        
        let cancelAction = UIAlertAction(title:"Cancel",style:.cancel,handler:nil)
        
        optionMenu.addAction(cancelAction)
        
        present(optionMenu,animated:true,completion: nil)
        
        tableView.deselectRow(at:indexPath,animated:false)
        
    }
   
    override func tableView(_ tableView: UITableView,  trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) ->UISwipeActionsConfiguration? {
        
        let deleteAction = UIContextualAction(style: .destructive,title:"Delete"){
            (action,sourceView,completionHandler) in
            self.restaurantNames.remove(at:indexPath.row)
            self.restaurantLocations.remove(at:indexPath.row)
            self.restaurantTypes.remove(at:indexPath.row)
            self.restaurantIsVisited.remove(at:indexPath.row)
            self.restaurantImages.remove(at:indexPath.row)
            
            self.tableView.deleteRows(at:[indexPath],with:.fade)
            
            completionHandler(true)
        }
        
        let shareAction = UIContextualAction(style:.normal,title:"Share" ){
            (action,sourceView,completionHandler) in
            let defaultText = "Just checking in at" + self.restaurantNames[indexPath.row]
            
            let activityController: UIActivityViewController
            
            if let imageToShare = UIImage(named:self.restaurantImages[indexPath.row]) {
                activityController = UIActivityViewController(activityItems:[defaultText,imageToShare],applicationActivities: nil)
            } else {
                activityController = UIActivityViewController(activityItems:[defaultText],applicationActivities:nil)
            }
            
            if let popoverController = activityController.popoverPresentationController {
                if let cell = tableView.cellForRow(at:indexPath) {
                    popoverController.sourceView = cell
                    //popoverController.sourceRect = cell.bounds
                }
            }
            
            self.present(activityController,animated: true ,completion: nil)
            completionHandler(true)
        }
        
        deleteAction.backgroundColor = UIColor(red:255.0/255.0,green: 77.0/255.0,blue:69.0/255.0,alpha:1.0)
        deleteAction.image = UIImage(named: "delite")
        
        shareAction.backgroundColor = UIColor(red:250.0/255.0,green: 183.0/255.0,blue:69.0/255.0,alpha: 1.0)
        shareAction.image = UIImage(named: "share")
        
        let swipeConfiguration = UISwipeActionsConfiguration(actions: [deleteAction,shareAction])
        
        return swipeConfiguration
    }

    override func tableView(_ tableView : UITableView,leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        let cell = tableView.cellForRow(at:indexPath) as! RestaurantTableViewCell
        
        if cell.like.isHidden == true {
        
        let likeOn = UIContextualAction(style:.normal,title:"like") {
            (action,sourceView,completionHandler) in
            
            
            cell.like.isHidden = false
            self.restaurantIsVisited[indexPath.row] = true
            
            /*
            cell.like.isHidden = self.restaurantIsVisited[indexPath.row] ? true : false
            self.restaurantIsVisited[indexPath.row] = cell.like.isHidden ? false : true
            */
            completionHandler(true)
        }
        
        likeOn.backgroundColor = UIColor(red:46.0/255.0,green: 204.0/255.0,blue: 113.0/255.0,alpha: 1.0)
        likeOn.image = UIImage(named:"tick")
        
        let swipe = UISwipeActionsConfiguration(actions: [likeOn])
        
        return swipe
        } else {
            let likeOff = UIContextualAction(style: . normal,title:"off") {
                (action,sourceView,complitionHandler) in
                cell.like.isHidden = true
                self.restaurantIsVisited[indexPath.row] = false
                
                complitionHandler(true)
            }
            
            likeOff.backgroundColor = UIColor(red:46.0/255.0,green: 204.0/255.0,blue: 113.0/255.0,alpha: 1.0)
            likeOff.image = UIImage(named: "undo")
            
            let swipe = UISwipeActionsConfiguration(actions: [likeOff])
            
            return swipe
        }
    }
    
    /*
    override func tableView(_ tableView:UITableView, commit editingStyle:UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == .delete {
            restaurantNames.remove(at:indexPath.row)
            restaurantLocations.remove(at:indexPath.row)
            restaurantTypes.remove(at:indexPath.row)
            restaurantIsVisited.remove(at:indexPath.row)
            restaurantImages.remove(at:indexPath.row)
        }
        
      
        tableView.deleteRows(at:[indexPath],with:.fade)
        
        print("Total item:\(restaurantNames.count)")
        for name in restaurantNames{
            print (name)
        }
    }
 
    */
 
    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
