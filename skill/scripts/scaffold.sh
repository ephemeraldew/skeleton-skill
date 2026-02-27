#!/bin/bash
#
# scaffold.sh - Fetch project template from remote repository
#
# Usage: scaffold.sh <template-id> <project-name> [target-path]
#
# Example:
#   scaffold.sh ts-cli my-awesome-cli
#   scaffold.sh py-fastapi my-api ./projects

set -e

# Configuration - Update these values
REPO_OWNER="your-username"
REPO_NAME="project-templates"
BRANCH="main"

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Arguments
TEMPLATE_ID="${1:-}"
PROJECT_NAME="${2:-}"
TARGET_PATH="${3:-.}"

# Validate arguments
if [[ -z "$TEMPLATE_ID" || -z "$PROJECT_NAME" ]]; then
    echo -e "${RED}Error: Missing required arguments${NC}"
    echo ""
    echo "Usage: scaffold.sh <template-id> <project-name> [target-path]"
    echo ""
    echo "Available templates:"
    echo "  ts-cli      - TypeScript CLI tool"
    echo "  ts-lib      - TypeScript npm library"
    echo "  react-app   - React + TypeScript + Vite"
    echo "  nextjs-app  - Next.js full-stack app"
    echo "  py-cli      - Python CLI tool"
    echo "  py-fastapi  - Python FastAPI service"
    echo "  py-lib      - Python library"
    echo "  go-cli      - Go CLI tool"
    echo "  go-service  - Go microservice"
    echo "  rust-cli    - Rust CLI tool"
    echo "  rust-lib    - Rust library"
    exit 1
fi

# Construct paths
DEST_DIR="${TARGET_PATH}/${PROJECT_NAME}"
TEMPLATE_URL="https://github.com/${REPO_OWNER}/${REPO_NAME}/archive/refs/heads/${BRANCH}.zip"
TEMP_DIR=$(mktemp -d)

echo -e "${GREEN}🚀 Creating project: ${PROJECT_NAME}${NC}"
echo -e "   Template: ${TEMPLATE_ID}"
echo -e "   Location: ${DEST_DIR}"
echo ""

# Check if destination already exists
if [[ -d "$DEST_DIR" ]]; then
    echo -e "${RED}Error: Directory already exists: ${DEST_DIR}${NC}"
    exit 1
fi

# Download and extract
echo -e "${YELLOW}📦 Fetching template...${NC}"

cd "$TEMP_DIR"

# Try to download the template
if command -v curl &> /dev/null; then
    curl -sL "$TEMPLATE_URL" -o template.zip
elif command -v wget &> /dev/null; then
    wget -q "$TEMPLATE_URL" -O template.zip
else
    echo -e "${RED}Error: Neither curl nor wget is available${NC}"
    exit 1
fi

# Extract
unzip -q template.zip

# Find and copy template
EXTRACTED_DIR="${REPO_NAME}-${BRANCH}"
TEMPLATE_DIR="${EXTRACTED_DIR}/templates/${TEMPLATE_ID}"

if [[ ! -d "$TEMPLATE_DIR" ]]; then
    echo -e "${RED}Error: Template '${TEMPLATE_ID}' not found${NC}"
    rm -rf "$TEMP_DIR"
    exit 1
fi

# Create destination and copy files
mkdir -p "$(dirname "$DEST_DIR")"
cp -r "$TEMPLATE_DIR" "$DEST_DIR"

# Replace placeholders in files
echo -e "${YELLOW}⚙️  Configuring project...${NC}"

# Common placeholder replacements
find "$DEST_DIR" -type f \( -name "*.json" -o -name "*.toml" -o -name "*.md" -o -name "*.yaml" -o -name "*.yml" -o -name "go.mod" -o -name "Cargo.toml" \) -exec sed -i.bak "s/{{PROJECT_NAME}}/${PROJECT_NAME}/g" {} \;
find "$DEST_DIR" -type f -name "*.bak" -delete

# Cleanup
rm -rf "$TEMP_DIR"

echo ""
echo -e "${GREEN}✅ Project created successfully!${NC}"
echo ""
echo "Next steps:"
echo "  cd ${DEST_DIR}"

# Print language-specific instructions
case "$TEMPLATE_ID" in
    ts-*|react-*|nextjs-*)
        echo "  npm install"
        echo "  npm run dev"
        ;;
    py-*)
        echo "  python -m venv .venv"
        echo "  source .venv/bin/activate"
        echo "  pip install -e ."
        ;;
    go-*)
        echo "  go mod tidy"
        echo "  go run ./cmd/..."
        ;;
    rust-*)
        echo "  cargo build"
        echo "  cargo run"
        ;;
esac
