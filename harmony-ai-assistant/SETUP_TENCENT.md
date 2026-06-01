/**
 * 腾讯官方插件安装说明
 *
 * 1. 在项目根目录执行:
 *    ohpm install @tencent/wechat_open_sdk
 *
 * 2. 在 entry/oh-package.json5 中会添加依赖:
 *    "dependencies": {
 *      "@tencent/wechat_open_sdk": "^1.0.0"
 *    }
 *
 * 3. 在 entry/src/main/module.json5 中添加：
 *    "querySchemes": ["weixin", "weixinopensdk", "weixinULAPI"]
 *
 * 4. 回调配置 — WeChatService.ets 中的 init() 方法
 *    将 your_wechat_app_id 替换为你在微信开放平台申请的 AppID
 *
 * 5. 微信开放平台: https://open.weixin.qq.com
 *    创建移动应用 → 填写包名 com.example.aiassistant
 *    → 获取 AppID → 填入 WeChatService.ets
 *
 * 6. 扫码配对流程:
 *    - 用户打开"微信绑定"页面
 *    - 展示二维码（从后端获取）
 *    - 微信扫码授权
 *    - 回调获取 access_token → 完成绑定
 */
