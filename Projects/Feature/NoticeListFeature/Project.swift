import DependencyPlugin
import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.module(
    name: ModulePaths.Feature.NoticeListFeature.rawValue,
    targets: [
        .interface(module: .feature(.NoticeListFeature), dependencies: [
            .feature(target: .BaseFeature)
        ]),
        .implements(module: .feature(.NoticeListFeature), dependencies: [
            .feature(target: .NoticeListFeature, type: .interface),
            .feature(target: .BaseFeature)
        ]),
        .tests(module: .feature(.NoticeListFeature), dependencies: [
            .feature(target: .NoticeListFeature)
        ])
    ]
)
