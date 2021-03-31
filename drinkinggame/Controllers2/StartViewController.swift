//
//  ViewController.swift
//  drinkinggame
//
//  Created by mladen on 16.3.21..
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        //ocistiBazu()
        setupTableView()
        
    }

    @IBAction func startPressed(_ sender: UIButton) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil);
        let vc = storyboard.instantiateViewController(withIdentifier: "pitanjaEkran") as! UIViewController;
        self.present(vc, animated: true, completion: nil);
    }
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    @IBOutlet weak var tableView: UITableView!
    var imena : [String] = []
    
    func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(Ime.self, forCellReuseIdentifier: "cellId")
        //tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cellId")
        tableView.separatorColor = UIColor.white
        
        view.addSubview(tableView)
        
//        NSLayoutConstraint.activate([
//            tableView.topAnchor.constraint(equalTo: self.view.topAnchor),
//            tableView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
//            tableView.rightAnchor.constraint(equalTo: self.view.rightAnchor),
//            tableView.leftAnchor.constraint(equalTo: self.view.leftAnchor)
//        ])
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return imena.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellId", for: indexPath) as! Ime
        cell.textLabel?.text = imena[indexPath.row]
        return cell
    }
    
    // za povecanje visine cells
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
    
    // addButton pressed action
    @IBAction func addButton(_ sender: UIButton) {
        var textField = UITextField()
        
        let alert = UIAlertController(title: "Dodaj igraca", message: "", preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Dodaj", style: .default) { (action) in
            //what will happen once the user clicks the Add Item button on our UIAlert
            let igrac = textField.text!
            
            self.imena.append(igrac)
            self.tableView.reloadData()
        }
        
        alert.addTextField { (alertTextField) in
            alertTextField.placeholder = "ime"
            textField = alertTextField
            
        }
        alert.addAction(action)
        
        present(alert, animated: true, completion: nil)
    }
    
    // OVO JE FJA ZA BRISANJE
     func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete{
            imena.remove(at: indexPath.row)
            tableView.reloadData()
        }
    }

    // za brisanje svega iz baze pre pocetka
    func ocistiBazu(){
        imena = []
    }
    
}

