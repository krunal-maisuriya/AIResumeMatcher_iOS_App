//
//  YourStrengthsView.swift
//  ATSResumeMatcher_iOS_App
//
//  Created by Krunal Maisuriya on 06/11/2026.
//

import SwiftUI

struct YourStrengthsView: View {
    @Environment(\.colorScheme) private var colorScheme
    
    let strengths: [String]
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            SectionHeaderView(
                title: "Your Strengths",
                icon: "star.fill",
                color: Color(colorScheme == .dark ? AppColors.greenColor : AppColors.darkGreenColor),
                count: "\(strengths.count) Strengths"
            )
            
            VStack(alignment: .leading, spacing: 14) {
                ForEach(strengths, id: \.self) { strength in
                    HStack(alignment: .top, spacing: 10) {
                        Image(systemName: "checkmark.circle.fill")
                            .font(.system(size: 16))
                            .foregroundStyle(Color(colorScheme == .dark ? AppColors.greenColor : AppColors.darkGreenColor))
                            .padding(.top, 1)
                        
                        Text(strength)
                            .font(.system(size: 13, weight: .regular))
                            .fixedSize(horizontal: false, vertical: true)

                        Spacer(minLength: 0)
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
    YourStrengthsView(strengths: [])
}
