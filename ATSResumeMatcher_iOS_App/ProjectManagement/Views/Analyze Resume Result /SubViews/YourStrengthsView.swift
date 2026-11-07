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
                color: Color(AppColors.darkGreenColor),
                count: "\(strengths.count) Strengths"
            )
            
            VStack {
                ForEach(strengths, id: \.self) { strength in
                    VStack(alignment: .leading) {
                        HStack(alignment: .top , spacing: 8) {
                            Circle()
                                .fill(colorScheme == .dark ? .white : .black)
                                .frame(width: 7, height: 7)
                                .offset(y: 5)
                                
                            Text(strength)
                                .font(.system(size: 13, weight: .regular))
                            
                            Spacer()
                        }
                        .padding(.vertical, 3)
                        .padding(.horizontal)
                    }
                }
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.vertical, 15)
            .background(RoundedRectangle(cornerRadius: 20).fill(Color(AppColors.cardColor)))
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}

#Preview {
    YourStrengthsView(strengths: [])
}
