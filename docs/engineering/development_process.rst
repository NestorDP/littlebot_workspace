Development Process
===================

Littlebot development follows an incremental process focused on small,
reviewable changes and reproducible builds.

Work should be organized around a clearly defined objective. Before
implementation, identify the affected subsystem, relevant interfaces, and
validation steps. Changes should be reviewed before they are integrated.

Typical workflow
----------------

1. Define the requirement or issue.
2. Inspect the existing implementation and documentation.
3. Implement the smallest change that satisfies the requirement.
4. Build and test the affected packages.
5. Review the change and update related documentation.
6. Integrate the change after validation.

Every change should preserve existing behavior unless a behavioral change is
explicitly required.