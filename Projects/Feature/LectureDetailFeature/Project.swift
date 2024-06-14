import DependencyPlugin
import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.module(
    name: ModulePaths.Feature.LectureDetailFeature.rawValue,
    targets: [
        .interface(module: .feature(.LectureDetailFeature), dependencies: [
            .feature(target: .BaseFeature)
        ]),
        .implements(module: .feature(.LectureDetailFeature), dependencies: [
            .feature(target: .LectureDetailFeature, type: .interface),
            .feature(target: .BaseFeature)
        ]),
        .tests(module: .feature(.LectureDetailFeature), dependencies: [
            .feature(target: .LectureDetailFeature)
        ])
    ]
)
