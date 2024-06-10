import DependencyPlugin
import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.module(
    name: ModulePaths.Feature.OpenedLectureFeature.rawValue,
    targets: [
        .interface(module: .feature(.OpenedLectureFeature), dependencies: [
            .feature(target: .BaseFeature)
        ]),
        .implements(module: .feature(.OpenedLectureFeature), dependencies: [
            .feature(target: .OpenedLectureFeature, type: .interface),
            .feature(target: .BaseFeature)
        ]),
        .tests(module: .feature(.OpenedLectureFeature), dependencies: [
            .feature(target: .OpenedLectureFeature)
        ])
    ]
)
