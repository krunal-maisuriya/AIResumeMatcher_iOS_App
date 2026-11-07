//
//  MissingSkillsView.swift
//  ATSResumeMatcher_iOS_App
//
//  Created by Krunal Maisuriya on 06/11/2026.
//

import SwiftUI

struct MissingSkillsView: View {
    let missingSkill: [MissingSkill]
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            SectionHeaderView(
                title: "Missing Skills",
                icon: "exclamationmark.triangle.fill",
                color: Color(AppColors.redColor),
                count: "\(missingSkill.count) Missing"
            )
            
            FlowTagLayoutView(horizontalSpacing: 10, verticalSpacing: 12) {
                ForEach(missingSkill) { skill in
                    Text(skill.skill)
                        .font(.system(size: 13, weight: .medium))
                        .lineLimit(1)
                        .fixedSize(horizontal: true, vertical: false)
                        .foregroundStyle(Color(AppColors.redColor))
                        .padding(.horizontal, 12)
                        .padding(.vertical, 9)
                        .background(Capsule().fill(Color(AppColors.redColor).opacity(0.12)))
                }
            }
            .padding(15)
            .frame(maxWidth: .infinity, alignment: .leading)
            .background(RoundedRectangle(cornerRadius: 20).fill(Color(AppColors.cardColor)))
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}

#Preview {
    MissingSkillsView(missingSkill: [])
}
