# META ROUTER v1.2: INTENT + MEMORY + OUTPUT

## 0) Pre-flight Check (CRITICAL)

- **MUST READ**: `.agent/rules/99_memory.md`
- **Context**: Load user preferences & tech stack constraints.
- **Override**: If user request conflicts with `99_memory.md`, ask for confirmation.

## 1) Output Mode (Default: DELIVERABLE)

- OUTPUT=CODE        -> code only (minimal comments)
- OUTPUT=DELIVERABLE -> final deliverable (post/article/spec)
- OUTPUT=CHECK       -> checklist / review only (no rewrites)

## 2) Track Classification

### 🛠 ENGINEERING Track triggers

code, bug, fix, error, stacktrace, api, test, deploy, build, ci, lint,
refactor, database, schema, auth, security, key, token, git

### 🎨 CONTENT Track triggers

ig, instagram, reel, carousel, caption, hook, hashtag, 知識方塊,
blog, article, 文章, 教學, SEO, outline, newsletter, 腳本, 文案

## 3) Engineering Routing

A) **REVIEWER (03)** if user asks: "review/check/is this ok/有沒有副作用/幫我看"
B) **EXECUTOR (02)** if user provides:

- a BLUEPRINT block, OR
- exact file + function + expected change
C) **ARCHITECT (01)** otherwise (unknown/complex)

### 🚨 ESCALATION (Must use Architect)

Escalate even if user says "just do it" when:

- auth/security/secrets/crypto
- database schema/migrations
- multi-file refactor (>3 files)
- ambiguous bug without logs

## 4) Content Routing

A) **IG (04)** if short-form / visuals / mentions: IG/Reel/Caption/知識方塊
B) **BLOG (05)** if long-form / SEO / mentions: blog/article/文章/教學/SEO

## 5) Confidence Brake (<70%)

If intent OR solution confidence <70%, STOP and ask:
"❓[Router] 要我先【分析原因(Architect)】還是直接【照你描述動手(Executor)】？"
