//
//  MatchedSkill.swift
//  ATSResumeMatcher_iOS_App
//
//  Created by Krunal Maisuriya on 07/11/2026.
//

import Foundation

struct MatchedSkill: Codable, Identifiable {
    let skill: String
    let evidence: String

    var id: String { skill }
}
