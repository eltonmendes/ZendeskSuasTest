//
//  ZendeskAPI.swift
//  ZendeskApp
//
//  Created by Elton Mendes Vieira Junior on 08/06/2018.
//  Copyright © 2018 Elton Mendes Vieira Junior. All rights reserved.
//

import Foundation

struct ZendeskAPIConstants {
    static let subdomain = "mxtechtest.zendesk.com"
    static let email = "acooke+techtest@zendesk.com"
    static let password = "mobile"
}

public class ZendeskAPI {
    
    let email : String
    let password : String
    
    init() {
        self.email = ZendeskAPIConstants.email
        self.password = ZendeskAPIConstants.password
    }
    
    init(email : String , password : String) {
        self.email = email
        self.password = password
    }
    
    func performTicketsSearch(viewID: String , completionHandler: @escaping (Data?, URLResponse?, Error?) -> Swift.Void) {
        
        let url = URL(string: "https://\(ZendeskAPIConstants.subdomain)/api/v2/views/\(viewID)/tickets.json")!

        URLSession(configuration: sessionConfigurationWithBasicAUTH()).dataTask(with: url) { data, response, responseError in
            completionHandler(data,response,responseError)
            }.resume()
    }
    
    func sessionConfigurationWithBasicAUTH() -> URLSessionConfiguration {
        let configuration = URLSessionConfiguration.default
        let userPasswordString = "\(email):\(password)"
        let userPasswordData = userPasswordString.data(using: .utf8)
        let base64EncodedCredential = userPasswordData!.base64EncodedString(options: .init(rawValue: 0))
        let authString = "Basic \(base64EncodedCredential)"
        configuration.httpAdditionalHeaders = ["Authorization" : authString]
        return configuration
    }
}
