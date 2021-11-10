//
//  TotalViewController.swift
//  ConsumptionTaxApp
//
//  Created by 高橋康之 on 2021/11/10.
//

import UIKit

class TotalViewController: UIViewController {
    var numArray:[Double] = []
    var totalNum:Double = 0
    @IBOutlet weak var totalLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        numArray = UserDefaults.standard.object(forKey: "add") as! [Double]
        print(numArray)
        totalNum = numArray.reduce(0) { (num1:Double, num2:Double) -> Double in
            return num1 + num2
        }
        totalLabel.text = String(format: "%.0f", totalNum)
    }
    
    @IBAction func backButton(_ sender: Any) {
        dismiss(animated: true, completion: nil)
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
