Project Workflow
================

Purpose
-------

This document defines a lightweight workflow for planning, executing, and reviewing work in the Littlebot engineering project.

The workflow is intended for a long-lived individual engineering project maintained across multiple repositories. It should provide enough structure to preserve project continuity, make progress visible, and keep technical decisions traceable without introducing unnecessary administrative overhead.

GitHub Issues are the units of work. The permanent GitHub Project, **Littlebot — Engineering Project**, is the central planning and tracking interface across repositories.

1. Project management principles
--------------------------------

The workflow follows these principles:

* **One central project:** use the permanent GitHub Project to track work across all Littlebot repositories.
* **Repository ownership:** create each issue in the repository responsible for the affected subsystem or deliverable.
* **Small, verifiable tasks:** prefer issues that can be completed and evaluated independently.
* **Explicit completion criteria:** every actionable issue must have acceptance criteria or a clearly defined research outcome.
* **Lightweight planning:** plan work according to available weekly capacity rather than maintaining an overly detailed long-term schedule.
* **Traceability:** document important implementation decisions, research findings, and changes to system architecture.
* **Continuous review:** review priorities and progress weekly.

2. Issue lifecycle
------------------

Every issue follows the lifecycle below.

.. code-block:: text

   Backlog
      |
      v
    Ready
      |
      v
   In Progress
      |
      v
   Testing / Review
      |
      v
     Done

2.1 Status definitions
~~~~~~~~~~~~~~~~~~~~~~

**Backlog**

The issue has been recorded but is not yet sufficiently specified or prioritized for execution.

Typical reasons for remaining in Backlog:

* The problem or objective needs clarification.
* Acceptance criteria have not been defined.
* Dependencies have not been investigated.
* The work is not currently a priority.

**Ready**

The issue is sufficiently defined and can be started without additional planning.

Before moving an issue to Ready, ensure that it has:

* A clear objective or problem statement.
* Appropriate acceptance criteria or expected research outcomes.
* An owning repository.
* A priority.
* An effort estimate.
* Identified dependencies, if applicable.

**In Progress**

Work has started. The issue should represent work that is actively being executed.

Keep the issue updated when its scope changes, a significant decision is made, or an unexpected dependency is discovered.

**Testing / Review**

The implementation or investigation is complete, but the result still needs validation.

Examples include:

* Running unit, integration, or system tests.
* Validating firmware or hardware behavior.
* Reviewing experimental results.
* Checking documentation against the implementation.
* Verifying that acceptance criteria have been satisfied.

If validation identifies a problem, return the issue to In Progress.

**Done**

The issue has satisfied its acceptance criteria and its result has been integrated into the appropriate repository or project documentation.

For research issues, Done means that the investigation has produced a documented result, even when the result is negative or does not support the original hypothesis.

Close the GitHub issue when it reaches Done.

2.2 Transition rules
~~~~~~~~~~~~~~~~~~~~

The following transitions are allowed:

+-------------------+-------------------+----------------------------------------------+
| Current status    | Next status       | Condition                                    |
+===================+===================+==============================================+
| Backlog           | Ready             | Issue is sufficiently specified.            |
+-------------------+-------------------+----------------------------------------------+
| Ready             | Backlog           | More information or planning is required.   |
+-------------------+-------------------+----------------------------------------------+
| Ready             | In Progress       | Work starts.                                 |
+-------------------+-------------------+----------------------------------------------+
| In Progress       | Ready             | Work is paused and remains actionable.      |
+-------------------+-------------------+----------------------------------------------+
| In Progress       | Testing / Review  | Work is complete and ready for validation.  |
+-------------------+-------------------+----------------------------------------------+
| Testing / Review  | In Progress       | Validation identifies outstanding work.     |
+-------------------+-------------------+----------------------------------------------+
| Testing / Review  | Done              | Acceptance criteria are satisfied.         |
+-------------------+-------------------+----------------------------------------------+
| Done              | In Progress       | The issue is reopened for additional work.  |
+-------------------+-------------------+----------------------------------------------+

Do not move an issue directly from Backlog to In Progress. First ensure that it is Ready.

If an issue becomes blocked by an external dependency, add the ``blocked`` label and a comment explaining:

* What is blocking the work.
* What is needed to unblock it.
* Whether any follow-up action is possible.

Keep its current status until the next planning review. A blocked issue should not be treated as active work when calculating the current work-in-progress limit.

If an issue is no longer relevant, close it as not planned and explain the reason. Do not mark unfinished work as Done.

2.3 Work-in-progress limit
~~~~~~~~~~~~~~~~~~~~~~~~~~

To avoid fragmenting the available development time:

* Maintain at most one actively executed issue in In Progress.
* Additional work should normally remain in Ready or Backlog.
* A task awaiting external feedback or validation may remain in Testing / Review while another task is started, provided it does not require active work.
* Avoid starting a new issue merely because the current task is difficult or temporarily inconvenient.

3. Issue categories and templates
---------------------------------

Use the following issue categories:

* **Feature:** implementation of a new capability or modification of existing functionality.
* **Bug:** correction of behavior that does not meet an existing requirement or expected behavior.
* **Research:** investigation, experimentation, feasibility analysis, or evaluation of technical alternatives.
* **Documentation:** creation, correction, or improvement of project documentation.

The corresponding GitHub Issue Forms are maintained in ``.github/ISSUE_TEMPLATE/``:

* ``feature.yml``
* ``bug.yml``
* ``research.yml``
* ``documentation.yml``

Install the same templates in each repository that accepts issues. Keep the versions in ``littlebot_workspace`` as the canonical reference.

Issues should be created in the repository that owns the affected implementation or documentation. Add each issue to the central GitHub Project.

Use additional issue categories such as Refactoring and Testing through the existing project Type field when appropriate. They do not require separate templates initially.

4. Priority convention
----------------------

Priority represents the importance and urgency of completing an issue relative to other project work.

Use the following values in the GitHub Project Priority field:

+----------+--------------------------------------------------------------+
| Priority | Definition                                                   |
+==========+==============================================================+
| Critical | Blocks essential project functionality or threatens a       |
|          | major project objective. Requires immediate attention.      |
+----------+--------------------------------------------------------------+
| High     | Important for the current development phase or a major      |
|          | milestone. Should be addressed soon.                        |
+----------+--------------------------------------------------------------+
| Medium   | Valuable work that contributes to project progress but      |
|          | does not currently block other objectives.                  |
+----------+--------------------------------------------------------------+
| Low      | Improvement, optional enhancement, or long-term idea that   |
|          | can remain in Backlog without affecting current objectives. |
+----------+--------------------------------------------------------------+

Priority guidelines:

* Assign priority according to project impact, not personal interest or implementation difficulty.
* Critical should be uncommon.
* Reassess priority during weekly planning when dependencies, project objectives, or available capacity change.
* Priority does not determine the order of execution automatically; dependencies and milestone relevance must also be considered.

5. Effort estimation convention
-------------------------------

Effort represents the estimated active working time required to complete an issue. It does not represent elapsed calendar time.

Use the existing GitHub Project Effort values:

+--------+------------------------------------------+
| Effort | Interpretation                           |
+========+==========================================+
| 1h     | Very small task or isolated correction.  |
+--------+------------------------------------------+
| 2h     | Small task that fits one work session.   |
+--------+------------------------------------------+
| 4h     | Moderate task requiring multiple steps.  |
+--------+------------------------------------------+
| 6h     | Substantial task with several activities.|
+--------+------------------------------------------+
| 8h     | Large task that may span several sessions.|
+--------+------------------------------------------+
| Other  | Estimate is not yet meaningful or the    |
|        | task needs decomposition.                |
+--------+------------------------------------------+

Estimation rules:

* Estimate the work needed to satisfy the issue's acceptance criteria.
* Include implementation, necessary testing, and directly related documentation.
* Do not include unrelated maintenance or future improvements.
* Prefer splitting tasks estimated above 8 hours into smaller issues with independent outcomes.
* Use Other temporarily when uncertainty prevents a meaningful estimate. Create a research or investigation task if necessary, then update the estimate.
* Estimates are planning aids, not deadlines or performance measurements.

6. Weekly planning and review
-----------------------------

The project is developed alongside other professional and research activities. Planning should therefore be based on realistic available time.

The default working allocation is approximately two hours per day. Assuming five available days, this corresponds to a nominal capacity of ten hours per week.

Plan approximately eight hours of committed work and reserve the remaining capacity for unexpected problems, debugging, maintenance, or tasks that take longer than expected.

6.1 Weekly planning
~~~~~~~~~~~~~~~~~~~

At the beginning of each week, reserve approximately 30 minutes for planning.

Activities:

1. Review the GitHub Project Board.
2. Review issues in Backlog and Ready.
3. Reassess priorities and dependencies.
4. Select the issues to be addressed during the week.
5. Confirm that selected issues have clear acceptance criteria and effort estimates.
6. Check that the planned effort does not exceed the available capacity.
7. Update the Roadmap or target dates when necessary.

The weekly plan should identify:

* The main objective for the week.
* The issues selected for execution.
* The expected deliverables.
* Any known risks or dependencies.

Avoid planning every available hour. The purpose is to establish a realistic direction, not to create a rigid daily schedule.

6.2 Execution during the week
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

During each development session:

1. Select the current Ready issue.
2. Move it to In Progress.
3. Work toward its acceptance criteria.
4. Record relevant technical decisions and discoveries.
5. Update the issue when its scope, estimate, or dependencies change.
6. Move it to Testing / Review when implementation or investigation is complete.

If the task becomes larger than expected, reassess its scope and effort. Split the issue when the original objective can be divided into independently verifiable outcomes.

6.3 Weekly review
~~~~~~~~~~~~~~~~~

At the end of the week, reserve approximately 15–30 minutes for review.

Activities:

1. Review completed issues and close those that satisfy their acceptance criteria.
2. Review unfinished work and update its status.
3. Record relevant technical findings and decisions.
4. Identify blockers and unresolved dependencies.
5. Compare planned work with actual progress.
6. Reassess priorities for the next week.

The review should answer:

* What was completed?
* What remains unfinished?
* What prevented planned work from being completed?
* Did any new technical requirement or dependency emerge?
* What should be prioritized next week?

Use the answers to improve future planning. Do not treat deviations from the plan as failures; use them to improve effort estimates and identify hidden project risks.

7. GitHub Project conventions
-----------------------------

The permanent project **Littlebot — Engineering Project** is the central tracking interface.

Maintain the following fields:

+---------------+-------------------------------------------------------------+
| Field         | Convention                                                  |
+===============+=============================================================+
| Status        | Backlog, Ready, In Progress, Testing / Review, Done.       |
+---------------+-------------------------------------------------------------+
| Phase         | Current project phase associated with the work.             |
+---------------+-------------------------------------------------------------+
| Repository    | Repository responsible for the issue.                       |
+---------------+-------------------------------------------------------------+
| Priority      | Critical, High, Medium, Low.                                 |
+---------------+-------------------------------------------------------------+
| Effort        | 1h, 2h, 4h, 6h, 8h, Other.                                  |
+---------------+-------------------------------------------------------------+
| Type          | Feature, Bug, Research, Documentation, Refactoring, Testing.|
+---------------+-------------------------------------------------------------+
| Target release| Release or milestone the issue contributes to, if any.     |
+---------------+-------------------------------------------------------------+

Use the existing project views:

* **Board:** daily execution and status tracking.
* **Roadmap:** longer-term planning and target dates.
* **Repositories:** distribution of work across repositories.
* **Bugs:** bug tracking and resolution.
* **Research:** technical investigations and experimental work.

Milestones should represent meaningful repository-specific objectives or releases. Use Target release for cross-repository planning.

8. Definition of Done
---------------------

An issue can be considered Done when all applicable conditions are satisfied:

* The issue's acceptance criteria or research outcomes have been met.
* The implementation, experiment, or documentation has been validated.
* Relevant tests have been executed and their results recorded.
* Necessary documentation has been updated.
* Important technical decisions have been recorded in an appropriate ADR or engineering document.
* The result has been integrated into the appropriate repository.
* The issue has been closed and its GitHub Project status is Done.

Not every issue requires an ADR or a new test. Apply these conditions according to the nature of the work.

9. Workflow maintenance
-----------------------

Review this workflow when the project organization changes significantly or when the current process repeatedly creates unnecessary overhead.

Prefer adjusting the existing conventions over adding new fields, statuses, templates, or procedures without a clear need.

The objective is to maintain a consistent and sustainable engineering process while keeping the administrative effort small relative to actual development work.