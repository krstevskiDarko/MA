//
//  DrinksMenuViewController.swift
//  RestaurantMenu
//
//  Created by Darko Krstevski on 12.2.24.
//

import UIKit

class DrinksMenuViewController: UIViewController {
    
    @IBOutlet weak var drinksCollectionView: UICollectionView!
    
    var drinksItems:Array<MenuItem> = []
    
    var selected: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let item1 = MenuItem(image: "margarita", name: "Margarita", description: "Delicious beverage")
        let item2 = MenuItem(image: "beer", name: "Beer", description: "Delicious beverage")
        let item3 = MenuItem(image: "coffee", name: "Coffee", description: "Delicious beverage")
        let item4 = MenuItem(image: "coca-cola", name: "Coca-Cola", description: "Delicious beverage")
        let item5 = MenuItem(image: "tea", name: "Tea", description: "Delicious beverage")
        
        drinksItems.append(item1)
        drinksItems.append(item2)
        drinksItems.append(item3)
        drinksItems.append(item4)
        drinksItems.append(item5)
        
        drinksCollectionView.dataSource = self
        drinksCollectionView.delegate = self
        // Do any additional setup after loading the view.
    }
    
    
    
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        
        if segue.identifier == "drinksDetailSegue" {

            if let indexPath = drinksCollectionView.indexPathsForSelectedItems?.first {
                    let selectedItem = drinksItems[indexPath.row]
                    
                    if let vc = segue.destination as? MenuItemViewController {
                        vc.itemData = selectedItem
                    }
                }
            }
    }
    
    
}

extension DrinksMenuViewController : UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "drinksViewCell", for: indexPath) as! DrinksCollectionViewCell
        
        cell.layer.cornerRadius = self.view.frame.width/6
        
        cell.drinkImages.image = self.drinksItems[indexPath.row].image
        cell.drinkName.text = self.drinksItems[indexPath.row].name
        
        return cell
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let sz = self.view.frame
        
        return CGSize(width: sz.width/3, height: sz.width/3)
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return drinksItems.count
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        _ = drinksItems[indexPath.row]
        performSegue(withIdentifier: "drinksDetailSegue", sender: nil)
    }
    
    
}
