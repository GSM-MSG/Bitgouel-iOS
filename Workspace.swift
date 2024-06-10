import EnvironmentPlugin
import ProjectDescription

let workspace = Workspace(
    name: env.name,
    projects: [
        "Projects/App"
    ],
    fileHeaderTemplate: nil,
    additionalFiles: []
)
