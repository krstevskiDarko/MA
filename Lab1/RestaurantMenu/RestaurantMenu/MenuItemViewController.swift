//
//  MenuItemViewController.swift
//  RestaurantMenu
//
//  Created by Darko Krstevski on 12.2.24.
//

import UIKit

class MenuItemViewController: UIViewController {

    @IBOutlet weak var menuItemLabel: UILabel!
    
    @IBOutlet weak var menuItemDescription: UITextField!
    
    @IBOutlet weak var menuItemImage: UIImageView!
    
    var itemData: MenuItem?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        menuItemLabel.text = itemData?.name ?? ""
        
        menuItemImage.image = itemData?.image ?? nil
        
        menuItemDescription.text = itemData?.description ?? ""
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
