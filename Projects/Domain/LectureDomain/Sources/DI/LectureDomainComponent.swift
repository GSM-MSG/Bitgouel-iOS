import KeychainInterface
import LectureDomainInterface
import NeedleFoundation

public protocol LectureDomainDependency: Dependency {
    var keychainFactory: any KeyChainFactory { get }
}

public final class LectureDomainComponent: Component<LectureDomainDependency>, LectureDomainFactory {
    public var openLectureUseCase: any OpenLectureUseCase {
        OpenLectureUseCaseImpl(lectureRepository: lectureRepository)
    }

    public var fetchLectureListUseCase: any FetchLectureListUseCase {
        FetchLectureListUseCaseImpl(lectureRepository: lectureRepository)
    }

    public var fetchLectureDetailUseCase: any FetchLectureDetailUseCase {
        FetchLectureDetailUseCaseImpl(lectureRepository: lectureRepository)
    }

    public var applyLectureUseCase: any ApplyLectureUseCase {
        ApplyLectureUseCaseImpl(lectureRepository: lectureRepository)
    }

    public var cancelLectureUseCase: any CancelLectureUseCase {
        CancelLectureUseCaseImpl(lectureRepository: lectureRepository)
    }

    public var fetchInstructorListUseCase: any FetchInstructorListUseCase {
        FetchInstructorListUseCaseImpl(lectureRepository: lectureRepository)
    }

    public var fetchLineListUseCase: any FetchLineListUseCase {
        FetchLineListUseCaseImpl(lectureRepository: lectureRepository)
    }

    public var fetchDepartmentListUseCase: any FetchDepartmentListUseCase {
        FetchDepartmentListUseCaseImpl(lectureRepository: lectureRepository)
    }

    public var fetchDivisionListUseCase: any FetchDivisionListUseCase {
        FetchDivisionListUseCaseImpl(lectureRepository: lectureRepository)
    }

    public var fetchAppliedLectureListUseCase: any FetchAppliedLectureListUseCase {
        FetchAppliedLectureListUseCaseImpl(lectureRepository: lectureRepository)
    }

    public var fetchApplicantListUseCase: any FetchApplicantListUseCase {
        FetchApplicantListUseCaseImpl(lectureRepository: lectureRepository)
    }

    public var modifyApplicantWhetherUseCase: any ModifyApplicantWhetherUseCase {
        ModifyApplicantWhetherUseCaseImpl(lectureRepository: lectureRepository)
    }

    public var lectureRepository: any LectureRepository {
        LectureRepositoryImpl(remoteLectureDataSource: remoteLectureDataSource)
    }

    var remoteLectureDataSource: any RemoteLectureDataSource {
        RemoteLectureDataSourceImpl(keychain: dependency.keychainFactory.keychain)
    }
}
