import DependencyPlugin
import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.module(
    name: ModulePaths.Feature.NoticeDetailFeature.rawValue,
    targets: [
        .interface(module: .feature(.NoticeDetailFeature), dependencies: [
            .feature(target: .BaseFeature)
        ]),
        .implements(module: .feature(.NoticeDetailFeature), dependencies: [
            .feature(target: .NoticeDetailFeature, type: .interface),
            .feature(target: .BaseFeature)
        ]),
        .tests(module: .feature(.NoticeDetailFeature), dependencies: [
            .feature(target: .NoticeDetailFeature)
        ])
    ]
)
