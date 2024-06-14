import AuthDomainInterface
import BaseDomain
import Foundation
import KeychainInterface

final class RemoteAuthDataSourceImpl: BaseRemoteDataSource<AuthAPI>, RemoteAuthDataSource {
    public let keychain: Keychain

    init(keychain: any Keychain) {
        self.keychain = keychain
        super.init(keychain: keychain)
    }

    func login(req: LoginRequestDTO) async throws -> UserLoginEntity {
        try await request(.login(req: req), dto: LoginResponseDTO.self).toDomain()
    }

    func reissueToken() async throws {
        try await request(.reissueToken)
    }

    func logout(accessToken: String, refreshToken: String) async throws {
        try await request(
            .logout(
                accessToken: keychain.load(type: .accessToken),
                refreshToken: keychain.load(type: .refreshToken)
            )
        )
    }

    func withdrawal() async throws {
        try await request(.withdrawal)
    }

    func studentSignup(req: StudentSignupRequestDTO) async throws {
        try await request(.studentSignup(req: req))
    }

    func teacherSignup(req: TeacherSignupRequestDTO) async throws {
        try await request(.teacherSignup(req: req))
    }

    func bbozzakSignup(req: BbozzakSignupRequestDTO) async throws {
        try await request(.bbozzakSignup(req: req))
    }

    func professorSignup(req: ProfessorSignupRequestDTO) async throws {
        try await request(.professorSignup(req: req))
    }

    func governmentSignup(req: GovernmentSignupRequestDTO) async throws {
        try await request(.governmentSignup(req: req))
    }

    func companyInstructorSignup(req: CompanyInstructorSignupRequestDTO) async throws {
        try await request(.companyInstructorSignup(req: req))
    }

    func findPassword(req: FindPasswordRequestDTO) async throws {
        try await request(.findPassword(req: req))
    }
}
