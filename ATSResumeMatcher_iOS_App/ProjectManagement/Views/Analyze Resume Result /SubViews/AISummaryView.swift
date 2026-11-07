//
//  AISummaryView.swift
//  ATSResumeMatcher_iOS_App
//
//  Created by Krunal Maisuriya on 06/11/2026.
//

import SwiftUI

struct AISummaryView: View {
    @Environment(\.colorScheme) private var colorScheme
    
    var summary: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 7) {
            SectionHeaderView(
                title: "AI Summary",
                icon: "sparkles",
                color: colorScheme == .dark ? .white : .black,
            )
            
            Text(summary)
                .font(.system(size: 15, weight: .regular))
                .opacity(0.65)
                .padding(.horizontal, 5)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}

#Preview {
    AISummaryView(summary: "")
}
