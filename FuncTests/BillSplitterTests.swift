//
//  BillSplitterTests.swift
//  Func
//
//  Created by Ayotunde Ikuesan on 11/06/2026.
//


import Testing
@testable import Func

struct BillSplitterTests {
    @Test func splitsEvenlyWithTip() {
        let r = BillSplitter.compute(total: 100, people: 4, tipPercent: 20, roundUp: false)
        #expect(r.headline.contains("30"))   // 120 ÷ 4 = 30
    }

    @Test func roundsUpPerPerson() {
        let r = BillSplitter.compute(total: 100, people: 3, tipPercent: 0, roundUp: true)
        #expect(r.headline.contains("34"))   // 33.33 → rounds up to 34
    }

    @Test func guardsAgainstZeroPeople() {
        let r = BillSplitter.compute(total: 50, people: 0, tipPercent: 0, roundUp: false)
        #expect(r.headline.contains("50"))   // 0 treated as 1
    }
}
