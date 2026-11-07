//
//  AnalysisResponse.swift
//  ATSResumeMatcher_iOS_App
//
//  Created by Krunal Maisuriya on 07/11/2026.
//

import Foundation

struct AnalysisResponse: Codable {
    let matchPercentage: Int
    
    let matchedSkills: [MatchedSkill]
    let missingSkills: [MissingSkill]
    
    let experienceMatch: String
    
    let strengths: [String]
    let improvements: [Improvements]
    
    let summary: String
    let recommendation: String
}
