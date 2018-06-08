//
//  TicketsTest.swift
//  ZendeskAppTests
//
//  Created by Elton Mendes Vieira Junior on 08/06/2018.
//  Copyright © 2018 Elton Mendes Vieira Junior. All rights reserved.
//

import XCTest
import Suas

class TicketsTest: XCTestCase {
    
    func testTicketsAvailableAsyncAction() {
        
        let ticketList = [Ticket(id: 1, subject: "Subject", description: "Desc", status: "New"),
                          Ticket(id: 2, subject: "Subject", description: "Desc", status: "open")]
        
        let tickets = Tickets(ticketList: ticketList)
        let state = SearchTickets(tickets: tickets)
        let reducer = SearchTicketsReducer(initialState: state)
        let action = TicketsFetchedAction(tickets: tickets)
        _ = reducer.reduce(state: state, action:action)
        XCTAssert(state.tickets.tickets.count > 0)
    }
    
    func testTicketsUnavailableAsyncAction() {
        
        let tickets = Tickets()
        let state = SearchTickets(tickets: tickets)
        let reducer = SearchTicketsReducer(initialState: state)
        let action = TicketsFetchedAction(tickets: tickets)
        _ = reducer.reduce(state: state, action:action )
        XCTAssert(state.tickets.tickets.count == 0)

    }
    
    
}