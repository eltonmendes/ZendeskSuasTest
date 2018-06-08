//
//  SearchTicketsReducer.swift
//  ZendeskApp
//
//  Created by Elton Mendes Vieira Junior on 08/06/2018.
//  Copyright © 2018 Elton Mendes Vieira Junior. All rights reserved.
//

import Suas

struct SearchTicketsReducer: Reducer {
    var initialState = SearchTickets(tickets : Tickets() , ticketsError : nil)
    
    func reduce(state: SearchTickets, action: Action) -> SearchTickets? {
        
        if let action = action as? TicketsFetchedAction {            
            return SearchTickets(tickets: action.tickets , ticketsError : nil)
        } else if let action = action as? TicketsFetchedErrorAction {
            return SearchTickets(tickets: Tickets() , ticketsError : action.error)
        }
        
        return nil
    }
    
}
