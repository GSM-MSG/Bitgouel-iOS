import SwiftUI

public extension Color.BitgouelColorSystem {
    // swiftlint: disable identifier_name
    enum Sub: BitgouelColorable {
        case s1
        case s2
        case s3
        case s4
        case s5
        case s6
        case s7
        case s8
        case s9
    }
    // swiftlint: enable identifier_name
}

public extension Color.BitgouelColorSystem.Sub {
    var color: Color {
        switch self {
        case .s1: return DesignSystemAsset.Sub.s1.swiftUIColor
        case .s2: return DesignSystemAsset.Sub.s2.swiftUIColor
        case .s3: return DesignSystemAsset.Sub.s3.swiftUIColor
        case .s4: return DesignSystemAsset.Sub.s4.swiftUIColor
        case .s5: return DesignSystemAsset.Sub.s5.swiftUIColor
        case .s6: return DesignSystemAsset.Sub.s6.swiftUIColor
        case .s7: return DesignSystemAsset.Sub.s7.swiftUIColor
        case .s8: return DesignSystemAsset.Sub.s8.swiftUIColor
        case .s9: return DesignSystemAsset.Sub.s9.swiftUIColor
        }
    }
}
