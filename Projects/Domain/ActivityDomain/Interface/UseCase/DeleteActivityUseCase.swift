public protocol DeleteActivityUseCase {
    func callAsFunction(activityID: String) async throws
}
