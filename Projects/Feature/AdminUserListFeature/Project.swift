import DependencyPlugin
import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.module(
    name: ModulePaths.Feature.AdminUserListFeature.rawValue,
    targets: [
        .interface(module: .feature(.AdminUserListFeature), dependencies: [
            .feature(target: .BaseFeature)
        ]),
        .implements(module: .feature(.AdminUserListFeature), dependencies: [
            .feature(target: .AdminUserListFeature, type: .interface),
            .feature(target: .BaseFeature)
        ]),
        .tests(module: .feature(.AdminUserListFeature), dependencies: [
            .feature(target: .AdminUserListFeature)
        ])
    ]
)
