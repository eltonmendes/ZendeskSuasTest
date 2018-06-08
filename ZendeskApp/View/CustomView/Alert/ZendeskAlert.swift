//
//  ZendeskAlert.swift
//  ZendeskApp
//
//  Created by Elton Mendes Vieira Junior on 08/06/2018.
//  Copyright © 2018 Elton Mendes Vieira Junior. All rights reserved.
//

import UIKit

struct ZendeskAlertConstants {
    static let errorTitle = "Error"
    static let actionTitle = "Ok"
}

struct ZendeskAlert {
    
    func showAlert(viewController : UIViewController , error : Error) {
        let alertController = UIAlertController(title: ZendeskAlertConstants.errorTitle, message: error.localizedDescription, preferredStyle: .alert)
        let dismissAction = UIAlertAction(title: ZendeskAlertConstants.actionTitle, style: .cancel, handler: nil)
        alertController.addAction(dismissAction)
        viewController.present(alertController, animated: true, completion: nil)
    }
}
