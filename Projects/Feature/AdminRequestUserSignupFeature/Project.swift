import DependencyPlugin
import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.module(
    name: ModulePaths.Feature.AdminRequestUserSignupFeature.rawValue,
    targets: [
        .interface(module: .feature(.AdminRequestUserSignupFeature), dependencies: [
            .feature(target: .BaseFeature)
        ]),
        .implements(module: .feature(.AdminRequestUserSignupFeature), dependencies: [
            .feature(target: .AdminRequestUserSignupFeature, type: .interface),
            .feature(target: .AdminUserListFeature, type: .interface),
            .feature(target: .AdminWithdrawUserListFeature, type: .interface),
            .feature(target: .BaseFeature),
            .domain(target: .AdminDomain, type: .interface)
        ]),
        .tests(module: .feature(.AdminRequestUserSignupFeature), dependencies: [
            .feature(target: .AdminRequestUserSignupFeature)
        ])
    ]
)
