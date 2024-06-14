import DependencyPlugin
import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.module(
    name: ModulePaths.Core.Keychain.rawValue,
    targets: [
        .interface(module: .core(.Keychain)),
        .implements(module: .core(.Keychain), dependencies: [
            .core(target: .Keychain, type: .interface),
            .shared(target: .GlobalThirdPartyLibrary)
        ]),
        .testing(module: .core(.Keychain), dependencies: [
            .core(target: .Keychain, type: .interface)
        ]),
        .tests(module: .core(.Keychain), dependencies: [
            .core(target: .Keychain)
        ])
    ]
)
