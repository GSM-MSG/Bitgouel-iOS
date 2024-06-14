import ActivityDomainInterface
import BaseDomain

final class RemoteActivityDataSourceImpl: BaseRemoteDataSource<ActivityAPI>, RemoteActivityDataSource {
    func inputActivity(req: InputActivityRequestDTO) async throws {
        try await request(.inputActivity(req: req))
    }

    func modifyActivity(activityID: String, req: InputActivityRequestDTO) async throws {
        try await request(.modifyActivity(activityID: activityID, req: req))
    }

    func deleteActivity(activityID: String) async throws {
        try await request(.deleteActivity(activityID: activityID))
    }

    func fetchMyActivity() async throws -> ActivityContentEntity {
        try await request(
            .fetchMyActivity,
            dto: ActivitiesResponseDTO.self
        )
        .toDomain()
    }

    func fetchActivityByID(studentID: String) async throws -> ActivityContentEntity {
        try await request(
            .fetchActivityByID(studentID: studentID),
            dto: ActivitiesResponseDTO.self
        )
        .toDomain()
    }

    func fetchActivityList() async throws -> ActivityContentEntity {
        try await request(
            .fetchActivityList,
            dto: ActivitiesResponseDTO.self
        )
        .toDomain()
    }

    func fetchActivityDetail(activityID: String) async throws -> ActivityDetailEntity {
        try await request(
            .fetchActivityDetail(activityID: activityID),
            dto: ActivityDetailResponseDTO.self
        )
        .toDomain()
    }
}
