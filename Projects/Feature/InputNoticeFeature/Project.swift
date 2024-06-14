import DependencyPlugin
import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.module(
    name: ModulePaths.Feature.InputNoticeFeature.rawValue,
    targets: [
        .interface(module: .feature(.InputNoticeFeature), dependencies: [
            .feature(target: .BaseFeature)
        ]),
        .implements(module: .feature(.InputNoticeFeature), dependencies: [
            .feature(target: .InputNoticeFeature, type: .interface),
            .feature(target: .BaseFeature)
        ]),
        .tests(module: .feature(.InputNoticeFeature), dependencies: [
            .feature(target: .InputNoticeFeature)
        ])
    ]
)
