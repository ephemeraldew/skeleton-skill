# 项目脚手架示例

## 示例 1：TypeScript CLI 工具

用户请求：
> 帮我创建一个 TypeScript 写的命令行工具，用来管理 TODO 列表

生成结构：
```
todo-cli/
├── src/
│   ├── index.ts
│   ├── cli.ts
│   ├── commands/
│   │   ├── add.ts
│   │   ├── list.ts
│   │   ├── done.ts
│   │   └── remove.ts
│   ├── store/
│   │   └── todo-store.ts
│   └── types/
│       └── index.ts
├── tests/
│   └── commands.test.ts
├── package.json
├── tsconfig.json
├── .gitignore
└── README.md
```

关键配置文件：

**package.json**
```json
{
  "name": "todo-cli",
  "version": "1.0.0",
  "description": "A CLI tool for managing TODO lists",
  "type": "module",
  "bin": {
    "todo": "./dist/index.js"
  },
  "scripts": {
    "build": "tsup src/index.ts --format esm",
    "dev": "tsx src/index.ts",
    "test": "vitest"
  },
  "devDependencies": {
    "tsup": "^8.0.0",
    "tsx": "^4.0.0",
    "typescript": "^5.0.0",
    "vitest": "^1.0.0"
  },
  "dependencies": {
    "commander": "^12.0.0"
  }
}
```

---

## 示例 2：Python FastAPI 服务

用户请求：
> 创建一个 Python FastAPI 项目，做用户管理的 REST API

生成结构：
```
user-api/
├── src/
│   └── app/
│       ├── __init__.py
│       ├── main.py
│       ├── api/
│       │   ├── __init__.py
│       │   └── v1/
│       │       ├── __init__.py
│       │       ├── router.py
│       │       └── endpoints/
│       │           ├── __init__.py
│       │           └── users.py
│       ├── core/
│       │   ├── __init__.py
│       │   ├── config.py
│       │   └── security.py
│       ├── models/
│       │   ├── __init__.py
│       │   └── user.py
│       ├── schemas/
│       │   ├── __init__.py
│       │   └── user.py
│       └── services/
│           ├── __init__.py
│           └── user_service.py
├── tests/
│   ├── __init__.py
│   └── test_users.py
├── pyproject.toml
├── Dockerfile
├── docker-compose.yml
├── .gitignore
└── README.md
```

关键配置文件：

**pyproject.toml**
```toml
[project]
name = "user-api"
version = "0.1.0"
description = "User management REST API"
requires-python = ">=3.11"
dependencies = [
    "fastapi>=0.109.0",
    "uvicorn[standard]>=0.27.0",
    "pydantic>=2.0.0",
    "sqlalchemy>=2.0.0",
]

[project.optional-dependencies]
dev = [
    "pytest>=8.0.0",
    "pytest-asyncio>=0.23.0",
    "httpx>=0.26.0",
]

[build-system]
requires = ["hatchling"]
build-backend = "hatchling.build"
```

---

## 示例 3：Go 微服务

用户请求：
> 用 Go 创建一个订单服务的微服务项目

生成结构：
```
order-service/
├── cmd/
│   └── server/
│       └── main.go
├── internal/
│   ├── api/
│   │   ├── handler.go
│   │   └── router.go
│   ├── service/
│   │   └── order_service.go
│   ├── repository/
│   │   └── order_repo.go
│   ├── model/
│   │   └── order.go
│   └── config/
│       └── config.go
├── pkg/
│   └── logger/
│       └── logger.go
├── configs/
│   └── config.yaml
├── go.mod
├── go.sum
├── Dockerfile
├── Makefile
├── .gitignore
└── README.md
```

关键配置文件：

**go.mod**
```go
module github.com/username/order-service

go 1.22

require (
    github.com/gin-gonic/gin v1.9.1
    github.com/spf13/viper v1.18.0
    go.uber.org/zap v1.26.0
)
```

**Makefile**
```makefile
.PHONY: build run test clean

build:
	go build -o bin/server cmd/server/main.go

run:
	go run cmd/server/main.go

test:
	go test ./...

clean:
	rm -rf bin/
```

---

## 示例 4：React + TypeScript 前端项目

用户请求：
> 创建一个 React 项目，使用 TypeScript 和 Tailwind CSS

生成结构：
```
my-react-app/
├── src/
│   ├── main.tsx
│   ├── App.tsx
│   ├── components/
│   │   ├── ui/
│   │   │   ├── Button.tsx
│   │   │   └── Input.tsx
│   │   └── layout/
│   │       ├── Header.tsx
│   │       └── Footer.tsx
│   ├── hooks/
│   │   └── useLocalStorage.ts
│   ├── lib/
│   │   └── utils.ts
│   ├── styles/
│   │   └── globals.css
│   └── types/
│       └── index.ts
├── public/
│   └── favicon.ico
├── tests/
│   └── App.test.tsx
├── package.json
├── tsconfig.json
├── vite.config.ts
├── tailwind.config.js
├── postcss.config.js
├── .gitignore
└── README.md
```

---

## 对话示例

### 对话 1：简单请求

**用户**: 帮我创建一个 Python 项目

**助手**: 好的，我需要了解更多信息：
1. 项目类型是什么？（CLI工具、Web应用、库/SDK）
2. 需要什么框架？（如Web应用：FastAPI、Flask、Django）
3. 需要哪些额外功能？（测试、Docker、CI/CD）

**用户**: CLI 工具，用来处理图片压缩

**助手**: 明白了，我将为你创建一个 Python CLI 图片压缩工具的项目结构...

### 对话 2：详细请求

**用户**: 创建一个 TypeScript 的 npm 库，用来做 markdown 解析，需要支持测试和 GitHub Actions

**助手**: 好的，我将创建一个完整的 TypeScript npm 库项目，包含：
- src/ 目录用于源代码
- tests/ 目录用于测试
- examples/ 目录用于使用示例
- .github/workflows/ 用于 CI/CD
- 完整的 TypeScript 和打包配置

正在生成项目结构...
