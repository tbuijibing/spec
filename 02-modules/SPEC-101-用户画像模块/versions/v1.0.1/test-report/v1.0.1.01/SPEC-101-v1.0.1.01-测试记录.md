# SPEC-101 v1.0.1.01 测试记录（第 1 轮，发现 Bug）

> 版本：v1.0.1 | 轮次：第 1 轮 | 日期：2026-04-04 | 结论：❌ 未通过

---

## 测试目标

验证 v1.0.1 新增功能：完整度趋势图、批量导入分批处理、分页 N+1 修复。

---

## 发现问题

| 编号 | 步骤 | 现象 | 严重程度 |
|------|------|------|----------|
| BUG-101-03 | Step 2 打开趋势图 Tab | `GET /user-profiles/{id}/trend` 返回 500，日志报 NPE（`trendData` 查询结果为 null 未判断）| P0 |

---

## 修复方案

在 `getProfileTrendById()` 中添加 null 检查：
```java
List<TrendPoint> trend = mapper.selectTrend(id, startDate);
return trend == null ? Collections.emptyList() : trend;
```

## 结论

❌ 本轮未通过，需修复 BUG-101-03 后进行第 2 轮测试。
