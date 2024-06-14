public protocol LectureDomainFactory {
    var openLectureUseCase: OpenLectureUseCase { get }
    var fetchLectureListUseCase: any FetchLectureListUseCase { get }
    var fetchLectureDetailUseCase: any FetchLectureDetailUseCase { get }
    var applyLectureUseCase: any ApplyLectureUseCase { get }
    var cancelLectureUseCase: any CancelLectureUseCase { get }
    var fetchInstructorListUseCase: any FetchInstructorListUseCase { get }
    var fetchLineListUseCase: any FetchLineListUseCase { get }
    var fetchDepartmentListUseCase: FetchDepartmentListUseCase { get }
    var fetchDivisionListUseCase: FetchDivisionListUseCase { get }
    var fetchAppliedLectureListUseCase: FetchAppliedLectureListUseCase { get }
    var fetchApplicantListUseCase: any FetchApplicantListUseCase { get }
    var modifyApplicantWhetherUseCase: any ModifyApplicantWhetherUseCase { get }
    var lectureRepository: any LectureRepository { get }
}
