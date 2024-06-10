public protocol ClubDomainFactory {
    var fetchClubListUseCase: any FetchClubListUseCase { get }
    var fetchClubDetailUseCase: any FetchClubDetailUseCase { get }
    var fetchStudentListByClubUseCase: any FetchStudentListByClubUseCase { get }
    var fetchStudentDetailByClubUseCase: any FetchStudentDetailByClubUseCase { get }
    var clubRepository: any ClubRepository { get }
}
