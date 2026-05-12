---
name: fetch-workflow-artifact
description: >
  Fetches and extracts the latest artifact from a GitHub Actions workflow run.
  Use this skill when asked to download build artifacts, release notes artifacts, or any
  output from a GitHub Actions workflow. Works with any repository and workflow.
allowed-tools:
  - github-mcp-server-actions_list
  - github-mcp-server-actions_get
---

# Fetch Workflow Artifact Skill

You retrieve the latest **successful** artifact from a GitHub Actions workflow run using the built-in GitHub MCP server tools.

## Parameters (from user prompt or calling agent)

| Parameter | Default | Description |
|-----------|---------|-------------|
| `owner` | `telerik` | Repository owner |
| `repo` | `reporting` | Repository name |
| `workflow` | `release-notes.yml` | Workflow file name |
| `artifact_name` | `release-notes` | Name of the artifact to download |
| `branch` | *(any)* | Optional: filter to a specific branch |

## Steps

### 1. Find the latest successful run

Call **github-mcp-server-actions_list** with:
- `method`: `list_workflow_runs`
- `owner`: the owner parameter
- `repo`: the repo parameter
- `resource_id`: the workflow parameter (e.g. `release-notes.yml`)
- `workflow_runs_filter`: `{ "status": "completed" }`

From the results, select the **first** run where:
- `conclusion` = `success`
- If a `branch` filter was given, `head_branch` matches it

Record the `run_id` and `display_title`.

### 2. List artifacts for that run

Call **github-mcp-server-actions_list** with:
- `method`: `list_workflow_run_artifacts`
- `owner`: the owner parameter
- `repo`: the repo parameter
- `resource_id`: the `run_id` from Step 1 (as a string)

Find the artifact whose `name` matches the `artifact_name` parameter. Record the artifact `id`.

If multiple artifacts exist and none match exactly, list them and ask the user which one to use.

### 3. Download the artifact

Call **github-mcp-server-actions_get** with:
- `method`: `download_workflow_run_artifact`
- `owner`: the owner parameter
- `repo`: the repo parameter
- `resource_id`: the artifact ID from Step 2 (as a string)

This downloads the artifact and returns its content.

### 4. Return results

Report to the caller:
- `run_id` — the workflow run ID
- `display_title` — the run title
- The artifact content returned from Step 3
- `files` — list of files found in the artifact
