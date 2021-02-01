//
//  ProductVC.swift
//  A2_FA_Ranjeet_C0785585
//
//  Created by Ranjeet Singh on 31/01/21.
//

import UIKit
import CoreData
class ProductVC: UITableViewController {

   
    @IBOutlet weak var searchBar: UISearchBar!
    
    var products = [Product]()
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
     let searchController = UISearchController(searchResultsController: nil)
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
         addProduct()
        loadProducts()
        searchBar.delegate = self
        self.navigationItem.rightBarButtonItem = self.editButtonItem
       headerLabel = "hello"
    }
    
    func loadProducts(predicate:NSPredicate? = nil ){
        let Prodrequest: NSFetchRequest<Product> = Product.fetchRequest()
        
            let sort = NSSortDescriptor(key: "prodId", ascending: true)
            Prodrequest.sortDescriptors = [sort]
        if let rsd = predicate{
            Prodrequest.predicate = rsd
        }
        
        do{
            products = try context.fetch(Prodrequest)
            tableView.reloadData()
        }catch{
            print (error)
        }
    }
    
    
    var headerLabel = "ewrdf"
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
            let headerView = UIView.init(frame: CGRect.init(x: 0, y: 0, width: tableView.frame.width, height: 70))

            let label = UILabel()
            label.frame = CGRect.init(x: 20, y: -10, width: headerView.frame.width-10, height: headerView.frame.height-10)
            label.text = headerLabel
        label.font = UIFont.systemFont(ofSize: 24)


            headerView.addSubview(label)

            return headerView
        }
    
    
    override func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let footerView = UIView(frame: CGRect(x: 0, y: 0, width: tableView.frame.size.width, height: 50))
        let label = UILabel()
        label.frame = CGRect.init(x: 20, y: 10, width: footerView.frame.width-10, height: footerView.frame.height-10)
        label.text = headerLabel
    label.font = UIFont.systemFont(ofSize: 24)

        footerView.backgroundColor = UIColor.blue
        footerView.addSubview(label)
        return footerView
    }
    
  

    
 
    func addProduct(){

        let newProduct = Product(context: context)
        newProduct.prodName = "Oneplus Buds Pro"
        newProduct.prodId = 111
        newProduct.prodPrice = 399
        newProduct.prodDesc = "This is the description of Oneplus buds pro. they are laets buds from the company. Bass is very deep and vocal are somewhat clear."
        newProduct.prodProvider = "Oneplus"
        products.append(newProduct)
        
        let newProduct1 = Product(context: context)
        newProduct1.prodName = "Mac Book Air"
        newProduct1.prodId = 112
        newProduct1.prodPrice = 1019
        newProduct1.prodDesc = "This is the description of Mac book Air. it has 4gb ram and 512 gb flash drive"
        newProduct1.prodProvider = "Apple"
        products.append(newProduct1)
        
        let newProduct2 = Product(context: context)
        newProduct2.prodName = "Benq GW2270 Monitor"
        newProduct2.prodId = 113
        newProduct2.prodPrice = 149
        newProduct2.prodDesc = "This is the description of Benq 22 inch model monitor . it has built in speakers and 2 hdmi ports with one vga port. Monitor has 1080p resolution"
        newProduct2.prodProvider = "Benq"
        products.append(newProduct2)
        
        let newProduct3 = Product(context: context)
        newProduct3.prodName = "CosmicByte RGB Gaming Keyboard"
        newProduct3.prodId = 114
        newProduct3.prodPrice = 50
        newProduct3.prodDesc = "This is the description of Cosmic byte rgb keuboard. it has various typs of color in his keyboard. design is fit for gamers "
        newProduct3.prodProvider = "CosmicByte"
        products.append(newProduct3)
        
        
        let newProduct4 = Product(context: context)
        newProduct4.prodName = "CosmicByte Gaming Mouse"
        newProduct4.prodId = 115
        newProduct4.prodPrice = 39
        newProduct4.prodDesc = "This is the description of Cosmic byte gaming mouse. this mouse has 3 rgb lights, and has 5 buttons "
        newProduct4.prodProvider = "CosmicByte"
        products.append(newProduct4)
        
        let newProduct5 = Product(context: context)
        newProduct5.prodName = "RedGear Scream Headphones"
        newProduct5.prodId = 116
        newProduct5.prodPrice = 89
        newProduct5.prodDesc = "This is the description of Redgear gaming headphones. model name is Scream, this also has RGB and vibration motor for Deep Bass"
        newProduct5.prodProvider = "Redgear"
        products.append(newProduct5)
        
        let newProduct6 = Product(context: context)
        newProduct6.prodName = "OnePlus 5t"
        newProduct6.prodId = 117
        newProduct6.prodPrice = 699
        newProduct6.prodDesc = "This is the description of Oneplus 5t. this is predecessor of one plus 5 phone. it has 8gb ram and 128 gb fast storage . this phone has dual camera setup for fantastic captures"
        newProduct6.prodProvider = "Oneplus"
        products.append(newProduct6)
        
        let newProduct7 = Product(context: context)
        newProduct7.prodName = "OnePLus 8t pro"
        newProduct7.prodId = 118
        newProduct7.prodPrice = 799
        newProduct7.prodDesc = "This is the description of one plus's latest flagship phone. it has the curved screen with 120 hertz display. it has th laser focus 3 camera setup"
        newProduct7.prodProvider = "Oneplus"
        products.append(newProduct7)
        
        let newProduct8 = Product(context: context)
        newProduct8.prodName = "OnePLus t pro"
        newProduct8.prodId = 119
        newProduct8.prodPrice = 7998
        newProduct8.prodDesc = "Thisis the description of one plus's lates flagship phone. it has the curved screen with 120 hertz display. it has th laser focus 3 camera setup"
        newProduct8.prodProvider = "Oneplus"
        products.append(newProduct8)
        
        let newProduct9 = Product(context: context)
        newProduct9.prodName = "OnePLus  pro"
        newProduct9.prodId = 120
        newProduct9.prodPrice = 799
        newProduct9.prodDesc = "This is the description of one plus's latest flagship phone. it has the curved screen with 120 hertz display. it has th laser focus 3 camera setup"
        newProduct9.prodProvider = "Oneplus"
        products.append(newProduct9)
        
        
        do{
            try context.save()
            tableView.reloadData()
        }catch{
            print("Can not load data \(error.localizedDescription)")
        }
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return products.count
        
    }

   
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "prodCell", for: indexPath)

        cell.textLabel?.text = products[indexPath.row].prodName

        return cell
    }
    

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

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        
            return true
        
           }
    
    
   override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
         tableView.deselectRow(at: indexPath, animated: true)

         let row = indexPath.row
  
 //   let storyBoard: UIStoryboard = UIStoryboard(name: "ProductDescStoryboard", bundle: nil)
  //  let newViewController = storyBoard.instantiateViewController(withIdentifier: "prod_desc") as! ProductDescViewController
  //  newViewController.product = products[row]
           // self.present(newViewController, animated: true, completion: nil)
//    let newViewController = ProductDescViewController();   newViewController.product = products[indexPath.row]
//    self.navigationController?.pushViewController(newViewController, animated: true)
//        performSegue(withIdentifier: "showDesc", sender: _)

     }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        if let destination = segue.destination as? ProductDescViewController {
          //  destination.delegate = self
            
           if let cell = sender as? UITableViewCell {
                if let index = tableView.indexPath(for: cell)?.row {
                    let producta = products[index]
                   destination.product = producta
                }
           }
           
        }
}
    
    
    
    
    @IBAction func addBtn(_ sender: Any) {
        performSegue(withIdentifier: "nextPage", sender: UIButton())
    }
}
extension ProductVC: UISearchBarDelegate {
    
    
    /// search button on keypad functionality
    /// - Parameter searchBar: search bar is passed to this function
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        // add predicate
        let predicate = NSPredicate(format: "prodName CONTAINS[cd] %@", searchBar.text!)
        loadProducts(predicate: predicate)
    }
    
    
    /// when the text in text bar is changed
    /// - Parameters:
    ///   - searchBar: search bar is passed to this function
    ///   - searchText: the text that is written in the search bar
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchBar.text?.count == 0 {
            
            let predicate = NSPredicate(format: "prodName CONTAINS[cd] %@", searchBar.text!)
            loadProducts(predicate: predicate)
            
            DispatchQueue.main.async {
                searchBar.resignFirstResponder()
            }
        }
       
    }
    
}
