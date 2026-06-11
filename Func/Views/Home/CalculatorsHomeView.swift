//
//  CalculatorsHomeView.swift
//  Func
//
//  Created by Ayotunde Ikuesan on 11/06/2026.
//

import SwiftUI

struct CalculatorsHomeView: View {
	var greeting: String {
		let hour = Calendar.current.component(.hour, from: Date())
		switch hour {
		case 5..<12:
			return "Good morning"
		case 12..<18:
			return "Good afternoon"
		default:
			return "Good evening"
		}
	}

	var body: some View {
		NavigationStack {
			List {
				Section("Money") {
					NavigationLink {
						BillSplitterView()
					} label: {
						CalculatorRow(
							title: "Split a Bill",
							subtitle: "Tip and divide a tab",
							systemImage: "person.2.fill",
							tint: .pink
						)
					}
				}
			}
			.navigationTitle(Text("\(greeting)."))
			.navigationSubtitle(Text("Welcome back to Func, Tunde."))
		}
	}
}

#Preview {
	CalculatorsHomeView()
}
