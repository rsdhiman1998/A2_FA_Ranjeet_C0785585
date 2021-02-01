//
//  ProductViewController.swift
//  A2_FA_Ranjeet_C0785585
//
//  Created by Harmeet on 01/02/21.
//

import UIKit
import CoreData
class ProductViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    
  
    @IBOutlet weak var editButton: UIBarButtonItem!
    @IBOutlet weak var typeLabel: UILabel!
    @IBOutlet weak var typeButton: UIButton!
    @IBOutlet weak var searchBar: UISearchBar!
    var isProduct = true
     var products = [Product]()
    var providers = [Provider]()
     let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
     
      let searchController = UISearchController(searchResultsController: nil)
     
     override func viewDidLoad() {
         super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
        deleteProducts()
        addProduct()
        
         loadProducts()
         searchBar.delegate = self
         
        headerLabel = "hello"
     }
    
    override func viewDidAppear(_ animated: Bool) {
        loadProducts()
        tableView.reloadData()
        
    }
     
     func loadProducts(predicate:NSPredicate? = nil ){
        if isProduct == true
        {
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
        else{
            let Prodrequest: NSFetchRequest<Provider> = Provider.fetchRequest()
            
                
            if let rsd = predicate{
                Prodrequest.predicate = rsd
            }
            
            do{
                providers = try context.fetch(Prodrequest)
                tableView.reloadData()
            }catch{
                print (error)
            }
        }
       
     }
    @IBAction func editClicked(_ sender: Any) {
        
        tableView.setEditing(!tableView.isEditing, animated: true)

               if tableView.isEditing {
                   self.editButton.title = "Done"
               } else {
                   self.editButton.title = "Edit"
               }
    }
    
    func deleteProducts() {
        let Prodrequest: NSFetchRequest<NSFetchRequestResult> = Product.fetchRequest()
        let delReq = NSBatchDeleteRequest(fetchRequest: Prodrequest)

        do{
            try context.execute(delReq)
            tableView.reloadData()
        }catch{
            print("Can not load data \(error.localizedDescription)")
        }
        
        let Providerrequest: NSFetchRequest<NSFetchRequestResult> = Provider.fetchRequest()
        let delReq1 = NSBatchDeleteRequest(fetchRequest: Providerrequest)

        do{
            try context.execute(delReq1)
            tableView.reloadData()
        }catch{
            print("Can not load data \(error.localizedDescription)")
        }
    }
     
//
     var headerLabel = "ewrdf"
//      func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
//             let headerView = UIView.init(frame: CGRect.init(x: 0, y: 0, width: tableView.frame.width, height: 70))
//
//             let label = UILabel()
//             label.frame = CGRect.init(x: 20, y: -10, width: headerView.frame.width-10, height: headerView.frame.height-10)
//             label.text = headerLabel
//         label.font = UIFont.systemFont(ofSize: 24)
//
//
//             headerView.addSubview(label)
//
//             return headerView
//         }
//
//
//      func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
//         let footerView = UIView(frame: CGRect(x: 0, y: 0, width: tableView.frame.size.width, height: 50))
//         let label = UILabel()
//         label.frame = CGRect.init(x: 20, y: 10, width: footerView.frame.width-10, height: footerView.frame.height-10)
//         label.text = headerLabel
//     label.font = UIFont.systemFont(ofSize: 24)
//
//         footerView.backgroundColor = UIColor.blue
//         footerView.addSubview(label)
//         return footerView
//     }
//
   

     
  
     func addProduct(){
//         let Prodrequest: NSFetchRequest<NSFetchRequestResult> = Product.fetchRequest()
//         let delReq = NSBatchDeleteRequest(fetchRequest: Prodrequest)
//
//         do{
//             try context.execute(delReq)
//             tableView.reloadData()
//         }catch{
//             print("Can not load data \(error.localizedDescription)")
//         }
         
         let newProduct = Product(context: context)
         newProduct.prodName = "Oneplus Nord"
         newProduct.prodId = 11
         newProduct.prodPrice = 399
         newProduct.prodDesc = "This is the description of Oneplus Nord . It is the latest Mobile phone introduced by One plus company . Bass is very deep and vocal are somewhat clear."
         newProduct.prodProvider = "Oneplus"
         products.append(newProduct)
         
         let newProduct1 = Product(context: context)
         newProduct1.prodName = "Mac Book Air"
         newProduct1.prodId = 12
         newProduct1.prodPrice = 1019
         newProduct1.prodDesc = "This is the description of Mac book Air. it has 4gb ram and 512 gb flash drive"
         newProduct1.prodProvider = "Apple"
         products.append(newProduct1)
         
         let newProduct2 = Product(context: context)
         newProduct2.prodName = "Samsung s20"
         newProduct2.prodId = 13
         newProduct2.prodPrice = 149
         newProduct2.prodDesc = "This is the description of Samsung s20 . It is the latest Mobile phone introduced by Samsung company . Bass is very deep and vocal are somewhat clear."
         newProduct2.prodProvider = "Benq"
         products.append(newProduct2)
         
         let newProduct3 = Product(context: context)
         newProduct3.prodName = "CosmicByte RGB Gaming Keyboard"
         newProduct3.prodId = 14
         newProduct3.prodPrice = 50
         newProduct3.prodDesc = "This is the description of Cosmic byte rgb keuboard. it has various typs of color in his keyboard. design is fit for gamers "
         newProduct3.prodProvider = "CosmicByte"
         products.append(newProduct3)
         
         
         let newProduct4 = Product(context: context)
         newProduct4.prodName = "Redmi note 9"
         newProduct4.prodId = 15
         newProduct4.prodPrice = 39
         newProduct4.prodDesc = "This is the description of Redmi note 9. It is the latest Mobile phone introduced by Redmi company . Bass is very deep and vocal are somewhat clear."
         newProduct4.prodProvider = "CosmicByte"
         products.append(newProduct4)
         
         let newProduct5 = Product(context: context)
         newProduct5.prodName = "RedGear Scream Headphones"
         newProduct5.prodId = 16
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
         newProduct7.prodName = "Realme 6 pro"
         newProduct7.prodId = 18
         newProduct7.prodPrice = 799
         newProduct7.prodDesc = "This is the description of Realme 6 pro . It is the latest Mobile phone introduced by Realme company . Bass is very deep and vocal are somewhat clear."
         newProduct7.prodProvider = "Oneplus"
         products.append(newProduct7)
         
         let newProduct8 = Product(context: context)
         newProduct8.prodName = "OnePLus 6t pro"
         newProduct8.prodId = 119
         newProduct8.prodPrice = 7998
         newProduct8.prodDesc = "Thisis the description of one plus's lates flagship phone. it has the curved screen with 120 hertz display. it has th laser focus 3 camera setup"
         newProduct8.prodProvider = "Oneplus"
         products.append(newProduct8)
         
         let newProduct9 = Product(context: context)
         newProduct9.prodName = "OnePlus pro"
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
        
        
        for item in products {
            
            var isExists = false
            let result = providers.filter { $0.name == item.prodProvider}
            if result.isEmpty {
                let newProvider = Provider(context: context)
                newProvider.name = item.prodProvider
                providers.append(newProvider)
            }
           
          
         
        }
        
        do{
            try context.save()
           
            tableView.reloadData()
        }catch{
            print("Can not load data \(error.localizedDescription)")
        }
     }

     // MARK: - Table view data source

      func numberOfSections(in tableView: UITableView) -> Int {
         // #warning Incomplete implementation, return the number of sections
         return 1
     }

      func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
         // #warning Incomplete implementation, return the number of rows
        return isProduct ? products.count : providers.count
         
     }

    
      func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
         let cell = tableView.dequeueReusableCell(withIdentifier: "prodCell1", for: indexPath)

        cell.textLabel?.text = isProduct == true ? products[indexPath.row].prodName : providers[indexPath.row].name

         return cell
     }
     

     /*
     // Override to support conditional editing of the table view.
     override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
         // Return false if you do not want the specified item to be editable.
         return true
     }
     */

     
     // Override to support editing the table view.
      func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
         if editingStyle == .delete {
            if isProduct == true
            {
                deleteProduct(product: products[indexPath.row])
                         
                products.remove(at: indexPath.row)
                 tableView.deleteRows(at: [indexPath], with: .fade)
            }
           
         } else if editingStyle == .insert {
             // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
         }
     }
    
    func deleteProduct(product: Product) {
         context.delete(product)
     }
    
  
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
     
     
     func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
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
        print(segue.identifier)
        if isProduct == true
        {
            
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
        else{
            
            
                if let destination = segue.destination as? ProviderProductsViewController {
                    //  destination.delegate = self
//                      
//                     if let cell = sender as? UITableViewCell {
//                          if let index = tableView.indexPath(for: cell)?.row {
//                              let producta = providers[index]
//                              destination.providerName = producta.name!
//                          }
//                     }
                     
                  }
                
                
              
           
        }
 }
     
     
     
     
     @IBAction func addBtn(_ sender: Any) {
         performSegue(withIdentifier: "nextPage", sender: UIButton())
     }
    
    @IBAction func typeChange(_ sender: Any) {
     if isProduct == true
     {
        isProduct = false
        typeLabel.text = "Providers"
        typeButton.setTitle("Show Products", for: .normal)
     }
     else{
        isProduct = true
        typeLabel.text = "Products"
        typeButton.setTitle("Show Providers", for: .normal)
     }
        loadProducts()
        tableView.reloadData()
        
    }
 }
 extension ProductViewController: UISearchBarDelegate {
     
     
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
             
        
             loadProducts()
             
             DispatchQueue.main.async {
                 searchBar.resignFirstResponder()
             }
         }
         else{
            
            if(isProduct == true)
            {
                let predicate = NSPredicate(format: "prodName CONTAINS[cd] %@", searchBar.text!)
                loadProducts(predicate: predicate)
            }
            else
            {
                let predicate = NSPredicate(format: "name CONTAINS[cd] %@", searchBar.text!)
                loadProducts(predicate: predicate)
            }
            
         
            
         }
        
     }
     


    

}
