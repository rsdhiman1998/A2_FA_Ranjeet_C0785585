//
//  AddProductViewController.swift
//  A2_FA_Ranjeet_C0785585
//
//  Created by Ranjeet Singh on 01/02/21.
//

import UIKit
import CoreData
class AddProductViewController: UIViewController {
    
    
    var prod = Product()
    var prod1 = [Product]()
    @IBOutlet weak var name: UITextField!
    
    @IBOutlet weak var desc: UITextField!
    @IBOutlet weak var provider: UITextField!
    @IBOutlet weak var price: UITextField!
    @IBOutlet weak var id: UITextField!
    @IBOutlet weak var addBtn: UIButton!
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    override func viewDidLoad() {
        super.viewDidLoad()
        

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
    @IBAction func addButton(_ sender: Any) {
        let Provider = provider.text
        let name1 = name.text
        let Id = Int(id.text!)!
        let Price = Int(price.text!)!
        let Descr = desc.text
        if (prod.prodId == Id)
        {
        let newProduct = Product(context: context)
        newProduct.prodName = name1
        newProduct.prodId = Int32(Id)
        newProduct.prodPrice = Int32(Price)
        newProduct.prodDesc = Descr
        newProduct.prodProvider = Provider
        prod1.append(newProduct)
        do{
            try context.save()
            ///tableView.reloadData()
        }catch{
            print("Can not load data \(error.localizedDescription)")
        }
        
        
        
    }
    
}

}
