import BaseDomainInterface

public protocol SaveUserAuthorityUseCase {
    func callAsFunction(authority: UserAuthorityType)
}
