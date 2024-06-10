import SwiftUI

public extension Color.BitgouelColorSystem {
    // swiftlint: disable identifier_name
    enum Error: BitgouelColorable {
        case e1
        case e2
        case e3
        case e4
        case e5
        case e6
        case e7
        case e8
        case e9
    }
    // swiftlint: enable identifier_name
}

public extension Color.BitgouelColorSystem.Error {
    var color: Color {
        switch self {
        case .e1: return DesignSystemAsset.Error.e1.swiftUIColor
        case .e2: return DesignSystemAsset.Error.e2.swiftUIColor
        case .e3: return DesignSystemAsset.Error.e3.swiftUIColor
        case .e4: return DesignSystemAsset.Error.e4.swiftUIColor
        case .e5: return DesignSystemAsset.Error.e5.swiftUIColor
        case .e6: return DesignSystemAsset.Error.e6.swiftUIColor
        case .e7: return DesignSystemAsset.Error.e7.swiftUIColor
        case .e8: return DesignSystemAsset.Error.e8.swiftUIColor
        case .e9: return DesignSystemAsset.Error.e9.swiftUIColor
        }
    }
}
