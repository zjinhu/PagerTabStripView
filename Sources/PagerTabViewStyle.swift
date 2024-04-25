//
//  PagerTabViewStyle.swift
//  PagerTabStripView
//
//  Copyright © 2021 Xmartlabs SRL. All rights reserved.
//

import Foundation
import SwiftUI

public enum PagerStyle {
    
    internal var tabItemSpacing: CGFloat {
        switch self {
        case .bar(_, _, let spacing, _):
            return spacing
        case .barButton(_, _, let spacing, _, _):
            return spacing
        case .liner(_, _, _, let spacing, _, _, _):
            return spacing
        case .custom(let spacing, _, _, _, _):
            return spacing
        }
    }
    
    internal var indicatorBarColor: Color {
        switch self {
        case .bar(_, let color, _, _):
            return color
        case .barButton(_, let color, _, _, _):
            return color
        case .liner(_, let color, _, _, _, _, _):
            return color
        case .custom:
            return Color.blue
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
        case .liner(_, _, _, _, let height, _, _):
            return height
        case .custom(_, let height, _, _, _):
            return height
        default:
            return 0
        }
    }
    
    internal var backgroundColor: Color {
        switch self {
        case .liner(_, _, _, _, _, let color, _):
            return color
        default:
            return .white
        }
    }

    internal var padding: EdgeInsets {
        switch self {
        case .liner(_, _, let padding, _, _, _, _):
            return padding
        default:
            return EdgeInsets(top: 5, leading: 16, bottom: 0, trailing: 16)
        }
    }

    internal var placedInToolbar: Bool {
        switch self {
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
    
    case liner(indicatorBarHeight: CGFloat = 2,
               indicatorBarColor: Color = .blue,
               padding: EdgeInsets = EdgeInsets(top: 5, leading: 16, bottom: 0, trailing: 16),
               tabItemSpacing: CGFloat = 10,
               tabItemHeight: CGFloat = 50,
               backgroundColor: Color = .white,
               placedInToolbar: Bool = false)
    
    case custom(tabItemSpacing: CGFloat, 
                tabItemHeight: CGFloat,
                placedInToolbar: Bool,
                indicator: () -> AnyView,
                background: () -> AnyView)
    
    case bar(indicatorBarHeight: CGFloat = 2, 
             indicatorBarColor: Color = .blue,
             tabItemSpacing: CGFloat = 0,
             placedInToolbar: Bool = false)

    case barButton(indicatorBarHeight: CGFloat = 2,
                   indicatorBarColor: Color = .blue,
                   tabItemSpacing: CGFloat = 10,
                   tabItemHeight: CGFloat = 50,
                   placedInToolbar: Bool = false)
}



extension EnvironmentValues {
    private struct PagerStyleKey: EnvironmentKey {
        static var defaultValue: PagerStyle{
            PagerStyle.liner()
        }
    }
    
    var pagerStyle: PagerStyle {
        get { self[PagerStyleKey.self] }
        set { self[PagerStyleKey.self] = newValue }
    }
}
