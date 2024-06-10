public protocol EmailDomainFactory {
    var sendEmailCertificationLinkUseCase: any SendEmailCertificationLinkUseCase { get }
    var fetchEmailVerificationStatusUseCase: any FetchEmailVertificationStatusUseCase { get }
    var emailRepository: any EmailRepository { get }
}
