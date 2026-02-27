# 项目结构参考模板

## TypeScript/JavaScript 项目

### Node.js CLI 工具
```
project-name/
├── src/
│   ├── index.ts          # 入口文件
│   ├── cli.ts            # CLI 命令定义
│   ├── commands/         # 命令实现
│   └── utils/            # 工具函数
├── tests/
│   └── *.test.ts
├── package.json
├── tsconfig.json
├── .gitignore
├── README.md
└── LICENSE
```

### React/Next.js Web 应用
```
project-name/
├── src/
│   ├── app/              # Next.js App Router
│   ├── components/       # React 组件
│   │   ├── ui/           # 基础 UI 组件
│   │   └── features/     # 功能组件
│   ├── hooks/            # 自定义 Hooks
│   ├── lib/              # 工具库
│   ├── styles/           # 样式文件
│   └── types/            # TypeScript 类型
├── public/               # 静态资源
├── tests/
├── package.json
├── tsconfig.json
├── next.config.js
├── tailwind.config.js
├── .gitignore
└── README.md
```

### npm 库/SDK
```
project-name/
├── src/
│   ├── index.ts          # 导出入口
│   ├── core/             # 核心功能
│   └── types/            # 类型定义
├── tests/
├── examples/             # 使用示例
├── docs/                 # 文档
├── package.json
├── tsconfig.json
├── tsup.config.ts        # 打包配置
├── .gitignore
└── README.md
```

---

## Python 项目

### Python CLI 工具
```
project-name/
├── src/
│   └── project_name/
│       ├── __init__.py
│       ├── __main__.py   # CLI 入口
│       ├── cli.py        # 命令定义
│       └── core/         # 核心逻辑
├── tests/
│   └── test_*.py
├── pyproject.toml
├── .gitignore
├── README.md
└── LICENSE
```

### Python Web 应用 (FastAPI)
```
project-name/
├── src/
│   └── app/
│       ├── __init__.py
│       ├── main.py       # FastAPI 入口
│       ├── api/          # API 路由
│       │   └── v1/
│       ├── core/         # 配置、安全等
│       ├── models/       # 数据模型
│       ├── schemas/      # Pydantic schemas
│       └── services/     # 业务逻辑
├── tests/
├── pyproject.toml
├── Dockerfile
├── docker-compose.yml
├── .gitignore
└── README.md
```

### Python 库
```
project-name/
├── src/
│   └── project_name/
│       ├── __init__.py
│       ├── core.py
│       └── utils.py
├── tests/
├── docs/
├── examples/
├── pyproject.toml
├── .gitignore
└── README.md
```

---

## Go 项目

### Go CLI 工具
```
project-name/
├── cmd/
│   └── project-name/
│       └── main.go       # 入口
├── internal/             # 私有包
│   ├── cli/
│   └── core/
├── pkg/                  # 公共包
├── go.mod
├── go.sum
├── Makefile
├── .gitignore
└── README.md
```

### Go Web 服务
```
project-name/
├── cmd/
│   └── server/
│       └── main.go
├── internal/
│   ├── api/              # HTTP handlers
│   ├── service/          # 业务逻辑
│   ├── repository/       # 数据访问
│   └── model/            # 数据模型
├── pkg/
├── configs/
├── go.mod
├── go.sum
├── Dockerfile
├── Makefile
├── .gitignore
└── README.md
```

---

## Rust 项目

### Rust CLI 工具
```
project-name/
├── src/
│   ├── main.rs           # 入口
│   ├── cli.rs            # 命令定义
│   ├── commands/         # 命令实现
│   └── lib.rs            # 库代码
├── tests/
├── Cargo.toml
├── .gitignore
└── README.md
```

### Rust 库
```
project-name/
├── src/
│   ├── lib.rs            # 库入口
│   └── *.rs              # 模块
├── examples/
├── tests/
├── benches/              # 基准测试
├── Cargo.toml
├── .gitignore
└── README.md
```

---

## 通用配置文件模板

### .gitignore (通用)
```
# Dependencies
node_modules/
venv/
.venv/
target/

# Build
dist/
build/
*.egg-info/

# IDE
.idea/
.vscode/
*.swp

# OS
.DS_Store
Thumbs.db

# Environment
.env
.env.local

# Logs
*.log
logs/

# Test
coverage/
.pytest_cache/
```

### CI/CD (GitHub Actions)
```yaml
# .github/workflows/ci.yml
name: CI

on:
  push:
    branches: [main]
  pull_request:
    branches: [main]

jobs:
  test:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4
      - name: Setup
        # 根据语言配置
      - name: Install dependencies
        # 安装依赖
      - name: Test
        # 运行测试
```

### Docker (多阶段构建)
```dockerfile
# Build stage
FROM node:20-alpine AS builder
WORKDIR /app
COPY package*.json ./
RUN npm ci
COPY . .
RUN npm run build

# Production stage
FROM node:20-alpine
WORKDIR /app
COPY --from=builder /app/dist ./dist
COPY package*.json ./
RUN npm ci --production
CMD ["node", "dist/index.js"]
```
