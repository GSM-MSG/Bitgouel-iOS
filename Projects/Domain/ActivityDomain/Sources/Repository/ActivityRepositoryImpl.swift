import ActivityDomainInterface

struct ActivityRepositoryImpl: ActivityRepository {
    private let remoteActivityDataSource: any RemoteActivityDataSource

    init(remoteActivityDataSource: any RemoteActivityDataSource) {
        self.remoteActivityDataSource = remoteActivityDataSource
    }

    func inputActivity(req: InputActivityRequestDTO) async throws {
        try await remoteActivityDataSource.inputActivity(req: req)
    }

    func modifyActivity(activityID: String, req: InputActivityRequestDTO) async throws {
        try await remoteActivityDataSource.modifyActivity(activityID: activityID, req: req)
    }

    func deleteActivity(activityID: String) async throws {
        try await remoteActivityDataSource.deleteActivity(activityID: activityID)
    }

    func fetchMyActivity() async throws -> ActivityContentEntity {
        try await remoteActivityDataSource.fetchMyActivity()
    }

    func fetchActivityByID(studentID: String) async throws -> ActivityContentEntity {
        try await remoteActivityDataSource.fetchActivityByID(studentID: studentID)
    }

    func fetchActivityList() async throws -> ActivityContentEntity {
        try await remoteActivityDataSource.fetchActivityList()
    }

    func fetchActivityDetail(activityID: String) async throws -> ActivityDetailEntity {
        try await remoteActivityDataSource.fetchActivityDetail(activityID: activityID)
    }
}
