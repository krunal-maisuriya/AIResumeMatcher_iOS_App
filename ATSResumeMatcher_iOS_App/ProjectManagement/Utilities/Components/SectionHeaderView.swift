//
//  SectionHeaderView.swift
//  ATSResumeMatcher_iOS_App
//
//  Created by Krunal Maisuriya on 06/11/2026.
//

import SwiftUI

struct SectionHeaderView: View {
    var title: String
    var icon: String
    var color: Color
    var count: String = ""
    
    var body: some View {
        HStack(alignment: .center) {
            Image(systemName: icon)
                .font(.system(size: 18, weight: .bold))
                .foregroundStyle(color)
            
            Text(title)
            
            Spacer()
            
            if !count.isEmpty {
                Text(count)
                    .font(.system(size: 12, weight: .semibold))
                    .foregroundStyle(color)
                    .padding(.horizontal, 10)
                    .padding(.vertical, 8)
                    .background(Capsule().fill(color.opacity(0.15)))
            }
        }
        .font(.system(size: 18, weight: .bold))
    }
}

#Preview {
    SectionHeaderView(title: "", icon: "", color: .black, count: "6 Matched")
}
