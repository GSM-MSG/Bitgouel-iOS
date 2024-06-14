import SwiftUI

public extension Color.BitgouelColorSystem {
    // swiftlint: disable identifier_name
    enum Primary: BitgouelColorable {
        case p1
        case p2
        case p3
        case p4
        case p5
        case p6
        case p7
        case p8
        case p9
    }
    // swiftlint: enable identifier_name
}

public extension Color.BitgouelColorSystem.Primary {
    var color: Color {
        switch self {
        case .p1: return DesignSystemAsset.Primary.p1.swiftUIColor
        case .p2: return DesignSystemAsset.Primary.p2.swiftUIColor
        case .p3: return DesignSystemAsset.Primary.p3.swiftUIColor
        case .p4: return DesignSystemAsset.Primary.p4.swiftUIColor
        case .p5: return DesignSystemAsset.Primary.p5.swiftUIColor
        case .p6: return DesignSystemAsset.Primary.p6.swiftUIColor
        case .p7: return DesignSystemAsset.Primary.p7.swiftUIColor
        case .p8: return DesignSystemAsset.Primary.p8.swiftUIColor
        case .p9: return DesignSystemAsset.Primary.p9.swiftUIColor
        }
    }
}
