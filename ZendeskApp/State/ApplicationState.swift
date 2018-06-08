//
//  ApplicationState.swift
//  ZendeskApp
//
//  Created by Elton Mendes Vieira Junior on 08/06/2018.
//  Copyright © 2018 Elton Mendes Vieira Junior. All rights reserved.
//

import Suas

let store = Suas.createStore(reducer: SearchTicketsReducer(), middleware: AsyncMiddleware())

struct SearchTickets {
    var tickets : Tickets
    var ticketsError : Error?

}
