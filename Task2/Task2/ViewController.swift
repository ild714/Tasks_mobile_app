//
//  ViewController.swift
//  Task2
//
//  Created by Ильдар Нигметзянов on 07/06/2019.
//  Copyright © 2019 Ильдар Нигметзянов. All rights reserved.
//

import UIKit


class ViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {
    
    var restaurantNames = ["Cafe Deadend","Cafe Loisl","Pretite Oyster","For Kee Restaurant","Po's Atelier","Bourke Street Bakery","Haigh's Chocolate","Palomino Espresso","Upstate","Traif","Graham Avenue Meats and Deli","Waffle & Wolf","Five Leaves","Donostia","Roral Oak","Cask Pub and Kitchen"]
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return restaurantNames.count
    }
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier="Cell"
        let cell = tableView.dequeueReusableCell(withIdentifier:cellIdentifier,for:indexPath)
        cell.textLabel?.text=restaurantNames[indexPath.row]
        
        cell.imageView?.image=UIImage(named:restaurantNames[indexPath.row])
        return cell 
    }
    
    override var prefersStatusBarHidden: Bool{
        return true
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

