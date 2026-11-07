//
//  SelectedResumeView.swift
//  ATSResumeMatcher_iOS_App
//
//  Created by Krunal Maisuriya on 05/11/2026.
//

import SwiftUI

struct SelectedResumeView: View {
    let fileName: String
    let fileSize: String
    let removeAction: () -> Void

    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(fileName)
                    .font(.system(size: 16, weight: .semibold))
                    .lineLimit(1)
                
                Text("\(fileSize) · PDF Document")
                    .font(.system(size: 15, weight: .regular))
                    .lineLimit(1)
            }
            
            Spacer()
            Button(action: removeAction) {
                Image(systemName: "trash")
            }
            .font(.system(size: 14, weight: .medium))
            .tint(.red)
        }
        .padding(.vertical, 15)
        .padding(.horizontal, 5)
    }
}

#Preview {
    SelectedResumeView(fileName: "Abc Resume", fileSize: "2.5 KB", removeAction: {})
}
