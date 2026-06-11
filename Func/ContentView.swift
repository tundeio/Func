//
//  ContentView.swift
//  Func
//
//  Created by Ayotunde Ikuesan on 11/06/2026.
//

import SwiftUI

struct ContentView : View {
	var body: some View {
		TabView {
			CalculatorsHomeView()
				.tabItem {
					Label("Calculators", systemImage: "function")
				}
			
			HistoryView()
				.tabItem {
					Label("History", systemImage: "clock.arrow.trianglehead.counterclockwise.rotate.90")
				}
			
			SettingsView()
				.tabItem {
					Label("Settings", systemImage: "slider.horizontal.3")
				}
		}
	}
}

#Preview{
	ContentView()
}
