/**
 * 腾讯插件安装脚本
 * 在项目根目录 harmony-ai-assistant 下执行
 */
/**
 * 1. 安装腾讯微信 OpenSDK
 *
 * ohpm install @tencent/wechat_open_sdk
 *
 * 2. 如果 ohpm 源不可用，配置腾讯内部源：
 * ohpm config set registry https://ohpm.openharmony.cn/ohpm/
 *
 * 3. 验证安装：
 * ohpm list
 *
 * 4. 在微信开放平台 (open.weixin.qq.com) 注册应用：
 *    - 包名: com.example.aiassistant
 *    - 签名: 从 DevEco Studio 获取
 *    - 获取 AppID
 *
 * 5. 将 AppID 填入:
 *    entry/src/main/ets/services/WeChatService.ets → WX_APP_ID
 *
 * 6. 在 module.json5 的 module 节点添加:
 *    "querySchemes": ["weixin", "weixinopensdk"]
 *
 * 7. 编译运行，打开"微信绑定"页面扫码配对即可
 */
