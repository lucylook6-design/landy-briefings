# API规范文档

## 文档信息

| 字段 | 值 |
|------|-----|
| **项目名称** | HR智能体 v2.0 API规范 |
| **版本** | v2.0.0 |
| **创建日期** | 2026-04-28 |
| **Base URL** | https://api.hr-agent.com/v2 |

---

## 认证

所有API请求需要在Header中携带JWT Token：

\`\`\`
Authorization: Bearer {accessToken}
\`\`\`

部分API还需要指定当前操作的企业：

\`\`\`
X-Company-Id: {companyId}
\`\`\`

---

## 通用响应格式

### 成功响应

\`\`\`json
{
  "success": true,
  "data": {
    // 业务数据
  },
  "meta": {
    "timestamp": "2026-04-28T10:00:00Z",
    "requestId": "req_xxx"
  }
}
\`\`\`

### 错误响应

\`\`\`json
{
  "success": false,
  "error": {
    "code": "ERROR_CODE",
    "message": "错误描述",
    "details": {}
  },
  "meta": {
    "timestamp": "2026-04-28T10:00:00Z",
    "requestId": "req_xxx"
  }
}
\`\`\`

---

## API端点列表

### 1. 认证模块

#### 1.1 POST /auth/login
猎头登录

**Request:**
\`\`\`json
{
  "email": "headhunter@example.com",
  "password": "encrypted_password"
}
\`\`\`

**Response 200:**
\`\`\`json
{
  "success": true,
  "data": {
    "accessToken": "eyJhbGciOiJIUzI1NiIs...",
    "refreshToken": "eyJhbGciOiJIUzI1NiIs...",
    "user": {
      "id": "uuid",
      "name": "张三",
      "email": "headhunter@example.com",
      "role": "consultant",
      "companies": [
        {
          "companyId": "uuid",
          "companyName": "科技公司A",
          "role": "admin"
        }
      ]
    }
  }
}
\`\`\`

**Error Codes:**
- `AUTH_003`: 账号或密码错误
- `AUTH_004`: 账号已被禁用

---

#### 1.2 POST /auth/logout
猎头登出

**Headers:**
\`\`\`
Authorization: Bearer {accessToken}
\`\`\`

**Request:**
\`\`\`json
{
  "userId": "uuid"
}
\`\`\`

**Response 200:**
\`\`\`json
{
  "success": true
}
\`\`\`

---

#### 1.3 POST /auth/refresh
刷新Token

**Request:**
\`\`\`json
{
  "refreshToken": "eyJhbGciOiJIUzI1NiIs..."
}
\`\`\`

**Response 200:**
\`\`\`json
{
  "success": true,
  "data": {
    "accessToken": "eyJhbGciOiJIUzI1NiIs...",
    "refreshToken": "eyJhbGciOiJIUzI1NiIs..."
  }
}
\`\`\`

**Error Codes:**
- `AUTH_002`: Token已过期
- `AUTH_001`: Token无效

---

### 2. 企业管理模块

#### 2.1 GET /companies
获取用户可访问的企业列表

**Headers:**
\`\`\`
Authorization: Bearer {accessToken}
\`\`\`

**Response 200:**
\`\`\`json
{
  "success": true,
  "data": {
    "companies": [
      {
        "id": "uuid",
        "name": "科技公司A",
        "status": "active",
        "bossAccountBound": true,
        "role": "admin"
      },
      {
        "id": "uuid",
        "name": "科技公司B",
        "status": "active",
        "bossAccountBound": false,
        "role": "member"
      }
    ]
  }
}
\`\`\`

---

#### 2.2 POST /companies/{companyId}/switch
切换当前企业

**Headers:**
\`\`\`
Authorization: Bearer {accessToken}
\`\`\`

**Path Parameters:**
- `companyId`: 企业ID

**Response 200:**
\`\`\`json
{
  "success": true,
  "data": {
    "newToken": "eyJhbGciOiJIUzI1NiIs...",
    "companyContext": {
      "companyId": "uuid",
      "companyName": "科技公司A",
      "bossAccount": {
        "account": "13800138000",
        "status": "active",
        "lastUsedAt": "2026-04-28T10:00:00Z"
      }
    }
  }
}
\`\`\`

**Error Codes:**
- `PERM_001`: 无权访问该企业

---

### 3. BOSS直聘账号管理模块

#### 3.1 POST /companies/{companyId}/boss-account
绑定BOSS直聘账号

**Headers:**
\`\`\`
Authorization: Bearer {accessToken}
X-Company-Id: {companyId}
\`\`\`

**Request:**
\`\`\`json
{
  "account": "13800138000",
  "password": "encrypted_password"
}
\`\`\`

**Response 200:**
\`\`\`json
{
  "success": true,
  "data": {
    "accountId": "uuid",
    "account": "13800138000",
    "status": "active"
  }
}
\`\`\`

**Error Codes:**
- `BIZ_002`: BOSS账号验证失败
- `BIZ_001`: 该企业已绑定BOSS账号

---

#### 3.2 PUT /companies/{companyId}/boss-account/{accountId}
更新BOSS直聘账号

**Headers:**
\`\`\`
Authorization: Bearer {accessToken}
X-Company-Id: {companyId}
\`\`\`

**Request:**
\`\`\`json
{
  "password": "new_encrypted_password"
}
\`\`\`

**Response 200:**
\`\`\`json
{
  "success": true,
  "data": {
    "accountId": "uuid",
    "updatedAt": "2026-04-28T10:00:00Z"
  }
}
\`\`\`

---

#### 3.3 POST /companies/{companyId}/boss-account/validate
验证BOSS直聘账号

**Headers:**
\`\`\`
Authorization: Bearer {accessToken}
X-Company-Id: {companyId}
\`\`\`

**Request:**
\`\`\`json
{
  "account": "13800138000",
  "password": "encrypted_password"
}
\`\`\`

**Response 200:**
\`\`\`json
{
  "success": true,
  "data": {
    "valid": true
  }
}
\`\`\`

**Response 200 (验证失败):**
\`\`\`json
{
  "success": true,
  "data": {
    "valid": false,
    "error": "账号或密码错误"
  }
}
\`\`\`

---

### 4. 招聘需求模块

#### 4.1 POST /jobs
创建招聘需求

**Headers:**
\`\`\`
Authorization: Bearer {accessToken}
X-Company-Id: {companyId}
\`\`\`

**Request:**
\`\`\`json
{
  "title": "高级前端工程师",
  "rawJd": "职位描述...",
  "shortlistLimit": 6
}
\`\`\`

**Response 201:**
\`\`\`json
{
  "success": true,
  "data": {
    "id": "uuid",
    "title": "高级前端工程师",
    "rawJd": "职位描述...",
    "optimizedJd": "AI优化后的JD...",
    "shortlistLimit": 6,
    "status": "active",
    "createdAt": "2026-04-28T10:00:00Z"
  }
}
\`\`\`

---

#### 4.2 GET /jobs
获取招聘需求列表

**Headers:**
\`\`\`
Authorization: Bearer {accessToken}
X-Company-Id: {companyId}
\`\`\`

**Query Parameters:**
- `status`: active | paused | closed (可选)
- `page`: 页码，默认1
- `pageSize`: 每页数量，默认20

**Response 200:**
\`\`\`json
{
  "success": true,
  "data": {
    "jobs": [
      {
        "id": "uuid",
        "title": "高级前端工程师",
        "status": "active",
        "createdAt": "2026-04-28T10:00:00Z",
        "candidatesCount": 5,
        "lastScreeningAt": "2026-04-28T11:00:00Z"
      }
    ],
    "pagination": {
      "page": 1,
      "pageSize": 20,
      "total": 50,
      "totalPages": 3
    }
  }
}
\`\`\`

---

#### 4.3 GET /jobs/{jobId}
获取招聘需求详情

**Headers:**
\`\`\`
Authorization: Bearer {accessToken}
X-Company-Id: {companyId}
\`\`\`

**Response 200:**
\`\`\`json
{
  "success": true,
  "data": {
    "id": "uuid",
    "title": "高级前端工程师",
    "rawJd": "职位描述...",
    "optimizedJd": "AI优化后的JD...",
    "shortlistLimit": 6,
    "status": "active",
    "createdAt": "2026-04-28T10:00:00Z",
    "updatedAt": "2026-04-28T10:00:00Z",
    "statistics": {
      "totalResumes": 45,
      "screeningTasks": 3,
      "candidates": 18
    }
  }
}
\`\`\`

**Error Codes:**
- `NOT_FOUND_001`: 招聘需求不存在
- `PERM_002`: 无权访问该招聘需求

---

### 5. BOSS直聘自动化模块

#### 5.1 POST /jobs/{jobId}/automation/trigger
触发BOSS直聘自动化

**Headers:**
\`\`\`
Authorization: Bearer {accessToken}
X-Company-Id: {companyId}
\`\`\`

**Request:**
\`\`\`json
{
  "keywords": ["React", "TypeScript", "前端"],
  "filters": {
    "location": "北京",
    "experience": "3-5年",
    "education": "本科",
    "maxResults": 50
  },
  "greetingMessage": "您好，我们对您的简历很感兴趣..."
}
\`\`\`

**Response 200:**
\`\`\`json
{
  "success": true,
  "data": {
    "automationId": "uuid",
    "status": "running",
    "estimatedTime": "30分钟",
    "startedAt": "2026-04-28T10:00:00Z"
  }
}
\`\`\`

**Error Codes:**
- `BIZ_001`: 企业未绑定BOSS账号
- `BIZ_003`: 自动化任务已在运行中
- `RATE_LIMIT_001`: 超过搜索频率限制

---

#### 5.2 GET /jobs/{jobId}/automation/status
查询自动化状态

**Headers:**
\`\`\`
Authorization: Bearer {accessToken}
X-Company-Id: {companyId}
\`\`\`

**Response 200:**
\`\`\`json
{
  "success": true,
  "data": {
    "status": "running",
    "progress": {
      "searched": 50,
      "greeted": 48,
      "downloaded": 45,
      "failed": 2
    },
    "startedAt": "2026-04-28T10:00:00Z",
    "estimatedCompletionAt": "2026-04-28T10:30:00Z"
  }
}
\`\`\`

**Response 200 (已完成):**
\`\`\`json
{
  "success": true,
  "data": {
    "status": "completed",
    "progress": {
      "searched": 50,
      "greeted": 48,
      "downloaded": 45,
      "failed": 2
    },
    "startedAt": "2026-04-28T10:00:00Z",
    "completedAt": "2026-04-28T10:25:00Z",
    "duration": "25分钟"
  }
}
\`\`\`

---

#### 5.3 GET /jobs/{jobId}/automation/logs
获取自动化日志

**Headers:**
\`\`\`
Authorization: Bearer {accessToken}
X-Company-Id: {companyId}
\`\`\`

**Query Parameters:**
- `actionType`: search | greet | download (可选)
- `status`: success | failed (可选)
- `page`: 页码，默认1
- `pageSize`: 每页数量，默认20

**Response 200:**
\`\`\`json
{
  "success": true,
  "data": {
    "logs": [
      {
        "id": "uuid",
        "actionType": "greet",
        "status": "success",
        "candidatesCount": 1,
        "createdAt": "2026-04-28T10:05:00Z",
        "metadata": {
          "candidateName": "李四",
          "message": "您好，我们对您的简历很感兴趣..."
        }
      },
      {
        "id": "uuid",
        "actionType": "download",
        "status": "failed",
        "errorMessage": "简历下载失败：网络超时",
        "createdAt": "2026-04-28T10:06:00Z"
      }
    ],
    "pagination": {
      "page": 1,
      "pageSize": 20,
      "total": 100,
      "totalPages": 5
    }
  }
}
\`\`\`

---

### 6. 筛选模块

#### 6.1 POST /jobs/{jobId}/screening/trigger
触发手动筛选

**Headers:**
\`\`\`
Authorization: Bearer {accessToken}
X-Company-Id: {companyId}
\`\`\`

**Response 200:**
\`\`\`json
{
  "success": true,
  "data": {
    "taskId": "uuid",
    "status": "running",
    "totalResumes": 45,
    "startedAt": "2026-04-28T10:30:00Z"
  }
}
\`\`\`

**Error Codes:**
- `BIZ_004`: 没有可筛选的简历

---

#### 6.2 GET /screening-tasks/{taskId}
获取筛选任务状态

**Headers:**
\`\`\`
Authorization: Bearer {accessToken}
X-Company-Id: {companyId}
\`\`\`

**Response 200:**
\`\`\`json
{
  "success": true,
  "data": {
    "id": "uuid",
    "jobId": "uuid",
    "status": "completed",
    "totalResumes": 45,
    "shortlistedCount": 6,
    "tokenUsed": 15000,
    "startedAt": "2026-04-28T10:30:00Z",
    "completedAt": "2026-04-28T10:34:00Z",
    "duration": "4分钟"
  }
}
\`\`\`

---

#### 6.3 GET /screening-tasks/{taskId}/candidates
获取筛选结果

**Headers:**
\`\`\`
Authorization: Bearer {accessToken}
X-Company-Id: {companyId}
\`\`\`

**Response 200:**
\`\`\`json
{
  "success": true,
  "data": {
    "candidates": [
      {
        "id": "uuid",
        "rank": 1,
        "matchScore": 0.92,
        "basicInfo": {
          "name": "李四",
          "phone": "13900139000",
          "email": "lisi@example.com",
          "location": "北京"
        },
        "workExperience": [
          {
            "company": "A公司",
            "title": "高级前端工程师",
            "duration": "2020-01 ~ 2023-12",
            "description": "负责..."
          }
        ],
        "education": [
          {
            "school": "清华大学",
            "degree": "本科",
            "major": "计算机科学",
            "year": "2016-2020"
          }
        ],
        "recommendation": {
          "strengths": [
            "5年React开发经验",
            "大厂背景，技术能力强"
          ],
          "matchPoints": [
            "技术栈完全匹配",
            "项目经验丰富"
          ],
          "potentialRisks": [
            "期望薪资略高于预算"
          ],
          "summary": "该候选人技术能力强，项目经验丰富，与岗位要求高度匹配..."
        }
      }
    ]
  }
}
\`\`\`

---

### 7. Word导出模块

#### 7.1 POST /screening-tasks/{taskId}/export/word
导出Word文档

**Headers:**
\`\`\`
Authorization: Bearer {accessToken}
X-Company-Id: {companyId}
\`\`\`

**Request:**
\`\`\`json
{
  "candidateIds": ["uuid1", "uuid2", "uuid3"],
  "includeFullResume": true
}
\`\`\`

**Response 200:**
\`\`\`json
{
  "success": true,
  "data": {
    "downloadUrl": "https://api.hr-agent.com/downloads/xxx.docx",
    "filename": "高级前端工程师_候选人推荐_20260428.docx",
    "fileSize": 1024000,
    "expiresAt": "2026-04-29T10:00:00Z"
  }
}
\`\`\`

**Error Codes:**
- `BIZ_005`: 导出候选人数量超过10个

---

#### 7.2 GET /downloads/{fileId}
下载Word文件

**Headers:**
\`\`\`
Authorization: Bearer {accessToken}
\`\`\`

**Response 200:**
- Content-Type: `application/vnd.openxmlformats-officedocument.wordprocessingml.document`
- Content-Disposition: `attachment; filename="xxx.docx"`
- Body: Word文件二进制数据

**Error Codes:**
- `NOT_FOUND_002`: 文件不存在或已过期

---

## 错误代码汇总

| 错误代码 | HTTP状态码 | 描述 |
|----------|-----------|------|
| AUTH_001 | 401 | Token无效 |
| AUTH_002 | 401 | Token已过期 |
| AUTH_003 | 401 | 账号或密码错误 |
| AUTH_004 | 403 | 账号已被禁用 |
| PERM_001 | 403 | 无权访问该企业 |
| PERM_002 | 403 | 无权访问该招聘需求 |
| BIZ_001 | 400 | 企业未绑定BOSS账号 |
| BIZ_002 | 400 | BOSS账号验证失败 |
| BIZ_003 | 400 | 自动化任务已在运行中 |
| BIZ_004 | 400 | 没有可筛选的简历 |
| BIZ_005 | 400 | 导出候选人数量超过10个 |
| RATE_LIMIT_001 | 429 | 超过搜索频率限制 |
| RATE_LIMIT_002 | 429 | 超过打招呼频率限制 |
| RATE_LIMIT_003 | 429 | 超过下载频率限制 |
| NOT_FOUND_001 | 404 | 招聘需求不存在 |
| NOT_FOUND_002 | 404 | 文件不存在或已过期 |
| SYS_001 | 500 | 数据库错误 |
| SYS_002 | 500 | 文件存储错误 |
| SYS_999 | 500 | 未知系统错误 |

---

**文档结束** | 版本 v2.0.0 | 2026-04-28
