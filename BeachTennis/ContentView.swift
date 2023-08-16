//
//  ContentView.swift
//  BeachTennis
//
//  Created by Thiago Defini on 18/07/23.
//
import SwiftUI
import UserNotifications

struct ContentView: View {
    var body: some View {
        FirstScreenView()
        PointsCard(tournament: c2)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
