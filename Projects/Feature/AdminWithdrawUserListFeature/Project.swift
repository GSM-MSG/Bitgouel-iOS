import DependencyPlugin
import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.module(
    name: ModulePaths.Feature.AdminWithdrawUserListFeature.rawValue,
    targets: [
        .interface(module: .feature(.AdminWithdrawUserListFeature), dependencies: [
            .feature(target: .BaseFeature)
        ]),
        .implements(module: .feature(.AdminWithdrawUserListFeature), dependencies: [
            .feature(target: .AdminWithdrawUserListFeature, type: .interface),
            .feature(target: .BaseFeature)
        ]),
        .tests(module: .feature(.AdminWithdrawUserListFeature), dependencies: [
            .feature(target: .AdminWithdrawUserListFeature)
        ])
    ]
)
