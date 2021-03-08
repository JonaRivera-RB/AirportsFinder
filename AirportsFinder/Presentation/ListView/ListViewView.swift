//
//  ListViewView.swift
//  AirportsFinder
//
//  Created by Jonathan Rivera Misael on 07/03/21.
//  
//

import Foundation
import UIKit

class ListViewView: UIViewController {
    
    //MARK: IBOutlet
    @IBOutlet weak var airportsTableView: UITableView!
    
    // MARK: Properties
    var presenter: ListViewPresenterProtocol?
    var airports = AirportsResponseModel()
    
    // MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad()
    }
}

extension ListViewView: ListViewViewProtocol {
    func setupDataInView(withData airports: AirportsResponseModel) {
        self.airports = airports
    }
    
    func setupTableView() {
        airportsTableView.delegate = self
        airportsTableView.dataSource = self
    }
}

extension ListViewView: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return airports.airportsCount
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: "AirportsCell")
        
        cell.textLabel?.text = airports.response?[indexPath.row].place?.fullName
        cell.detailTextLabel?.text = airports.response?[indexPath.row].loc?.fullCoordinates
        
        return cell
    }
}

extension ListViewView: UITableViewDelegate {}
