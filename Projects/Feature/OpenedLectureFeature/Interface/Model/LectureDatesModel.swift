import Foundation

public struct LectureDatesModel: Equatable {
    public let completeDate: Date
    public let startTime: Date
    public let endTime: Date

    public init(
        completeDate: Date,
        startTime: Date,
        endTime: Date
    ) {
        self.completeDate = completeDate
        self.startTime = startTime
        self.endTime = endTime
    }
}
