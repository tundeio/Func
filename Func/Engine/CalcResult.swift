//
//  CalcResult.swift
//  Func
//
//  Created by Ayotunde Ikuesan on 11/06/2026.
//

import Foundation

struct CalcResult {
    let headline: String // the big answer, e.g. "£33.23"
    let subtitle: String // context, e.g. "each - 3 people"
    let details: [DetailRow] // secondary figures
    let steps: [String] // the working-out
    let summary: String // one-line for history
    
    struct DetailRow: Identifiable {
        let id = UUID()
        let label: String
        let value: String
    }
}
