public protocol AuthDomainFactory {
    var loginUseCase: any LoginUseCase { get }
    var saveUserAuthorityUseCase: any SaveUserAuthorityUseCase { get }
    var loadUserAuthorityUseCase: any LoadUserAuthorityUseCase { get }
    var reissueTokenUseCase: any ReissueTokenUseCase { get }
    var logoutUseCase: any LogoutUseCase { get }
    var withdrawalUseCase: any WithdrawalUseCase { get }
    var studentSignupUseCase: any StudentSignupUseCase { get }
    var teacherSignupUseCase: any TeacherSignupUseCase { get }
    var bbozzakSignupUseCase: any BbozzakSignupUseCase { get }
    var professorSignupUseCase: any ProfessorSignupUseCase { get }
    var governmentSignupUseCase: any GovernmentSignupUseCase { get }
    var companyInstructorSignupUseCase: any CompanyInstructorSignupUseCase { get }
    var findPasswordUseCase: any FindPasswordUseCase { get }
    var authRepository: any AuthRepository { get }
}
