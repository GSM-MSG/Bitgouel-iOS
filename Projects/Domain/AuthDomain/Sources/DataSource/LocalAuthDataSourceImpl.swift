import AuthDomainInterface
import BaseDomainInterface
import Foundation
import KeychainInterface

public struct LocalAuthDataSourceImpl: LocalAuthDataSource {
    private enum UserDefaultsKey {
        static let userAuthority = "USER_ROLE"
    }

    private let userDefaults: UserDefaults
    private let keychain: any Keychain

    public init(
        keychain: any Keychain,
        userDefaults: UserDefaults
    ) {
        self.keychain = keychain
        self.userDefaults = userDefaults
    }

    public func saveUserAuthority(authority: UserAuthorityType) {
        userDefaults.setValue(authority.rawValue, forKey: UserDefaultsKey.userAuthority)
    }

    public func loadUserAuthority() -> UserAuthorityType {
        let userAuthority = userDefaults.string(forKey: UserDefaultsKey.userAuthority)
        if let userAuthority {
            return UserAuthorityType(rawValue: userAuthority) ?? .user
        } else { return .user }
    }

    public func removeUserAuthority() {
        userDefaults.removeObject(forKey: UserDefaultsKey.userAuthority)
    }

    public func logout() {
        keychain.delete(type: .accessToken)
        keychain.delete(type: .accessExpiredAt)
        keychain.delete(type: .refreshToken)
        keychain.delete(type: .refreshExpiredAt)
        removeUserAuthority()
    }

    public func withdrawal() {
        keychain.delete(type: .accessToken)
        keychain.delete(type: .accessExpiredAt)
        keychain.delete(type: .refreshToken)
        keychain.delete(type: .refreshExpiredAt)
        removeUserAuthority()
    }
}
