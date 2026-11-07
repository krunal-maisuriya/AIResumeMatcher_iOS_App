//
//  Improvements.swift
//  ATSResumeMatcher_iOS_App
//
//  Created by Krunal Maisuriya on 07/11/2026.
//

import Foundation

struct Improvements: Codable, Identifiable {
    let suggestion: String
    let reason: String
    
    var id: String { suggestion }
}
