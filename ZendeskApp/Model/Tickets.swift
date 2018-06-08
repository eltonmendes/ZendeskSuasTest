//
//  Tickets.swift
//  ZendeskApp
//
//  Created by Elton Mendes Vieira Junior on 08/06/2018.
//  Copyright © 2018 Elton Mendes Vieira Junior. All rights reserved.
//

struct Ticket : Codable  {
    let id : Int
    let subject : String
    let description : String
    let status : String
}

struct Tickets : Codable {
    let tickets : [Ticket]
    
    init() {
        self.tickets = []
    }
    
    init(ticketList : [Ticket]) {
        self.tickets = ticketList
    }
}
