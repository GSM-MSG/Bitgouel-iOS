import DependencyPlugin
import EnvironmentPlugin
import ProjectDescription
import ProjectDescriptionHelpers

let name = ModulePaths.Domain.BaseDomain.rawValue

let configurations: [Configuration] = generateEnvironment == .ci ?
    .default :
    [
        .debug(name: .dev, xcconfig: .relativeToXCConfig(type: .dev, name: name)),
        .debug(name: .stage, xcconfig: .relativeToXCConfig(type: .stage, name: name)),
        .release(name: .prod, xcconfig: .relativeToXCConfig(type: .prod, name: name))
    ]

let project = Project.module(
    name: name,
    targets: [
        .interface(
            module: .domain(.BaseDomain),
            spec: .init(
                infoPlist: .extendingDefault(
                    with: [
                        "BASE_URL": .string("$(BASE_URL)")
                    ]
                ),
                dependencies: [
                    .SPM.Moya
                ],
                settings: .settings(
                    base: env.baseSetting
                        .merging(.allLoadLDFlages),
                    configurations: configurations,
                    defaultSettings: .recommended
                )
            )
        ),
        .implements(
            module: .domain(.BaseDomain),
            dependencies: [
                .core(target: .Keychain, type: .interface),
                .domain(target: .BaseDomain, type: .interface),
                .shared(target: .GlobalThirdPartyLibrary)
            ]
        ),
        .testing(module: .domain(.BaseDomain), dependencies: [
            .domain(target: .BaseDomain, type: .interface)
        ]),
        .tests(module: .domain(.BaseDomain), dependencies: [
            .domain(target: .BaseDomain)
        ])
    ]
)
