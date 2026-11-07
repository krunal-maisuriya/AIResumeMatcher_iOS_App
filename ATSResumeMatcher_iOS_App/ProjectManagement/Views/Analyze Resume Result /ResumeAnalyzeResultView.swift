//
//  ResumeAnalyzeResultView.swift
//  ATSResumeMatcher_iOS_App
//
//  Created by Krunal Maisuriya on 06/11/2026.
//

import SwiftUI

struct ResumeAnalyzeResultView: View {
    let analyzeResult: AnalysisResponse
    
    var body: some View {
//        VStack(alignment: .leading) {
            ScrollView(.vertical, showsIndicators: false) {
                
                VStack(alignment: .leading, spacing: 20) {
                    
                    // MARK: - Match Score
                    MatchedScoreIndicatorView(
                        matchedPercentage: analyzeResult.matchPercentage,
                        experienceMatch: analyzeResult.experienceMatch,
                        recommendation: analyzeResult.recommendation
                    )
                    
                    // MARK: - AI Summary
                    if !analyzeResult.summary.isEmpty {
                        AISummaryView(summary: analyzeResult.summary)
                    }
                    
                    // MARK: - Matched Skills
                    if (analyzeResult.matchedSkills.count > 0) {
                        MatchedSkillsView(matchedSkill: analyzeResult.matchedSkills)
                    }
                    
                    // MARK: - Your Strengths
                    if (analyzeResult.strengths.count > 0) {
                        YourStrengthsView(strengths: analyzeResult.strengths)
                    }
                    
                    // MARK: - Missing Skills
                    if (analyzeResult.missingSkills.count > 0) {
                        MissingSkillsView(missingSkill: analyzeResult.missingSkills)
                    }
                    
                    // MARK: - Improvements
                    if (analyzeResult.improvements.count > 0) {
                        ImprovementsView(improvements: analyzeResult.improvements)
                    }
                }
                .padding(.horizontal, 16)
                .padding(.top, 16)
                .padding(.bottom, 30)
                .frame(maxWidth: .infinity, alignment: .leading)
            }
            .background(AppColors.backgroundColor)
            .navigationTitle("Analysis Report")
            .navigationBarTitleDisplayMode(.inline)
//        }
//        .frame(maxWidth: .infinity, alignment: .leading)
//        .padding(.horizontal)
//        .background(AppColors.backgroundColor)
    }
}

#Preview {
    ResumeAnalyzeResultView(
        analyzeResult: AnalysisResponse(
            matchPercentage: 0,
            matchedSkills: [], missingSkills: [],
            experienceMatch: "",
            strengths: [], improvements: [],
            summary: "", recommendation: ""
        )
    )
}
