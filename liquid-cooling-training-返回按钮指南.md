# 为 liquid-cooling-training 页面添加"返回首页"按钮

## 问题说明

`https://lucylook6-design.github.io/liquid-cooling-training/` 页面目前没有返回首页的按钮，用户无法方便地回到主页 `https://lucylook6-design.github.io/landy-briefings/`

---

## 解决方案

### 方案1：固定位置返回按钮（推荐）

在页面HTML的 `<body>` 标签开始后添加：

```html
<!-- 返回首页按钮 -->
<a href="https://lucylook6-design.github.io/landy-briefings/" 
   class="home-button"
   title="返回首页">
  ← 返回首页
</a>

<style>
.home-button {
  position: fixed;
  top: 20px;
  left: 20px;
  padding: 10px 20px;
  background: linear-gradient(135deg, #3b82f6, #8b5cf6);
  color: white;
  text-decoration: none;
  border-radius: 8px;
  font-size: 14px;
  font-weight: 600;
  box-shadow: 0 4px 12px rgba(59, 130, 246, 0.3);
  z-index: 9999;
  transition: all 0.3s ease;
}

.home-button:hover {
  transform: translateY(-2px);
  box-shadow: 0 6px 20px rgba(59, 130, 246, 0.4);
}

/* 手机端适配 */
@media (max-width: 768px) {
  .home-button {
    top: 10px;
    left: 10px;
    padding: 8px 16px;
    font-size: 13px;
  }
}
</style>
```

---

### 方案2：顶部导航栏按钮

如果页面已有导航栏，在导航栏中添加：

```html
<nav>
  <a href="https://lucylook6-design.github.io/landy-briefings/" class="nav-home">
    🏠 首页
  </a>
  <!-- 其他导航项 -->
</nav>
```

---

### 方案3：侧边栏按钮

如果页面有侧边栏，在侧边栏顶部添加：

```html
<div class="sidebar">
  <a href="https://lucylook6-design.github.io/landy-briefings/" 
     class="sidebar-home">
    <span class="icon">🏠</span>
    <span class="text">返回首页</span>
  </a>
  <!-- 其他侧边栏内容 -->
</div>
```

---

## 实施步骤

### 1. 克隆仓库

```bash
cd ~/projects  # 或你的工作目录
git clone git@github.com:lucylook6-design/liquid-cooling-training.git
cd liquid-cooling-training
```

### 2. 找到主HTML文件

通常是 `index.html` 或类似名称的文件。

### 3. 编辑文件

在 `<body>` 标签后添加方案1的代码。

### 4. 本地测试

```bash
# 使用Python启动本地服务器
python3 -m http.server 8000

# 或使用其他方式打开HTML文件
open index.html
```

在浏览器中访问 `http://localhost:8000`，检查按钮是否正常显示和工作。

### 5. 提交并推送

```bash
git add .
git commit -m "添加返回首页按钮"
git push origin main  # 或 master，取决于默认分支名
```

### 6. 等待部署

GitHub Pages 通常在几分钟内自动部署更新。

### 7. 验证

访问 `https://lucylook6-design.github.io/liquid-cooling-training/` 确认按钮已添加并可以正常工作。

---

## 注意事项

1. **链接地址**：确保使用完整的URL `https://lucylook6-design.github.io/landy-briefings/`
2. **z-index**：设置足够高的 z-index（如9999）确保按钮在所有内容之上
3. **响应式设计**：添加媒体查询适配手机屏幕
4. **测试**：在手机和电脑上都要测试按钮是否正常工作

---

## 快速复制代码

```html
<!-- 复制以下完整代码到 <body> 标签后 -->
<a href="https://lucylook6-design.github.io/landy-briefings/" 
   class="home-button"
   title="返回首页">← 返回首页</a>

<style>
.home-button {
  position: fixed;
  top: 20px;
  left: 20px;
  padding: 10px 20px;
  background: linear-gradient(135deg, #3b82f6, #8b5cf6);
  color: white;
  text-decoration: none;
  border-radius: 8px;
  font-size: 14px;
  font-weight: 600;
  box-shadow: 0 4px 12px rgba(59, 130, 246, 0.3);
  z-index: 9999;
  transition: all 0.3s ease;
}
.home-button:hover {
  transform: translateY(-2px);
  box-shadow: 0 6px 20px rgba(59, 130, 246, 0.4);
}
@media (max-width: 768px) {
  .home-button {
    top: 10px;
    left: 10px;
    padding: 8px 16px;
    font-size: 13px;
  }
}
</style>
```

---

**创建时间：** 2026年4月26日  
**目标页面：** https://lucylook6-design.github.io/liquid-cooling-training/  
**返回地址：** https://lucylook6-design.github.io/landy-briefings/
