
# CI GitHub Actions Demo

This repository demonstrates the use of GitHub Actions for Continuous Integration (CI) with basic, test, scheduled, and matrix build workflows.

## Folder Structure

```
CI_GitHub_Actions_Demo/
├── .github/
│   └── workflows/
│       ├── basic-workflow.yml
│       ├── test-workflow.yml
│       ├── scheduled-workflow.yml
│       └── matrix-workflow.yml
├── main.py
└── tests/
    └── test_main.py
```

## Workflows

1. **Basic Workflow**
   - Trigger: On every push to the `main` branch.
   - Action: Prints a message to the logs.

2. **Test Workflow**
   - Trigger: On every push to the `main` branch.
   - Actions:
     - Checks out the code.
     - Sets up Python 3.9.
     - Runs unit tests using `unittest`.

3. **Scheduled Workflow**
   - Trigger: Daily at midnight UTC using cron.
   - Action: Prints a message indicating successful completion.

4. **Matrix Build Workflow**
   - Trigger: On every push to the `main` branch.
   - Action: Runs unit tests across multiple Python versions (3.7, 3.8, 3.9, and 3.10).

## How to Run

1. Clone the repository.
2. Push code to the `main` branch to trigger the workflows.
3. Check the GitHub Actions tab in your repository for workflow runs and results.

## Requirements

- Python 3.7 or higher
- `unittest` framework for running tests

