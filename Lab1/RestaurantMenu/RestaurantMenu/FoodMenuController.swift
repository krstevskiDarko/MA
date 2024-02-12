//
//  FoodMenuController.swift
//  RestaurantMenu
//
//  Created by Darko Krstevski on 12.2.24.
//

import UIKit

class FoodMenuController: UIViewController {

    @IBOutlet weak var tableView: UITableView?
    
    var foodItems:Array<MenuItem> = []
    
    let foodcellid = "myFoodCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let item1 = MenuItem(image: "pizza", name: "Pizza", description: "Delicious Pizza with tomato sauce")
        let item2 = MenuItem(image: "burger", name: "Burger", description: "Delicious Burger with burger sauce")
        let item3 = MenuItem(image: "spagetthi", name: "Spaghetti", description: "Delicious Spaghetti with garlic sauce")
        foodItems = [item1,item2,item3]
        // Do any additional setup after loading the view.
        
        tableView?.delegate = self
        tableView?.dataSource = self
    }
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        
        if (segue.identifier == "showMenuItemSegue"){
            
            let vc = segue.destination as!
                MenuItemViewController
            
            let selectedIndex = tableView?.indexPathForSelectedRow?.row
            
            vc.itemData = foodItems[selectedIndex!]
        }
    }
    

}

extension FoodMenuController : UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return foodItems.count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: self.foodcellid, for: indexPath) as! FoodTableViewCell
        

        let menuItem = foodItems[indexPath.row]
        cell.foodLabel?.text = menuItem.name
        cell.foodImage?.image = menuItem.image
        
        return cell
    }
    
    
}
