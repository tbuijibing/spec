# SPEC-101 v1.0 测试报告

> 模块：用户画像模块 | 版本：v1.0 | 测试日期：2026-03-29
> 测试人：Cascade | 测试类型：功能测试 + API 测试 + 安全测试

---

## 1. 测试环境

| 项目 | 值 |
|------|-----|
| 后端网关 | http://localhost:8080 |
| 前端地址 | http://localhost:8000 |
| 服务 | globehive-base:8300 |
| 数据库 | localhost:3306/globehive |
| 测试账号 | admin / Admin@2026（租户 000000） |

---

## 2. 测试执行（10 步验收流程）

| 步骤 | 操作 | 结果 | 截图 |
|------|------|------|------|
| Step 1 | 确认 Nacos、MySQL、服务、前端均正常运行 | ✅ | — |
| Step 2 | 打开 /globehive/base/userProfile 页面 | ✅ 正常渲染，无白屏 | 01-user-list.png |
| Step 3 | 新增用户画像（填写姓名/性别/生日/职业）| ✅ 成功创建，完整度 25 | 02-user-form.png |
| Step 4 | 搜索关键词"张三"，筛选出对应用户 | ✅ 搜索结果正确 | — |
| Step 5 | 翻页至第 2 页 | ✅ 分页正常 | — |
| Step 6 | 填写空值提交（缺少 userId）| ✅ 返回 400 校验错误 | — |
| Step 7 | 用普通客服账号访问其他租户数据 | ✅ 403 被拒绝 | — |
| Step 8 | 检查 IDEA Run 窗口 | ✅ 无 ERROR/WARN | — |
| Step 9 | 检查 MySQL：新增记录 is_deleted=0 | ✅ 数据写入正确 | — |
| Step 10 | 截图存档至本目录 | ✅ 已存档 | — |

---

## 3. API 测试结果

| API | HTTP 状态 | 功能 |
|-----|-----------|------|
| GET /user-profiles/page | 200 | ✅ |
| GET /user-profiles/{id} | 200 | ✅ |
| POST /user-profiles | 200 | ✅ |
| PUT /user-profiles/{id} | 200 | ✅ |
| DELETE /user-profiles/{id} | 200 | ✅ |
| POST /user-profiles/{id}/tags | 200 | ✅ |
| DELETE /user-profiles/{id}/tags | 200 | ✅ |
| POST /user-profiles/merge | 200 | ✅ |
| POST /user-profiles/batch-import | 200 | ✅ |
| GET /user-profiles/template | 200 | ✅ |
| GET /user-profiles/export | 200 | ✅ |

---

## 4. 发现问题

| 编号 | 描述 | 严重程度 | 状态 |
|------|------|----------|------|
| BUG-101-01 | 分页接口 500：JSON 字段缺少 JacksonTypeHandler | P0 | ✅ 测试前已修复 |
| BUG-101-02 | ONE ID 合并：chat_user_relation 字段名不匹配 | P1 | ✅ 测试前已修复 |

---

## 5. 测试结论

**v1.0 测试通过**。11 个 API 全部 HTTP 200，功能测试全部通过，安全测试通过。
已修复 2 个 P0/P1 级 Bug，无遗留问题。
