import Foundation

public struct FetchDepartmentResponseDTO: Decodable {
    public let departments: [String]
    
    public init(departments: [String]) {
        self.departments = departments
    }
}

extension FetchDepartmentResponseDTO {
    func toDomain() -> DepartmentListEntity {
        DepartmentListEntity(departments: departments)
    }
}
