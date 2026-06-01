#!/usr/bin/env bash
# ========================================
#  腾讯微信 OpenSDK for HarmonyOS 安装
# ========================================
#  官方 OHPM 包: @tencent/wechat_open_sdk
#  官方文档: https://developer.huawei.com/consumer/cn/doc/harmonyos-guides-V5/wechat-integration-V5
#  微信开放平台: https://open.weixin.qq.com
# ========================================

set -e

echo "===== 第一步: 配置 OHPM 官方源 ====="
ohpm config set registry https://ohpm.openharmony.cn/repos/ohpm

echo ""
echo "===== 第二步: 安装腾讯微信插件 ====="
ohpm install @tencent/wechat_open_sdk

echo ""
echo "===== 第三步: 验证安装 ====="
ohpm list | grep wechat

echo ""
echo "===== 第四步: 配置 module.json5 ====="
echo "在 entry/src/main/module.json5 中确保有:"
echo '  "querySchemes": ["weixin", "weixinopensdk", "weixinULAPI"]'
echo "  (通常已自动添加)"

echo ""
echo "===== 第五步: 获取微信 AppID ====="
echo "1. 浏览器打开: https://open.weixin.qq.com"
echo "2. 登录 → 管理中心 → 创建移动应用"
echo "3. 填写信息:"
echo "   - 应用名称: AI智能助手"
echo "   - 包名: com.example.aiassistant"
echo "   - 分类: 工具"
echo "4. 提交审核 → 审核通过后获取 AppID"
echo "5. 将 AppID 填入: entry/src/main/ets/services/WeChatService.ets → WX_APP_ID"

echo ""
echo "===== 第六步: 编译运行 ====="
echo "DevEco Studio 打开项目 → Build → Run"
echo "首页底部 → 「微信扫码配对」→ 扫码绑定"

echo ""
echo "===== 完成！ ====="
