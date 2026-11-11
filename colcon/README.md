# Colcon configuration

This directory stores the version-controlled colcon configuration templates
for the Littlebot development workspace.

- `colcon_defaults.yaml`: workspace-wide default build arguments.
- `colcon.meta`: package-specific build metadata.

These templates are kept in `littlebot_workspace`, which is separate from the
colcon build workspace. Colcon automatically discovers
`colcon_defaults.yaml` and `colcon.meta` when they are placed at the root
of the build workspace, so run:

```bash
./littlebot_workspace/tools/configure_colcon_workspace.sh
```

By default, the script assumes this layout:

```text
littlebot-dev/
├── littlebot_workspace/
└── src/
```

You can pass another build workspace root as the first argument:

```bash
./littlebot_workspace/tools/configure_colcon_workspace.sh /path/to/littlebot-dev
```

## Excluding third-party repositories

Colcon does not use `colcon_defaults.yaml` or `colcon.meta` to exclude
source directories. The setup script creates a `COLCON_IGNORE` marker in
the roots of the imported third-party repositories:

- `src/cppserial`
- `src/protobuf`
- `src/googletest`

The markers are local files in the imported repositories' working trees;
they are not committed to those upstream repositories. Run the setup script
again after re-importing or replacing those repositories.

Verify discovery with:

```bash
colcon list
```

The three third-party repositories should not appear in the output.
