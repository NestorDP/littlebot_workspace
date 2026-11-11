# Repository manifests

These vcstool manifests describe the repositories needed for a Littlebot development checkout.

## Files

- \`littlebot.repos\`: Littlebot-owned repositories.
- \`third_party.repos\`: external dependencies used by the project.

## Revision policy

- Littlebot repositories are currently pinned to full commit IDs from their verified default \`main\` branches. This gives repeatable checkouts while the repositories do not yet have release tags.
- Third-party dependencies use release tags: cppserial \`v1.0.0\`, Protocol Buffers \`v3.21.12\`, and GoogleTest \`v1.14.0\`.
- Do not replace a pinned revision with \`main\`, \`master\`, or another moving branch for a reproducible workspace snapshot.
- When intentionally updating a dependency, validate the repository URL and revision, test the resulting workspace, and commit the manifest change with a short explanation.

## Import

Run from the parent directory of this repository, where the colcon \`src/\` directory is located:

\`\`\`bash
vcs import src < littlebot_workspace/manifests/littlebot.repos
vcs import src < littlebot_workspace/manifests/third_party.repos
\`\`\`

The workspace repository itself is deliberately not listed in either manifest: clone it beside \`src/\`, not inside \`src/\`.
