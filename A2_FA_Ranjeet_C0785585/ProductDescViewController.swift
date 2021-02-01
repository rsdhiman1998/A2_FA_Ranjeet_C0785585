//
//  ProductDescViewController.swift
//  A2_FA_Ranjeet_C0785585
//
//  Created by Ranjeet Singh on 31/01/21.
//

import UIKit
import CoreData
class ProductDescViewController: UIViewController  {
    var product = Product()
    
    @IBOutlet weak var Name: UITextField!
    
    @IBOutlet weak var ID: UITextField!
    @IBOutlet weak var Provider1: UITextField!
    @IBOutlet weak var Price: UITextField!
    @IBOutlet weak var Desc: UITextView!
    

    @IBOutlet weak var UpdateButton: UIButton!
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
       
        Name.text = product.prodName!
        ID.text = String(product.prodId)
        Price.text = String(product.prodPrice)
        Provider1.text = product.prodProvider
        Desc.text = product.prodDesc
        
    }
    
    @IBOutlet weak var errorLabel: UILabel!
    
    func loadProviders(predicate: NSPredicate? = nil) {
        let ProviderStr = Provider1.text!
           let request: NSFetchRequest<Provider> = Provider.fetchRequest()
            request.predicate = NSPredicate(format: "name = %@", ProviderStr)
           do {
               
            let results = try? context.fetch(request)

            if results?.count == 0 {
                
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
    
    
    @IBAction func update_clicked(_ sender: Any) {
        
         let productExisted: Product!

         let fetchUser: NSFetchRequest<Product> = Product.fetchRequest()
        fetchUser.predicate = NSPredicate(format: "prodId = %@", String(product.prodId))

         let results = try? context.fetch(fetchUser)

         if results?.count == 0 {
            // here you are inserting
            productExisted = Product(context: context)
         } else {
            // here you are updating
            productExisted = results?.first
         }
        
        let providerText = Provider1.text!
        let name1 = Name.text!
        
        let Id = ID.text!
        let price1 = Price.text!
        let Descr = Desc.text!
        if(name1.isEmpty)
        {
            errorLabel.text = "Please enter product name"
        }
        else if(Id.isEmpty)
        {
            errorLabel.text = "Please enter product Id"
        }
        else if(price1.isEmpty)
        {
            errorLabel.text = "Please enter product price"
            
        }
        else if(providerText.isEmpty)
        {
            errorLabel.text = "Please enter product provider"

        }
        else if(Descr.isEmpty)
        {
            errorLabel.text = "Please enter product description"

        }
        else{
            
            
            loadProviders()

            let price = Int32(Price.text!)
            productExisted.prodDesc = Desc.text
            productExisted.prodName = Name.text
            productExisted.prodPrice = price!
//            productExisted.prodProvider = Provider1.text
            
            do{
                try context.save()
                navigationController?.popViewController(animated: true)
                
            }catch{
                print("Can not load data \(error.localizedDescription)")
            }
        }
      
        
        
        
    }

    
    
     
}
