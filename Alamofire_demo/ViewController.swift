//
//  ViewController.swift
//  Alamofire_demo
//
//  Created by Huy on 7/21/20.
//  Copyright © 2020 nhn. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tbvListCountry: UITableView!
    var countries:[Country] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tbvListCountry.dataSource = self
        
        let service = Service(baseUrl: "https://restcountries.eu/rest/v2/")
        service.getAllCountryNameFrom(endPoint: "all")
        service.completionHandler { [weak self] (countries, status, message) in
            if status {
                guard let self = self else {return}
                guard let _countries = countries else {return}
                self.countries = _countries
                self.tbvListCountry.reloadData()
            }
        }
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return countries.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tbvListCountry.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        let country = countries[indexPath.row]
        cell.textLabel?.text = "\(country.name!) - \(country.countryCode!)"
        cell.detailTextLabel?.text = country.capital
        
        return cell
    }
}
