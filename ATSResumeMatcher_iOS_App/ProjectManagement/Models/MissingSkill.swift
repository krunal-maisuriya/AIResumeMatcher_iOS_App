//
//  MissingSkill.swift
//  ATSResumeMatcher_iOS_App
//
//  Created by Krunal Maisuriya on 07/11/2026.
//

import Foundation

struct MissingSkill: Codable, Identifiable {
    let skill: String
    let importance: String

    var id: String { skill }
}
