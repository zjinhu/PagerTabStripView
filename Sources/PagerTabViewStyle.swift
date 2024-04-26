//
//  PagerTabViewStyle.swift
//  PagerTabStripView
//
//  Copyright © 2021 Xmartlabs SRL. All rights reserved.
//

import Foundation
import SwiftUI

public enum PagerStyle {
    case segmentedControl(backgroundColor: Color = .white,
                          padding: EdgeInsets = EdgeInsets(top: 5, leading: 10, bottom: 0, trailing: 10),
                          placedInToolbar: Bool = false)

    case bar(indicatorBarHeight: CGFloat = 2,
             indicatorBarColor: Color = .blue,
             tabItemSpacing: CGFloat = 0,
             placedInToolbar: Bool = false)

    case barButton(indicatorBarHeight: CGFloat = 2,
                   indicatorBarColor: Color = .blue,
                   tabItemSpacing: CGFloat = 0, 
                   tabItemHeight: CGFloat = 60,
                   placedInToolbar: Bool = false)

    case liner(indicatorBarHeight: CGFloat = 2,
               indicatorPadding: CGFloat = 5,
               indicatorBarColor: Color = .blue,
               padding: EdgeInsets = EdgeInsets(top: 5, leading: 10, bottom: 0, trailing: 10),
               tabItemSpacing: CGFloat = 0,
               tabItemHeight: CGFloat = 60,
               placedInToolbar: Bool = false)

    case custom(tabItemSpacing: CGFloat,
                tabItemHeight: CGFloat,
                placedInToolbar: Bool,
                indicator: () -> AnyView,
                background: () -> AnyView)

    internal var indicatorPadding: CGFloat {
        switch self {
        case .liner(_, let spacing, _, _, _, _, _):
            return spacing
        default:
            return 8
        }
    }
    
    internal var tabItemSpacing: CGFloat {
        switch self {
        case .bar(_, _, let spacing, _):
            return spacing
        case .barButton(_, _, let spacing, _, _):
            return spacing
        case .liner(_, _, _, _, let spacing, _, _):
            return spacing
        case .custom(let spacing, _, _, _, _):
            return spacing
        default:
            return 0
        }
    }

    internal var indicatorBarColor: Color {
        switch self {
        case .bar(_, let color, _, _):
            return color
        case .barButton(_, let color, _, _, _):
            return color
        case .liner(_, _, let color, _, _, _, _):
            return color
        case .custom:
            /// - Note: Clear color will hide the indicator and it's hard find the cause of this for the user
            return Color.blue
        default:
            return Color.clear
        }
    }

    internal var indicatorBarHeight: CGFloat {
        switch self {
        case .bar(let height, _, _, _):
            return height
        case .barButton(let height, _, _, _, _):
            return height
        case .liner(let height, _, _, _, _, _, _):
            return height
        default:
            return 2
        }
    }

    internal var tabItemHeight: CGFloat {
        switch self {
        case .barButton(_, _, _, let height, _):
            return height
        case .liner(_, _, _, _, _, let height, _):
            return height
        case .custom(_, let height, _, _, _):
            return height
        default:
            return 0
        }
    }

    internal var backgroundColor: Color {
        switch self {
        case .segmentedControl(let backgroundColor, _, _):
            return backgroundColor
        default:
            return .white
        }
    }

    internal var padding: EdgeInsets {
        switch self {
        case .segmentedControl(_, let padding, _):
            return padding
        case .liner(_, _, _, let padding, _, _, _):
            return padding
        default:
            return EdgeInsets(top: 5, leading: 10, bottom: 0, trailing: 10)
        }
    }

    internal var placedInToolbar: Bool {
        switch self {
        case .segmentedControl(_, _, let placedInToolbar):
            return placedInToolbar
        case .bar( _, _, _, let placedInToolbar):
            return placedInToolbar
        case .barButton( _, _, _, _, let placedInToolbar):
            return placedInToolbar
        case .liner( _, _, _, _, _, _, let placedInToolbar):
            return placedInToolbar
        case .custom( _, _, let placedInToolbar, _, _):
            return placedInToolbar
        }
    }
}

private struct PagerStyleKey: EnvironmentKey {
    static let defaultValue = PagerStyle.barButton()
}

extension EnvironmentValues {
    var pagerStyle: PagerStyle {
        get { self[PagerStyleKey.self] }
        set { self[PagerStyleKey.self] = newValue }
    }
}
