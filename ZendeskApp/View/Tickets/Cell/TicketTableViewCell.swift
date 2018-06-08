//
//  TicketTableViewCell.swift
//  ZendeskApp
//
//  Created by Elton Mendes Vieira Junior on 08/06/2018.
//  Copyright © 2018 Elton Mendes Vieira Junior. All rights reserved.
//

import UIKit

class TicketTableViewCell: UITableViewCell {

    
    @IBOutlet weak var subjectLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var IDLabel: UILabel!
    @IBOutlet weak var statusLabel: UILabel!

    func setupCell(ticket : Ticket) {
        subjectLabel.text = ticket.subject
        descriptionLabel.text = ticket.description
        IDLabel.text = "\(ticket.id)"
        statusLabel.text = ticket.status
    }

}
