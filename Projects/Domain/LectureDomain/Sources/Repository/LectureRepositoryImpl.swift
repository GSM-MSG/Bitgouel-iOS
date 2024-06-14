import LectureDomainInterface

struct LectureRepositoryImpl: LectureRepository {
    private let remoteLectureDataSource: RemoteLectureDataSource

    init(remoteLectureDataSource: RemoteLectureDataSource) {
        self.remoteLectureDataSource = remoteLectureDataSource
    }

    func openLecture(req: OpenLectureRequestDTO) async throws {
        try await remoteLectureDataSource.openLecture(req: req)
    }

    func fetchLectureList(type: String) async throws -> LectureContentEntity {
        try await remoteLectureDataSource.fetchLectureList(type: type)
    }

    func fetchLectureDetail(lectureID: String) async throws -> LectureDetailEntity {
        try await remoteLectureDataSource.fetchLectureDetail(lectureID: lectureID)
    }

    func applyLecture(lectureID: String) async throws {
        try await remoteLectureDataSource.applyLecture(lectureID: lectureID)
    }

    func cancelLecture(lectureID: String) async throws {
        try await remoteLectureDataSource.cancelLecture(lectureID: lectureID)
    }

    func fetchInstructorList(keyword: String) async throws -> [InstructorInfoEntity] {
        try await remoteLectureDataSource.fetchInstructorList(keyword: keyword)
    }

    func fetchLineList(keyword: String, division: String) async throws -> [String] {
        try await remoteLectureDataSource.fetchLineList(keyword: keyword, division: division)
    }

    func fetchDepartmentList(keyword: String) async throws -> [String] {
        try await remoteLectureDataSource.fetchDepartmentList(keyword: keyword)
    }

    func fetchDivisionList(keyword: String) async throws -> [String] {
        try await remoteLectureDataSource.fetchDivisionList(keyword: keyword)
    }

    func fetchAppliedLectureList(studentID: String) async throws -> [AppliedLectureEntity] {
        try await remoteLectureDataSource.fetchAppliedLectureList(studentID: studentID)
    }

    func fetchApplicantList(lectureID: String) async throws -> [ApplicantInfoEntity] {
        try await remoteLectureDataSource.fetchApplicantList(lectureID: lectureID)
    }

    func modifyApplicantWhether(lectureID: String, studentID: String, isComplete: Bool) async throws {
        try await remoteLectureDataSource.modifyApplicantWhether(
            lectureID: lectureID,
            studentID: studentID,
            isComplete: isComplete
        )
    }
}
