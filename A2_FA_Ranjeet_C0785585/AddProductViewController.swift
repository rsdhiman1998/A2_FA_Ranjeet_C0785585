//
//  AddProductViewController.swift
//  A2_FA_Ranjeet_C0785585
//
//  Created by Ranjeet Singh on 01/02/21.
//

import UIKit
import CoreData
class AddProductViewController: UIViewController {
    
    
    
    var productList = [Product]()
    var providerList = [Provider]()
    @IBOutlet weak var name: UITextField!
    
    @IBOutlet weak var desc: UITextView!
    @IBOutlet weak var provider: UITextField!
    @IBOutlet weak var price: UITextField!
    @IBOutlet weak var id: UITextField!
    @IBOutlet weak var errorLabel: UILabel!
    @IBOutlet weak var addBtn: UIButton!
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext

//    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadProducts()

        // Do any additional setup after loading the view.
    }
    
    
    func loadProducts(predicate: NSPredicate? = nil) {
           let request: NSFetchRequest<Product> = Product.fetchRequest()

           do {
               productList = try context.fetch(request)
           } catch {
               print("Error loading notes \(error.localizedDescription)")
           }
           
       }
    
    var isProviderExists = false
    func loadProviders(predicate: NSPredicate? = nil) {
           let request: NSFetchRequest<Provider> = Provider.fetchRequest()

           do {
               
            let results = try? context.fetch(request)

            if results?.count == 0 {
                let ProviderStr = provider.text!
               // here you are inserting
                let providerInsert = Provider(context: context)
                providerInsert.name = ProviderStr
                do{
                    try context.save()
                   
                }catch{
                    print("Can not load data \(error.localizedDescription)")
                }
             
            } else {
               // here you are updating
             
            }

          
           } catch {
               print("Error loading notes \(error.localizedDescription)")
           }
           
       }

    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    @IBAction func addButton(_ sender: Any) {
        
        let Provider = provider.text!
        let name1 = name.text!
        
        let Id = id.text!
        let Price = price.text!
        let Descr = desc.text!
        if(name1.isEmpty)
        {
            errorLabel.text = "Please enter product name"
        }
        else if(Id.isEmpty)
        {
            errorLabel.text = "Please enter product Id"
        }
        else if(Price.isEmpty)
        {
            errorLabel.text = "Please enter product price"
            
        }
        else if(Provider.isEmpty)
        {
            errorLabel.text = "Please enter product provider"

        }
        else if(Descr.isEmpty)
        {
            errorLabel.text = "Please enter product description"

        }
        else{
            
            let predicate = NSPredicate(format: "name CONTAINS[cd] %@", Provider)   
            
            loadProviders(predicate: predicate)

            
            let newProduct = Product(context: context)
            newProduct.prodName = name1
            newProduct.prodId = Int32(Id)!
            newProduct.prodPrice = Int32(Price)!
            newProduct.prodDesc = Descr
            newProduct.prodProvider = Provider

            do{
                try context.save()
                navigationController?.popViewController(animated: true)
            }catch{
                print("Can not load data \(error.localizedDescription)")
            }
            
        
    }
    
}

}
