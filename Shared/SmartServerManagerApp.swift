//
//  SmartServerManagerApp.swift
//  Shared
//
//  Created by Pascal Priessnitz on 21.08.21.
//

import SwiftUI



@main
struct SmartServerManagerApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
    
    
    
    
   public func OnlineCheck() {
       let hostUrl: String = "http://app.dream-city.net:30120"
       if let url = URL(string: hostUrl) {
          var request = URLRequest(url: url)
          request.httpMethod = "HEAD"
          URLSession(configuration: .default)
          .dataTask(with: request) { (_, response, error) -> Void in
             guard error == nil else {
                print("Error Main:", error ?? "")
                return
             }
             guard (response as? HTTPURLResponse)?
             .statusCode == 200 else {
                DispatchQueue.main.async {
                server = "Offline"
                }
                return
                
             }
             DispatchQueue.main.async {
            server = "Online"
            //self.StateL.textColor = UIColor.green
        }
          }
          .resume()
       }
    }
    
}
