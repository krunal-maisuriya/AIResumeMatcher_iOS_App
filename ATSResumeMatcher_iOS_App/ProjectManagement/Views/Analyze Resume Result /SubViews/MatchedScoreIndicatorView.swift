//
//  MatchedScoreIndicatorView.swift
//  ATSResumeMatcher_iOS_App
//
//  Created by Krunal Maisuriya on 06/11/2026.
//

import SwiftUI

struct MatchedScoreIndicatorView: View {
    @Environment(\.colorScheme) private var colorScheme

    var matchedPercentage: Int?
    var experienceMatch: String = ""
    var recommendation: String = ""
    
    @State private var animatedProgress: CGFloat = 0
    
    private var score: Int {
        min(max(matchedPercentage ?? 0, 0), 100)
    }
    
    private var progress: CGFloat {
        CGFloat(score) / 100
    }
    
    private var progressColor: Color {
        switch score {
        case 0..<40:
            return Color(AppColors.redColor)
        case 40..<70:
            return Color(AppColors.orangeColor)
        default:
            return Color(colorScheme == .dark ? AppColors.greenColor : AppColors.darkGreenColor)
        }
    }
    
    private var recommendationColor: Color {
        let value = recommendation.lowercased()
        
        if value.contains("strong") || value.contains("good") || value.contains("excellent") {
            return Color(colorScheme == .dark ? AppColors.greenColor : AppColors.darkGreenColor)
        } else if value.contains("partial") || value.contains("moderate") {
            return Color(AppColors.orangeColor)
        } else if value.contains("not") || value.contains("poor") {
            return Color(AppColors.redColor)
        }
        
        return .secondary
    }
    
    
    var body: some View {
        VStack(alignment: .leading, spacing: 15) {
            
            // MARK: - Header
            VStack(alignment: .leading, spacing: 4) {
                Text("Analysis Report")
                    .font(.system(size: 22, weight: .bold))

                Text("Your resume matching results")
                    .font(.system(size: 15, weight: .light))
                    .foregroundStyle(.secondary)
            }
            
            // MARK: - Score Card
            VStack(spacing: 15) {
                ZStack {
                    Circle()
                        .stroke(progressColor.opacity(0.15), lineWidth: 12)
                    
                    Circle()
                        .trim(from: 0, to: animatedProgress)
                        .stroke(progressColor, style: StrokeStyle(lineWidth: 12, lineCap: .round))
                        .rotationEffect(.degrees(-90))
                        
                    VStack(alignment: .center, spacing: 4) {
                        Text(matchedPercentage.map { "\($0)%" } ?? "--")
                            .font(.system(size: 29, weight: .black))
                            .foregroundStyle(progressColor)

                        Text("Match Score")
                            .font(.system(size: 12, weight: .medium))
                            .foregroundStyle(.secondary)
                    }
                }
                .frame(width: 135, height: 135)
                
                VStack(alignment: .center, spacing: 8) {
                    Text(scoreTitle)
                        .font(.system(size: 19, weight: .bold))
                        .foregroundStyle(progressColor)
                    
                    Text(scoreDescription)
                        .font(.system(size: 13))
                        .foregroundStyle(.secondary)
                        .multilineTextAlignment(.center)
                }
                
                Divider()
                    .padding(.vertical, 5)
                
                // MARK: - Status Information
                HStack {
                    resumeStatusItem(title: "Experience", subTitle: experienceMatch)
                    Spacer()
                    resumeStatusItem(title: "Recommendation", subTitle: recommendation)
                }
            }
            .padding(20)
            .frame(maxWidth: .infinity, alignment: .center)
            .background(RoundedRectangle(cornerRadius: 25).fill(AppColors.cardColor))
        }
        .padding(.top, 15)
        .onAppear {
            withAnimation(.easeOut(duration: 1.2)) {
                animatedProgress = matchedPercentage == nil ? 0 : progress
            }
        }
    }
    
    
    // MARK: - Score Title
    private var scoreTitle: String {
        guard matchedPercentage != nil else {
            return "Not Analyzed"
        }
        
        switch score {
        case 0..<40:
            return "Low Match"
        case 40..<70:
            return "Moderate Match"
        default:
            return "Strong Match"
        }
    }

    private var scoreDescription: String {
        guard matchedPercentage != nil else {
            return "Your resume has not been analyzed yet."
        }
        
        switch score {
        case 0..<40:
            return "Your resume needs improvement to match this job."
        case 40..<70:
            return "Your resume partially matches the job requirements."
        default:
            return "Your resume aligns well with the job requirements."
        }
    }
    
    // MARK: - Status Item
    private func resumeStatusItem(title: String, subTitle: String) -> some View {
        VStack(alignment: .leading, spacing: 2) {
            Text(title)
                .font(.system(size: 14, weight: .regular))
                .foregroundStyle(.secondary)
            
            Text(subTitle.isEmpty ? "Not available" : subTitle)
                .font(.system(size: 16, weight: .bold))
                .foregroundStyle(.primary)
        }
    }
}

#Preview {
    MatchedScoreIndicatorView(matchedPercentage: 70)
}
