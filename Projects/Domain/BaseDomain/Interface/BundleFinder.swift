import Foundation

public final class BundleFinder {}

extension Foundation.Bundle {
    public static let module = Bundle(for: BundleFinder.self)
}
