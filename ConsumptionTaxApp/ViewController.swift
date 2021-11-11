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
        userDefaults.removeObject(forKey: "add")
        totalNum = 0
        numArray = []
    }
    override func viewWillAppear(_ animated: Bool) {
        numTextFierld.text = ""
        viewDidLoad()
    }
    // 消費税の切り替えボタン
    @IBAction func consSelectButton(_ sender: Any) {
        if numTextFierld.text != "" {
            if consSelect.selectedSegmentIndex == 0 {
                cal(num: 1.1)
            } else {
                cal(num: 1.08)
            }
        } else {
            return
        }
        
    }
    // 追加ボタン
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
    // 消費税の切り替えボタンの関数
    func cal(num:Double) {
        let consNum = Double(numTextFierld.text!)!
        let ansNum = consNum * Double(num)
        totalLabel.text = String(format: "%.0f", ansNum)
    }
    // 消費税を計算するための関数
    func calculation(num:Double) {
        let consNum = Double(numTextFierld.text!)!
        let ansNum = consNum * Double(num)
        numArray.append(ansNum)
        userDefaults.set(numArray, forKey: "add")
        numTextFierld.text = ""
        totalLabel.text = "0"
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

