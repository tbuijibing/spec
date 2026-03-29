-- ============================================================
-- SPEC-101 用户画像模块 — DDL 脚本
-- 服务：globehive-base:8300 | 数据库：globehive
-- 版本：v1.0 | 日期：2026-03-29
-- ============================================================

CREATE TABLE `ai_user_profile` (
  -- ── BladeX BaseEntity 标准字段 ──────────────────────────────────
  `id`               bigint       NOT NULL            COMMENT '主键（雪花算法）',
  `tenant_id`        varchar(12)  DEFAULT '000000'    COMMENT '租户ID（关联 blade_tenant.tenant_id）',
  `create_user`      bigint       DEFAULT NULL        COMMENT '创建人（关联 blade_user.id）',
  `create_dept`      bigint       DEFAULT NULL        COMMENT '创建部门',
  `create_time`      datetime     DEFAULT NULL        COMMENT '创建时间',
  `update_user`      bigint       DEFAULT NULL        COMMENT '最后修改人',
  `update_time`      datetime     DEFAULT NULL        COMMENT '最后修改时间',
  `status`           int          DEFAULT 1           COMMENT '状态：1=启用，0=禁用，2=已合并',
  `is_deleted`       int          DEFAULT 0           COMMENT '软删除：0=正常，1=已删',
  -- ── 基础信息 ────────────────────────────────────────────────────
  `user_id`          bigint       NOT NULL            COMMENT '业务用户ID（关联 blade_user.id）',
  `real_name`        varchar(50)  DEFAULT NULL        COMMENT '真实姓名',
  `gender`           tinyint      DEFAULT NULL        COMMENT '性别：0=未知，1=男，2=女',
  `birthday`         date         DEFAULT NULL        COMMENT '生日',
  `constellation`    varchar(20)  DEFAULT NULL        COMMENT '星座',
  `profession`       varchar(50)  DEFAULT NULL        COMMENT '职业',
  `income_range`     varchar(30)  DEFAULT NULL        COMMENT '收入范围',
  -- ── 扩展信息（JSON） ────────────────────────────────────────────
  `family_members`   json         DEFAULT NULL        COMMENT '家庭成员（JSON 数组）',
  `anniversaries`    json         DEFAULT NULL        COMMENT '纪念日列表（JSON 数组）',
  `addresses`        json         DEFAULT NULL        COMMENT '收货地址列表（JSON 数组）',
  `social_accounts`  json         DEFAULT NULL        COMMENT '社交账号（JSON 数组）',
  `preferences`      json         DEFAULT NULL        COMMENT '偏好设置（JSON 对象）',
  `tags`             json         DEFAULT NULL        COMMENT '标签列表（JSON 字符串数组）',
  -- ── 画像统计 ────────────────────────────────────────────────────
  `completeness`     int          DEFAULT 0           COMMENT '画像完整度（0-100）',
  `merged_into`      bigint       DEFAULT NULL        COMMENT '合并目标账号ID（status=2时有值）',
  -- ── 主键与索引 ──────────────────────────────────────────────────
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_tenant_user` (`tenant_id`, `user_id`),
  KEY `idx_tenant_id` (`tenant_id`),
  KEY `idx_user_id` (`user_id`),
  KEY `idx_create_time` (`create_time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='用户画像主表';
