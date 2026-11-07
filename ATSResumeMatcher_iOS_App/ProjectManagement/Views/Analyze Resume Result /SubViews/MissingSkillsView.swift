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
            
            VStack {
                ForEach(missingSkill.enumerated(), id: \.offset) { index, mSkill in
                    VStack {
                        HStack(alignment: .center, spacing: 10) {
                            Text(mSkill.skill)
                                    .font(.system(size: 14, weight: .semibold))
                                
                            Spacer()
                            
                            Text(mSkill.importance)
                                .font(.system(size: 13, weight: .semibold))
                                .foregroundStyle(Color(AppColors.redColor))
                                .padding(.horizontal)
                                .padding(.vertical, 6)
                                .background {
                                    Capsule().fill(Color(AppColors.redColor).opacity(0.15))
                                }
                        }
                        .padding(EdgeInsets(top: 0, leading: 13, bottom: 0, trailing: 8))
                        
                        if (index != (missingSkill.count - 1)) {
                            Divider()
                                .padding(.vertical, 3)
                        }
                    }
                }
            }
            .padding(.vertical, 15)
            .background(RoundedRectangle(cornerRadius: 20).fill(Color(AppColors.cardColor)))
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}

#Preview {
    MissingSkillsView(missingSkill: [])
}
