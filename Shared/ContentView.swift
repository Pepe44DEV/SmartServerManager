//
//  ContentView.swift
//  Shared
//
//  Created by Pascal Priessnitz on 21.08.21.
//

import SwiftUI

public var server:String = "No Server Selected"
public var status:String = "STATUS"


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
                    Image(systemName: "gear")
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
