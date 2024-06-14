public protocol InputActivityUseCase {
    func callAsFunction(req: InputActivityRequestDTO) async throws
}
