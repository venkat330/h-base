terraform {
  required_providers {
    harness = {
      source = "harness/harness"
      version = "0.35.8"
    }
  }
}

provider "harness" {
  account_id  = "buCifuwpTsScIrrKY-CBHw"
  platform_api_key = "pat.buCifuwpTsScIrrKY-CBHw.67da8a73835a5b1a59a3fd3c.UsoUX7YQgaNAzkELmQDk"
}
resource "harness_platform_triggers" "github_pr_trigger" {
  identifier = "testpr"
  name       = "test-pr"
  org_id     = "default"
  project_id = "default_project"
  target_id  = "repo_pipeline"
  yaml       = <<-EOT
  trigger:
    name: test-pr
    identifier: testpr
    enabled: true
    description: ""
    tags: {}
    projectIdentifier: default_project
    orgIdentifier: default
    pipelineIdentifier: repo_pipeline
    source:
      type: Webhook
      spec:
        type: Github
        spec:
          type: PullRequest
          spec:
            connectorRef: account.git
            autoAbortPreviousExecutions: false
            repoName: h-artefact-clone
            payloadConditions:
              - key: targetBranch
                operator: Equals
                value: main
            headerConditions: []
            actions:
              - Open
              - Synchronize
    inputYaml: |
      pipeline: {}
  EOT
}

# resource "harness_platform_triggers" "github_push_trigger" {
#   identifier = "testoush"
#   name       = "test-push"
#   org_id     = "default"
#   project_id = "default_project"
#   target_id  = "repo_pipeline"
#   yaml       = <<-EOT
#   trigger:
#     name: test-push
#     identifier: testoush
#     enabled: true
#     description: ""
#     tags: {}
#     projectIdentifier: default_project
#     orgIdentifier: default
#     pipelineIdentifier: repo_pipeline
#     source:
#       type: Webhook
#       spec:
#         type: Github
#         spec:
#           type: Push
#           spec:
#             connectorRef: account.git
#             autoAbortPreviousExecutions: false
#             payloadConditions:
#               - key: targetBranch
#                 operator: Equals
#                 value: main
#             headerConditions: []
#             actions: []
#     inputYaml: |
#       pipeline: {}
#   EOT
# }

# resource "harness_platform_triggers" "github_release_trigger" {
#   identifier = "testrel"
#   name       = "test-rel"
#   org_id     = "default"
#   project_id = "default_project"
#   target_id  = "repo_pipeline"
#   yaml       = <<-EOT
#    :
#     name: test-rel
#     identifier: testrel
#     enabled: true
#     description: ""
#     tags: {}
#     projectIdentifier: default_project
#     orgIdentifier: default
#     pipelineIdentifier: repo_pipeline
#     source:
#       type: Webhook
#       spec:
#         type: Github
#         spec:
#           type: Release
#           spec:
#             connectorRef: account.git
#             autoAbortPreviousExecutions: false
#             payloadConditions: []
#             headerConditions: []
#             actions:
#               - Publish
#               - Release
#     inputYaml: |
#       pipeline: {}
#   EOT
# }
