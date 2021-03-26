//
//  ViewController.swift
//  searchBar
//
//  Created by Mahmoud on 3/26/21.
//  Copyright © 2021 mahmoud. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    let arrayOfText = ["mahmoud","ahmed","ali","sameh","osama","mahmoud","ahmed","ali","sameh","osama"]
    
    var searchingArray  = [String]()
    
    var searching = false
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableview: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableview.delegate=self
        tableview.dataSource=self
        searchBar.delegate=self
        print(searching)
    }
    
    
    
    // tableview func
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if searching {
        return searchingArray.count
        }else {
             return arrayOfText.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell  = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        if searching{
             cell.textLabel?.text=searchingArray[indexPath.row]
        }else{
            cell.textLabel?.text=arrayOfText[indexPath.row]
        }
        
        return cell
        
    }


}

extension ViewController : UISearchBarDelegate {
    //  textDidChange() Tells the delegate that the user changed the search text.

    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        // $0 is a shortcut to mean "first argument" in a closure.
      searchingArray = arrayOfText.filter({$0.prefix(searchText.count)==searchText})
        searching = true
        tableview.reloadData()
        //
        print(searchText.count)
        print(searchText)
        print(searchingArray)
        
    }
}

