//
//  FetchTicketsAsyncAction.swift
//  ZendeskApp
//
//  Created by Elton Mendes Vieira Junior on 08/06/2018.
//  Copyright © 2018 Elton Mendes Vieira Junior. All rights reserved.
//

import Suas

struct FetchTicketsAsyncAction : AsyncAction {
    
    let zendeskAPI = ZendeskAPI()
    let viewID : String
    
    init(viewID: String) {
        self.viewID = viewID
    }
    
    func execute(getState: @escaping GetStateFunction, dispatch: @escaping DispatchFunction) {
        zendeskAPI.performTicketsSearch(viewID: viewID) { (data, response, responseError) in
            if let error = responseError {
                self.handleError(error: error, dispatch: dispatch)
            } else if let jsonData = data {
                self.handleSuccess(jsonData: jsonData, dispatch: dispatch)
            }
        }
    }
    
    func handleError(error : Error , dispatch : DispatchFunction) {
        dispatch(TicketsFetchedErrorAction(error: error))
    }
    
    func handleSuccess(jsonData : Data , dispatch : DispatchFunction) {
        let decoder = JSONDecoder()
        
        do {
            let tickets = try decoder.decode(Tickets.self, from: jsonData)
            dispatch(TicketsFetchedAction(tickets: tickets))
        } catch {
            //Parse Error
        }        
    }
}
