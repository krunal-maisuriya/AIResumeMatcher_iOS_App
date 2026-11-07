//
//  ImprovementsView.swift
//  ATSResumeMatcher_iOS_App
//
//  Created by Krunal Maisuriya on 06/11/2026.
//

import SwiftUI

struct ImprovementsView: View {
    let improvements: [Improvements]
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            
            //  Header
            SectionHeaderView(
                title: "Improvement Suggestions",
                icon: "lightbulb.fill",
                color: Color(AppColors.orangeColor),
            )
            
            // Suggestions
            VStack(alignment: .leading, spacing: 15) {
                ForEach(improvements.enumerated(), id: \.offset) { index, improvement in
                    
                    HStack(alignment: .top, spacing: 12) {
                        // Number indicator
                        Text("\(index + 1)")
                            .font(.system(size: 13, weight: .bold))
                            .foregroundStyle(Color(AppColors.orangeColor))
                            .frame(width: 28, height: 28)
                            .background(Circle().fill(Color(AppColors.orangeColor).opacity(0.15)))
                        
                        VStack(alignment: .leading, spacing: 6) {
                            Text(improvement.suggestion)
                                .font(.system(size: 14, weight: .semibold))
                                .fixedSize(horizontal: false, vertical: true)

                            Text(improvement.reason)
                                .font(.system(size: 13, weight: .regular))
                                .foregroundStyle(.secondary)
                                .fixedSize(horizontal: false, vertical: true)
                        }
                        
                        Spacer(minLength: 0)
                    }
                    
                    if (index != (improvements.count - 1)) {
                        Divider()
                            .padding(.vertical, 3)
                    }
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
    ImprovementsView(improvements: [])
}
