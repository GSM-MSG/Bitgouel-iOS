import BaseDomainInterface

public protocol LocalAuthDataSource {
    func logout() async throws
    func withdrawal() async throws
    func saveUserAuthority(authority: UserAuthorityType)
    func loadUserAuthority() -> UserAuthorityType
}
