//
//  MarcasTableViewController.swift
//  Fipe
//
//  Created by Kako Botasso on 07/04/17.
//  Copyright © 2017 Kako Botasso. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class MarcasTableViewController: UITableViewController {

    let url = "https://fipeapi.appspot.com/api/1/carros/marcas.json"
    var marcas: [Marca] = []
    var arrRes = [[String:AnyObject]]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        Alamofire.request(url).responseJSON { (responseData) -> Void in
            if((responseData.result.value) != nil) {
                let swiftyJsonVar = JSON(responseData.result.value!)
                
                if let itens = swiftyJsonVar.arrayObject {
                    self.arrRes = itens as! [[String:AnyObject]]
                }
                
                self.arrRes.forEach { item in
                    let marca = Marca(name: item["name"]! as! String,
                                      fipeName: item["fipe_name"]! as! String,
                                      order: item["order"]! as! Int,
                                      key: item["key"]! as! String,
                                      id: item["id"]! as! Int)
                    
                    self.marcas.append(marca)
                    self.tableView.reloadData()
                }
            
            }
        }
    }

    
    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.marcas.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)

        let marca = marcas[indexPath.row]
        cell.textLabel!.text = marca.fipeName!
        
        return cell
    }
    

}
