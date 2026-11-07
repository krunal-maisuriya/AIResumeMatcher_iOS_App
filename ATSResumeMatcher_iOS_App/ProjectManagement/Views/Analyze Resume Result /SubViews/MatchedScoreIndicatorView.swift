//
//  MatchedScoreIndicatorView.swift
//  ATSResumeMatcher_iOS_App
//
//  Created by Krunal Maisuriya on 06/11/2026.
//

import SwiftUI

struct MatchedScoreIndicatorView: View {
    var matchedPercentage: Int?
    var experienceMatch: String = ""
    var recommendation: String = ""
    
    private var progressColor: Color {
        guard let matchedPercentage else {
            return Color(AppColors.grayColor)
        }
        
        switch matchedPercentage {
        case 0..<40:
            return Color(AppColors.redColor)
        case 40..<70:
            return Color(AppColors.orangeColor)
        case 0..<40:
            return Color(AppColors.redColor)
        default:
            return Color(AppColors.greenColor)
        }
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Analysis Report")
                .font(.system(size: 22, weight: .bold))
            Text("Your resume matching results")
                .font(.system(size: 15, weight: .light))
            
            Spacer(minLength: 20)
            
            VStack(spacing: 15) {
                ZStack {
                    Circle()
                        .stroke(progressColor.opacity(0.15), lineWidth: 12)
                    
                    Circle()
                        .trim(from: 0, to: CGFloat(matchedPercentage ?? 0)/100)
                        .stroke(progressColor, style: StrokeStyle(lineWidth: 12, lineCap: .round))
                        .rotationEffect(.degrees(-90))
                        
                    VStack(alignment: .center, spacing: 4) {
                        Text(matchedPercentage.map { "\($0)" } ?? "--")
                            .font(.system(size: 28, weight: .black))
                            .foregroundStyle(progressColor)
                        
                        Text(matchedPercentage == nil ? "Not analyzed" : "out of 100")
                            .font(.system(size: 13, weight: .medium))
                            .foregroundStyle(.secondary)
                    }
                }
                .frame(width: 120, height: 120)
                
                Text("\(experienceMatch) Candidate")
                    .font(.system(size: 18, weight: .bold))
                    
                Divider()
                    .padding(.vertical, 7)
                
                HStack {
                    matchedResumeStatus(title: "Experience", subTitle: experienceMatch)
                    Spacer()
                    matchedResumeStatus(title: "Recommendation", subTitle: recommendation)
                }
            }
            .padding(.vertical, 20)
            .padding(.horizontal, 15)
            .frame(maxWidth: .infinity, alignment: .center)
            .background(RoundedRectangle(cornerRadius: 25).fill(AppColors.cardColor))
        }
        .padding(.top, 15)
    }
    
    private func matchedResumeStatus(title: String, subTitle: String) -> some View {
        VStack(alignment: .leading, spacing: 2) {
            Text(title)
                .font(.system(size: 14, weight: .regular))
                .opacity(0.8)
            
            Text(subTitle)
                .font(.system(size: 16, weight: .bold))
        }
    }
}

#Preview {
    MatchedScoreIndicatorView(matchedPercentage: 70)
}
