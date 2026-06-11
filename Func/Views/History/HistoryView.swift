//
//  HistoryView.swift
//  Func
//
//  Created by Ayotunde Ikuesan on 11/06/2026.
//

import SwiftUI

struct HistoryView: View {
	var body: some View {
		NavigationStack {
			ContentUnavailableView(
				"No History Yet",
				image: "clock.arrow.circlepath",
				description: Text("Your saved calculations will appear here.")
			)
			.navigationTitle("History")
		}
	}
}

#Preview {
	HistoryView()
}
