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
            VStack(alignment: .leading, spacing: 12) {
                ForEach(improvements.enumerated(), id: \.offset) { index, improvement in
                    
                    VStack(alignment: .leading, spacing: 6) {
                        HStack(alignment: .top) {
                            Text("\(index+1).")
                            Text(improvement.suggestion)
                        }
                        .font(.system(size: 14, weight: .semibold))

                        Text(improvement.reason)
                            .font(.system(size: 13, weight: .regular))
                            .opacity(0.75)
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    
                    if (index != (improvements.count - 1)) {
                        Divider()
                            .padding(.vertical, 3)
                    }
                }
            }
            .padding(15)
            .background(RoundedRectangle(cornerRadius: 20).fill(Color(AppColors.cardColor)))
        }
        .frame(maxWidth: .infinity, alignment: .leading)

    }
}

#Preview {
    ImprovementsView(improvements: [])
}
