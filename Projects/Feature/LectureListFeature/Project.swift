import DependencyPlugin
import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.module(
    name: ModulePaths.Feature.LectureListFeature.rawValue,
    targets: [
        .interface(module: .feature(.LectureListFeature), dependencies: [
            .feature(target: .BaseFeature)
        ]),
        .implements(module: .feature(.LectureListFeature), dependencies: [
            .feature(target: .LectureListFeature, type: .interface),
            .feature(target: .BaseFeature)
        ]),
        .tests(module: .feature(.LectureListFeature), dependencies: [
            .feature(target: .LectureListFeature)
        ])
    ]
)
