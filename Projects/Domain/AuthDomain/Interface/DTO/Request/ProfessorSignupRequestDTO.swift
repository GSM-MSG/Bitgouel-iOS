import BaseDomainInterface
import Foundation

public struct ProfessorSignupRequestDTO: Encodable {
    public let email: String
    public let name: String
    public let phoneNumber: String
    public let password: String
    public let highSchool: HighSchoolType
    public let clubName: String
    public let university: String

    public init(
        email: String,
        name: String,
        phoneNumber: String,
        password: String,
        highSchool: HighSchoolType,
        clubName: String,
        university: String
    ) {
        self.email = email
        self.name = name
        self.phoneNumber = phoneNumber
        self.password = password
        self.highSchool = highSchool
        self.clubName = clubName
        self.university = university
    }
}
