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
        NavigationStack {
            VStack(alignment: .leading) {
                ScrollView(.vertical, showsIndicators: false) {
                    
                    VStack(spacing: 25) {
                        //  Analysis Report
                        MatchedScoreIndicatorView(
                            matchedPercentage: analyzeResult.matchPercentage,
                            experienceMatch: analyzeResult.experienceMatch,
                            recommendation: analyzeResult.recommendation,
                        )
                        
                        //  AI Summary
                        if !analyzeResult.summary.isEmpty {
                            AISummaryView(summary: analyzeResult.summary)
                        }
                        
                        //  Matched Skills
                        if (analyzeResult.matchedSkills.count > 0) {
                            MatchedSkillsView(matchedSkill: analyzeResult.matchedSkills)
                        }
                        
                        //  Your Strengths
                        if (analyzeResult.strengths.count > 0) {
                            YourStrengthsView(strengths: analyzeResult.strengths)
                        }
                        
                        //  Missing Skills
                        if (analyzeResult.missingSkills.count > 0) {
                            MissingSkillsView(missingSkill: analyzeResult.missingSkills)
                        }
                        
                        //  Improvements
                        if (analyzeResult.improvements.count > 0) {
                            ImprovementsView(improvements: analyzeResult.improvements)
                        }
                    }
                }
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.horizontal)
            .background(AppColors.backgroundColor)
            .onAppear {
                print(analyzeResult)
            }
        }
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
