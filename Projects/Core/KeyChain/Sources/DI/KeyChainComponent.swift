import KeychainInterface
import NeedleFoundation

public final class KeyChainComponent: Component<EmptyDependency>, KeyChainFactory {
    public var keychain: any Keychain {
        KeychainImpl()
    }
}
