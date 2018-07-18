//
//  MoreTabViewController.swift
//  UnitConverterApp
//
//  Created by joel ureellanah on 14/03/2018.
//  Copyright © 2018 joel ureellanah. All rights reserved.
//

import Foundation
import UIKit

let list = ["Constants", "History"]
var myIndex = 0

class MoreTabViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var table: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        table.tableFooterView = UIView(frame: CGRect.zero)//don't display empty row
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) { //put the tab bar to its original position
        var tabBarFrame: CGRect = CGRect(x: self.view.frame.minX, y: self.view.frame.maxY, width: self.view.frame.width, height: 30.0)
        tabBarFrame.origin.y = self.view.frame.maxY
        self.tabBarController?.tabBar.frame = tabBarFrame
    }
    
    public func tableView(_ tableview: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.count
    }
    
    public func tableView(_ tableview: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: "ListCell")
        cell.textLabel?.text = list[indexPath.row]
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 0 {
            myIndex = indexPath.row
            performSegue(withIdentifier: "Constants_Segue", sender: self)
            tableView.deselectRow(at: indexPath, animated: true) //deselect pressed row
        } else if indexPath.row == 1 {
            myIndex = indexPath.row
            performSegue(withIdentifier: "History_Segue", sender: self)
            tableView.deselectRow(at: indexPath, animated: true) //deselect pressed row
        }
        
    }
    
}
