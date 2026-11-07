//
//  MatchedSkillsView.swift
//  ATSResumeMatcher_iOS_App
//
//  Created by Krunal Maisuriya on 06/11/2026.
//

import SwiftUI

struct MatchedSkillsView: View {
    @Environment(\.colorScheme) private var colorScheme
    
    let matchedSkill: [MatchedSkill]
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            
            SectionHeaderView(
                title: "Matched Skills",
                icon: "checkmark.seal.fill",
                color: Color(colorScheme == .dark ? AppColors.greenColor : AppColors.darkGreenColor),
                count: "\(matchedSkill.count) Matched"
            )
            
            FlowTagLayoutView(horizontalSpacing: 10, verticalSpacing: 12) {
                ForEach(matchedSkill) { skill in
                    Text(skill.skill)
                        .font(.system(size: 13, weight: .medium))
                        .lineLimit(1)
                        .fixedSize(horizontal: true, vertical: false)
                        .foregroundStyle(Color(colorScheme == .dark ? AppColors.greenColor : AppColors.darkGreenColor))
                        .padding(.horizontal, 12)
                        .padding(.vertical, 9)
                        .background(Capsule().fill(Color(colorScheme == .dark ? AppColors.greenColor : AppColors.darkGreenColor).opacity(0.12)))
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
    MatchedSkillsView(matchedSkill: [])
}
