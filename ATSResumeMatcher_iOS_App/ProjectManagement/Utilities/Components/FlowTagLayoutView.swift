//
//  FlowTagLayoutView.swift
//  ATSResumeMatcher_iOS_App
//
//  Created by Krunal Maisuriya on 07/11/2026.
//

import Foundation
import SwiftUI

struct FlowTagLayoutView: Layout {
    var horizontalSpacing: CGFloat = 12
    var verticalSpacing: CGFloat = 12

    func sizeThatFits(
        proposal: ProposedViewSize,
        subviews: Subviews,
        cache: inout ()
    ) -> CGSize {

        let maxWidth = proposal.width ?? .infinity

        var currentX: CGFloat = 0
        var currentY: CGFloat = 0
        var rowHeight: CGFloat = 0

        for subview in subviews {
            let size = subview.sizeThatFits(.unspecified)

            if currentX + size.width > maxWidth && currentX > 0 {
                currentX = 0
                currentY += rowHeight + verticalSpacing
                rowHeight = 0
            }

            currentX += size.width + horizontalSpacing
            rowHeight = max(rowHeight, size.height)
        }

        let totalHeight = subviews.isEmpty ? 0 : currentY + rowHeight

        return CGSize(width: proposal.width ?? currentX, height: totalHeight)
    }

    func placeSubviews(
        in bounds: CGRect,
        proposal: ProposedViewSize,
        subviews: Subviews,
        cache: inout ()
    ) {

        var currentX = bounds.minX
        var currentY = bounds.minY
        var rowHeight: CGFloat = 0

        for subview in subviews {

            let size = subview.sizeThatFits(.unspecified)

            if currentX + size.width > bounds.maxX &&
                currentX > bounds.minX {

                currentX = bounds.minX
                currentY += rowHeight + verticalSpacing
                rowHeight = 0
            }

            subview.place(
                at: CGPoint(x: currentX, y: currentY),
                anchor: .topLeading,
                proposal: ProposedViewSize(size)
            )

            currentX += size.width + horizontalSpacing
            rowHeight = max(rowHeight, size.height)
        }
    }
}
