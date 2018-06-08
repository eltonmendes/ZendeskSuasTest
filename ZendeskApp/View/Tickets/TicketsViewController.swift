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
        addRefreshControl()
        listenerDescription = store.addListener(forStateType: SearchTickets.self) { [weak self] state in
            if (state.ticketsError == nil) {
                self?.dataSource = state.tickets
                self?.tableView.reloadData()
            } else {
                ZendeskAlert().showAlert(viewController: self!,
                                         error: state.ticketsError!)
            }
            self?.activityIndicator.stopAnimating()
            self?.tableView.refreshControl?.endRefreshing()
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        fetchTicketsFromServer()
    }
    
    deinit {
        listenerDescription?.removeListener()
    }
    
    func addRefreshControl() {
        let refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action: #selector(fetchTicketsFromServer), for: .valueChanged)
        refreshControl.tintColor = #colorLiteral(red: 0, green: 0.9768045545, blue: 0, alpha: 1)
        tableView.refreshControl = refreshControl
    }
    
    @objc func fetchTicketsFromServer() {
        store.dispatch(action: FetchTicketsAsyncAction(viewID: TicketsViewControllerConstants.viewID))
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
        cell.backgroundColor = indexPath.row % 2 == 0 ? #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1) : #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        return cell
    }

}

