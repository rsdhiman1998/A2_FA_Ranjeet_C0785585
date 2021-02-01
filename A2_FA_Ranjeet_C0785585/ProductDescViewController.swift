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
    @IBOutlet weak var Provider: UITextField!
    @IBOutlet weak var Price: UITextField!
    @IBOutlet weak var Desc: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
       
        
       
        Name.text = product.prodName!
       ID.text = String(product.prodId)
        Price.text = String(product.prodPrice)
        Provider.text = product.prodProvider
        Desc.text = product.prodDesc
        
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
