public protocol InputCertificationUseCase {
    func callAsFunction(req: InputCertificationRequestDTO) async throws
}
