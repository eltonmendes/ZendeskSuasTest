//
//  TicketsFetchedAction.swift
//  ZendeskApp
//
//  Created by Elton Mendes Vieira Junior on 08/06/2018.
//  Copyright © 2018 Elton Mendes Vieira Junior. All rights reserved.
//

import Suas

struct TicketsFetchedAction: Action {
    let tickets: Tickets
}

struct TicketsFetchedErrorAction : Action {
    let error : Error
}
