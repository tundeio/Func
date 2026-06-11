//
//  SettingsView.swift
//  Func
//
//  Created by Ayotunde Ikuesan on 11/06/2026.
//

import SwiftUI

struct SettingsView: View {
	var body: some View {
		NavigationStack {
			List {
				Text("Settings coming soon")
					.foregroundStyle(.secondary)
			}
			.navigationTitle("Settings")
		}
	}
}

#Preview { SettingsView() }
