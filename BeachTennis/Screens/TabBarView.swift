//
//  TabBarView.swift
//  BeachTennis
//
//  Created by Thiago Defini on 03/08/23.
//

import SwiftUI

struct TabBarView: View {
    var body: some View {
        TabView{
            PlayingView()
                .tabItem {
                    Label("Playing", systemImage: "tennis.racket")
                        
                }
            
            Managing()
                .tabItem {
                    Label("Managing", systemImage: "trophy")
                }
            
            Managing()
                .tabItem {
                    Label("Coming Soon", systemImage: "star")
                }
            
        }
    }
}

struct TabBarView_Previews: PreviewProvider {
    static var previews: some View {
        TabBarView()
    }
}
