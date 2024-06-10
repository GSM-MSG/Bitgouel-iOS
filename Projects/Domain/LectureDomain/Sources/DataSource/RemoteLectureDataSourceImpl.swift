import BaseDomain
import Foundation
import LectureDomainInterface

final class RemoteLectureDataSourceImpl: BaseRemoteDataSource<LectureAPI>, RemoteLectureDataSource {
    func openLecture(req: OpenLectureRequestDTO) async throws {
        try await request(.openLecture(req: req))
    }

    func fetchLectureList(type: String) async throws -> LectureContentEntity {
        try await request(.fetchLectureList(type: type), dto: FetchLectureListResponseDTO.self).toDomain()
    }

    func fetchLectureDetail(lectureID: String) async throws -> LectureDetailEntity {
        try await request(.fetchLectureDetail(lectureID: lectureID), dto: FetchLectureDetailResponseDTO.self).toDomain()
    }

    func applyLecture(lectureID: String) async throws {
        try await request(.applyLecture(lectureID: lectureID))
    }

    func cancelLecture(lectureID: String) async throws {
        try await request(.cancelLecture(lectureID: lectureID))
    }

    func fetchInstructorList(keyword: String) async throws -> [InstructorInfoEntity] {
        try await request(.fetchInstructorList(keyword: keyword), dto: FetchInstructorListResponseDTO.self).toDomain()
    }

    func fetchLineList(keyword: String, division: String) async throws -> [String] {
        try await request(.fetchLineList(keyword: keyword, division: division), dto: FetchLineListResponseDTO.self)
            .lines
    }

    func fetchDepartmentList(keyword: String) async throws -> [String] {
        try await request(.fetchDepartmentList(keyword: keyword), dto: FetchDepartmentResponseDTO.self).departments
    }

    func fetchDivisionList(keyword: String) async throws -> [String] {
        try await request(.fetchDivisionList(keyword: keyword), dto: FetchDivisionListResponseDTO.self).divisions
    }

    func fetchAppliedLectureList(studentID: String) async throws -> [AppliedLectureEntity] {
        try await request(.fetchAppliedLectureList(studentID: studentID), dto: FetchAppliedLectureListResponseDTO.self)
            .toDomain()
    }

    func fetchApplicantList(lectureID: String) async throws -> [ApplicantInfoEntity] {
        try await request(.fetchApplicantList(lectureID: lectureID), dto: FetchApplicantListResponseDTO.self).toDomain()
    }

    func modifyApplicantWhether(lectureID: String, studentID: String, isComplete: Bool) async throws {
        try await request(.modifyApplicantWhether(lectureID: lectureID, studentID: studentID, isComplete: isComplete))
    }
}
