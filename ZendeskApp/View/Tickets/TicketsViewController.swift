//
//  ViewController.swift
//  ZendeskApp
//
//  Created by Elton Mendes Vieira Junior on 08/06/2018.
//  Copyright © 2018 Elton Mendes Vieira Junior. All rights reserved.
//

import UIKit
import Suas

struct TicketsViewControllerConstants {
    static let cellIdentifier = "cell"
    static let viewID = "39551161"
}

class TicketsViewController: UIViewController , UITableViewDataSource {

    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var tableView: UITableView!
    var listenerDescription : Subscription<SearchTickets>?
    var dataSource = Tickets()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        listenerDescription = store.addListener(forStateType: SearchTickets.self) { [weak self] state in
            if (state.ticketsError == nil) {
                self?.dataSource = state.tickets
                self?.tableView.reloadData()
            } else {
                ZendeskAlert().showAlert(viewController: self!,
                                         error: state.ticketsError!)
            }
            self?.activityIndicator.stopAnimating()
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
         super.viewDidAppear(animated)
         store.dispatch(action: FetchTicketsAsyncAction(viewID: TicketsViewControllerConstants.viewID))
    }
    
    deinit {
        listenerDescription?.removeListener()
    }
    
    //MARK: TableView DataSource
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.tickets.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: TicketsViewControllerConstants.cellIdentifier, for: indexPath) as! TicketTableViewCell
        cell.setupCell(ticket: dataSource.tickets[indexPath.row])
        cell.backgroundColor = indexPath.row % 2 == 0 ? #colorLiteral(red: 0.8614637587, green: 0.8888075087, blue: 0.9851074219, alpha: 1) : #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        return cell
    }

}

