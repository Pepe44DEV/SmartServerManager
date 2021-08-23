//
//  ContentView.swift
//  Shared
//
//  Created by Pascal Priessnitz on 21.08.21.
//

import SwiftUI

public var server:String = "No Server Selected"
public var status:String = "STATUS"





struct ViewDidLoadModifier: ViewModifier {

    @State private var didLoad = false
    private let action: (() -> Void)?

    init(perform action: (() -> Void)? = nil) {
        self.action = action
    }

    func body(content: Content) -> some View {
        content.onAppear {
            if didLoad == false {
                didLoad = true
                action?()
            }
        }
    }

}





extension View {

    func onLoad(perform action: (() -> Void)? = nil) -> some View {
        modifier(ViewDidLoadModifier(perform: action))
    }

}


struct SingleServer: View {
    var body: some View {
        NavigationView {
            ZStack {
                Text(server)
                    .font(.title)
                    .fontWeight(.bold)
                    .padding(.top, -380.0)
                    .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
                Text(status)
                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                    .padding(.top, -315.0)
                    .foregroundColor(.red)
                    
                    
            }.onLoad{
                OnlineCheck()
            }
        }
    }
    
}

struct ServersView: View {
    var body: some View {
        NavigationView {
            List {
                NavigationLink(destination: SingleServer()){
                    Text("Server 1")
                }
            }
            .navigationTitle("Servers")
        }
    }
    
}



struct ContentView: View {
    var body: some View {
        TabView{
            ServersView()
                .tabItem {
                    Image(systemName: "server.rack")
                    Text("Servers")
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.dark)
    }
}



//Functions
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
