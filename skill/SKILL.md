---
name: skeleton-skill
description: This skill helps developers quickly create professional-grade project structures by pulling pre-built templates from a remote repository. Use this skill when users request to create project scaffolding, initialize projects, or generate project skeletons. Instead of generating files token-by-token, it executes a script to fetch complete templates instantly.
---

# Skeleton Skill

A token-efficient agent skill for generating professional project structures.

## Highlights

- **Zero Token Generation**: Fetches complete project templates from remote repository instead of generating files line-by-line
- **Instant Setup**: One script execution creates the entire project structure in seconds
- **Always Up-to-Date**: Templates maintained in a separate GitHub repository, always reflecting latest best practices
- **Consistent Quality**: Pre-tested, production-ready templates ensure professional results every time

## When to Use

This skill should be used when users request:
- Creating new project structures
- Generating project scaffolding
- Initializing project directories
- Setting up project frameworks
- Keywords: project structure, scaffold, skeleton, init project, boilerplate, 创建项目, 项目结构, 脚手架

## Available Templates

| Template ID | Description |
|-------------|-------------|
| `ts-cli` | TypeScript CLI tool |
| `ts-lib` | TypeScript npm library |
| `react-app` | React + TypeScript + Vite |
| `nextjs-app` | Next.js full-stack app |
| `py-cli` | Python CLI tool |
| `py-fastapi` | Python FastAPI service |
| `py-lib` | Python library |
| `go-cli` | Go CLI tool |
| `go-service` | Go microservice |
| `rust-cli` | Rust CLI tool |
| `rust-lib` | Rust library |

## Workflow

### Step 1: Identify Requirements

Confirm with user:
1. **Project name**: What to name the project directory
2. **Template**: Which template to use (show available templates table)
3. **Target path**: Where to create the project (default: current directory)

### Step 2: Execute Script

Run the scaffold script to fetch and setup the project:

```bash
scripts/scaffold.sh <template-id> <project-name> [target-path]
```

Example:
```bash
scripts/scaffold.sh ts-cli my-awesome-cli ./projects
```

### Step 3: Report Results

Inform user of:
- Created directory structure
- Next steps to get started (install dependencies, run dev server, etc.)

## Bundled Resources

### Scripts

- `scripts/scaffold.sh` - Main script to fetch templates from remote repository

### References

- `references/templates.md` - Detailed template specifications (load only if user needs customization guidance)

## Notes

- Templates are fetched from: `https://github.com/{owner}/project-templates`
- If network unavailable, provide fallback instructions
- For custom modifications, consult `references/templates.md` after scaffold completes
