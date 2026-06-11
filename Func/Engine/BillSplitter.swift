//
//  BillSplitter.swift
//  Func
//
//  Created by Ayotunde Ikuesan on 11/06/2026.
//

import Foundation

enum BillSplitter {
    static func compute(total: Double, people: Int, tipPercent: Int, roundUp: Bool) -> CalcResult {
        let safePeople = max(1, people)
        let tip = total * Double(tipPercent) / 100
        let grandTotal = total + tip
        var perPerson = grandTotal / Double(safePeople)
        
        if roundUp {
            perPerson = perPerson.rounded(.up)
        }
        
        // .formatted(.currency) is Swift's locale aware money formatting
        let money = {(v:Double) in v.formatted(.currency(code: "GBP"))}
		
		// Add the steps to the calculation
		var steps = [
			"Tip = \(money(total)) × \(tipPercent)% = \(money(tip))",
			"Total = \(money(total)) + \(money(tip)) = \(money(grandTotal))",
			"Per person = \(money(grandTotal)) ÷ \(safePeople) = \(money(grandTotal / Double(safePeople)))",
		]
		
		// If rounding up, add the info to the steps
		if roundUp {
			steps.append("Rounded up to \(money(perPerson)) each")
		}
		
		// Add the details for the view
		var details = [
			CalcResult.DetailRow(label: "Tip", value: "\(money(tip)) (\(tipPercent)%)"),
			CalcResult.DetailRow(label: "Grand total", value: money(grandTotal)),
		]
		
		// If rounding up, add those details too
		if roundUp {
			details.append(.init(label: "Collected", value: money(perPerson * Double(safePeople))))
		}
		
		// Return the result
		return CalcResult(
			headline: money(perPerson),
			subtitle: "each · \(safePeople) \(safePeople == 1 ? "person" : "people")",
			details: details,
			steps: steps,
			summary: "\(money(perPerson)) each * \(safePeople)"
		)
    }
}
