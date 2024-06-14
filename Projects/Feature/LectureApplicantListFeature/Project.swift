import DependencyPlugin
import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.module(
    name: ModulePaths.Feature.LectureApplicantListFeature.rawValue,
    targets: [
        .interface(module: .feature(.LectureApplicantListFeature), dependencies: [
            .feature(target: .BaseFeature)
        ]),
        .implements(module: .feature(.LectureApplicantListFeature), dependencies: [
            .feature(target: .LectureApplicantListFeature, type: .interface),
            .feature(target: .BaseFeature)
        ]),
        .tests(module: .feature(.LectureApplicantListFeature), dependencies: [
            .feature(target: .LectureApplicantListFeature)
        ])
    ]
)
