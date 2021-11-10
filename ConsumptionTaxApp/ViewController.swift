//
//  ViewController.swift
//  ConsumptionTaxApp
//
//  Created by 高橋康之 on 2021/11/09.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var textNum:String = ""
    var numArray:[Double] = []
    var totalNum:Double = 0
    let userDefaults = UserDefaults.standard
    
    @IBOutlet weak var consSelect: UISegmentedControl!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var addTableView: UITableView!
    @IBOutlet weak var numTextFierld: UITextField!
    @IBOutlet weak var totalLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addTableView.delegate = self
        addTableView.dataSource = self
        numArray.removeAll()
    }
    
    @IBAction func consSelectButton(_ sender: Any) {
        if consSelect.selectedSegmentIndex == 0 {
            cal(num: 1.1)
        } else {
            cal(num: 1.08)
        }
    }
    
    @IBAction func addButton(_ sender: Any) {
        
        if numTextFierld.text != "" {
            
            if consSelect.selectedSegmentIndex == 0 {
                calculation(num: 1.1)
            } else {
                calculation(num: 1.08)
            }
        } else {
            return
        }
        self.addTableView.reloadData()
    }
    
    func cal(num:Double) {
        let consNum = Double(numTextFierld.text!)!
        let ansNum = consNum * Double(num)
        totalLabel.text = String(format: "%.0f", ansNum)
    }
    
    func calculation(num:Double) {
        let consNum = Double(numTextFierld.text!)!
        let ansNum = consNum * Double(num)
        numArray.append(ansNum)
        let userDefaults = UserDefaults.standard
        userDefaults.set(numArray, forKey: "add")
        numTextFierld.text = ""
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return numArray.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "AddCell", for: indexPath)
        cell.textLabel?.text = "\(numArray[indexPath.row])"
        return cell
    }
    
    
}

