local orgs = import 'vendor/otterdog-defaults/otterdog-defaults.libsonnet';

orgs.newOrg('eclipse-sumo') {
  settings+: {
    blog: "https://eclipse.dev/sumo",
    description: "Eclipse SUMO (Simulation of Urban Mobility) is a free and open traffic simulation toolsuite",
    name: "Eclipse SUMO",
    packages_containers_internal: false,
    twitter_username: "EclipseSUMO",
    web_commit_signoff_required: false,
    workflows+: {
      actions_can_approve_pull_request_reviews: false,
    },
  },
  _repositories+:: [
    orgs.newRepo('sumo') {
      allow_merge_commit: true,
      allow_update_branch: false,
      delete_branch_on_merge: false,
      dependabot_security_updates_enabled: true,
      description: "Eclipse SUMO is an open source, highly portable, microscopic and continuous traffic simulation package designed to handle large networks. It allows for intermodal simulation including pedestrians and comes with a large set of tools for scenario creation.",
      has_projects: false,
      has_wiki: false,
      homepage: "https://eclipse.dev/sumo",
      topics+: [
        "simulation",
        "traffic",
        "transport"
      ],
      web_commit_signoff_required: false,
      webhooks: [
        orgs.newRepoWebhook('https://codeclimate.com/webhooks') {
          events+: [
            "pull_request",
            "push"
          ],
        },
        orgs.newRepoWebhook('https://ci.appveyor.com/api/github/webhook?id=yapwb9eom0fewyfw') {
          events+: [
            "pull_request",
            "push"
          ],
        },
        orgs.newRepoWebhook('https://notify.travis-ci.org') {
          events+: [
            "create",
            "delete",
            "issue_comment",
            "member",
            "public",
            "pull_request",
            "push",
            "repository"
          ],
        },
        orgs.newRepoWebhook('https://ci.eclipse.org/sumo/github-webhook/') {
          events+: [
            "create"
          ],
        },
        orgs.newRepoWebhook('https://hosted.weblate.org/hooks/github/') {
          events+: [
            "push"
          ],
        },
        orgs.newRepoWebhook('https://zenodo.org/api/hooks/receivers/github/events/?access_token=PAfXc7fTEDVgFwnZiBvqmNrQ4gmv7fVqPAM6VqSVDtwLTjHfEgMClW2Zmzdi') {
          content_type: "json",
          events+: [
            "release"
          ],
          secret: "********",
        },
      ],
      secrets: [
        orgs.newRepoSecret('PYPI_TOKEN') {
          value: "********",
        },
        orgs.newRepoSecret('SONAR_TOKEN') {
          value: "********",
        },
        orgs.newRepoSecret('TEST_PYPI_TOKEN') {
          value: "********",
        },
      ],
      branch_protection_rules: [
        orgs.newBranchProtectionRule('main') {
          required_approving_review_count: null,
          requires_pull_request: false,
          requires_status_checks: false,
          requires_strict_status_checks: true,
        },
      ],
    },
    orgs.newRepo('sumo.website') {
      allow_merge_commit: true,
      allow_update_branch: false,
      delete_branch_on_merge: false,
      web_commit_signoff_required: false,
    },
  ],
}
