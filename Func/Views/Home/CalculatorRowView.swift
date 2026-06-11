//
//  CalculatorRowView.swift
//  Func
//
//  Created by Ayotunde Ikuesan on 11/06/2026.
//

import SwiftUI

struct CalculatorRow: View {
	let title: String
	let subtitle: String
	let systemImage: String
	let tint: Color
	
	var body: some View {
		HStack(spacing: 12) {
			Image(systemName: systemImage)
				.foregroundStyle(.white)
				.frame(width: 30, height: 30)
				.font(.system(size: 15, weight: .semibold))
				.background(tint, in: RoundedRectangle(cornerRadius: 7))
			
			VStack(alignment: .leading, spacing: 1) {
				Text(title)
				Text(subtitle)
					.font(.caption)
					.foregroundStyle(.secondary)
			}
		}
	}
}
