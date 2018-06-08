//
//  SearchTicketsReducer.swift
//  ZendeskApp
//
//  Created by Elton Mendes Vieira Junior on 08/06/2018.
//  Copyright © 2018 Elton Mendes Vieira Junior. All rights reserved.
//

import Suas

struct SearchTicketsReducer: Reducer {
    var initialState = SearchTickets(tickets : Tickets())
    
    func reduce(state: SearchTickets, action: Action) -> SearchTickets? {
        
        if let action = action as? TicketsFetchedAction {            
            return SearchTickets(tickets: action.tickets)
        } else if action is TicketsFetchedErrorAction {
            return SearchTickets(tickets: Tickets())
        }
        
        return nil
    }
    
}
