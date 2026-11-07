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
                color: Color(AppColors.darkGreenColor),
                count: "\(matchedSkill.count) Matched"
            )
            
            VStack {
                ForEach(matchedSkill.enumerated(), id: \.offset) { index, matchSkill in
                    VStack {
                        HStack(alignment: .top, spacing: 10) {
                            Image(systemName: "checkmark.circle.fill")
                                .resizable()
                                .scaledToFill()
                                .frame(width: 17, height: 17)
                                .offset(y: 3)
                                .foregroundStyle(Color(colorScheme == .dark ? AppColors.greenColor : AppColors.darkGreenColor))
                            
                            VStack(alignment: .leading) {
                                Text(matchSkill.skill)
                                    .font(.system(size: 17, weight: .bold))
                                
                                Text(matchSkill.evidence)
                                    .font(.system(size: 13, weight: .regular))
                                    .opacity(0.75)
                            }
                            
                            Spacer()
                        }
                        .padding(.horizontal)

                        if (index != (matchedSkill.count - 1)) {
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
    MatchedSkillsView(matchedSkill: [])
}
