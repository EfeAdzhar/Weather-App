//
//  ViewController.swift
//  Weather App
//
//  Created by Efe on 07.07.2022.


import UIKit

class ViewController: UIViewController {
    //MARK: Outlets
    @IBOutlet weak var mainLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
    var urlchik =  "http://api.weatherapi.com/v1/current.json?key=06dc3be58c7f48e7bba193458221007&q=Toronto&aqi=no"

    
    //MARK: Variables
    var citiesArray = ["Toronto", "Poltava", "Ankara", "Warsaw", "New York", "Los Angeles", ""]
    
    //MARK: ViewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpEverything()
        tableView.delegate = self
        tableView.dataSource = self
        
    
        
    }
    
    func setUpEverything() {
        setUpLabel()
        setUpTableView()
    }
    
    func setUpLabel() {
        mainLabel.text = "Hello to my second app! It's a simple Weather App where you can choose one of this cities and see there weather :)"
        mainLabel.lineBreakMode = .byWordWrapping
        mainLabel.font = UIFont.boldSystemFont(ofSize: 30)
        mainLabel.numberOfLines = 12
        
    }
    
    func setUpTableView() {
        tableView.layer.borderWidth = 6
        tableView.layer.borderColor = .init(red: 2.5, green: 2.3, blue: 1.2, alpha: 2)
        tableView.layer.cornerRadius = 10
    }
    

}
//MARK: TableViewDelegate & TableViewDataSource
extension ViewController : UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return citiesArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        cell?.textLabel!.text = citiesArray[indexPath.row]
        cell?.backgroundColor = .systemPink
        cell?.textLabel?.textColor = .black
        cell?.textLabel?.font = UIFont.boldSystemFont(ofSize: 25)
    
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let vc = WeatherViewController()
         self.present(UINavigationController(rootViewController: vc), animated: true)
         
    }
}
