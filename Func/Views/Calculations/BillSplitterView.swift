//
//  BillSplitterView.swift
//  Func
//
//  Created by Ayotunde Ikuesan on 11/06/2026.
//

import SwiftUI

struct BillSplitterView: View {
		// Local view state — like useState. The view owns these.
	@State private var total: Double
	@State private var people: Int
	@State private var tipPercent: Int
	@State private var roundUp: Bool
	
	init(total: Double = 0, people: Int = 2, tipPercent: Int = 10, roundUp: Bool = false) {
		_total = State(initialValue: total)
		_people = State(initialValue: people)
		_tipPercent = State(initialValue: tipPercent)
		_roundUp = State(initialValue: roundUp)
	}
	
		// Derived value: recomputed from state every render. No @State needed.
	private var result: CalcResult {
		BillSplitter.compute(total: total, people: people, tipPercent: tipPercent, roundUp: roundUp)
	}
	
	var body: some View {
		Form {
			Section("Bill") {
				HStack {
					Text("Total")
					Spacer()
					TextField("0.00", value: $total, format: .currency(code: "GBP"))
						.keyboardType(.decimalPad)
						.multilineTextAlignment(.trailing)
				}
				Stepper("People: \(people)", value: $people, in: 1...50)
				Stepper("Tip: \(tipPercent)%", value: $tipPercent, in: 0...100)
				Toggle("Round up", isOn: $roundUp)
			}
			
			Section("Result") {
				VStack(spacing: 4) {
					Text(result.headline)
						.font(.system(size: 40, weight: .bold, design: .rounded))
						.foregroundStyle(.tint)
					Text(result.subtitle)
						.font(.subheadline)
						.foregroundStyle(.secondary)
				}
				.frame(maxWidth: .infinity)
				.padding(.vertical, 8)
				
				ForEach(result.details) { row in
					LabeledContent(row.label, value: row.value)
				}
			}
			
			Section("Working Out") {
				ForEach(result.steps.indices, id: \.self) { i in
					HStack(alignment: .top, spacing: 10) {
						Text("\(i + 1)")
							.font(.caption2.bold())
							.foregroundStyle(.white)
							.frame(width: 18, height: 18)
							.background(.tint, in: Circle())
						Text(result.steps[i])
							.font(.footnote)
							.monospaced()
					}
				}
			}
		}
		.navigationTitle("Split a Bill")
	}
}

#Preview("Empty state") {
	NavigationStack { BillSplitterView() }
}


#Preview("Realistic bill") {
	NavigationStack {
		BillSplitterView(total: 100, people: 2, tipPercent: 10)
	}
}
