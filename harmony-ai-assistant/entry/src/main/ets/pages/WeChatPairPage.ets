/**
 * 微信扫码配对页
 * 
 * 腾讯官方 WeChat OpenSDK for HarmonyOS
 * 包名: @tencent/wechat_open_sdk
 * 注册中心: https://ohpm.openharmony.cn
 * 
 * 接入流程:
 * 1. 微信开放平台 (open.weixin.qq.com) 创建移动应用
 * 2. 获取 AppID → 填入下方 WX_APP_ID
 * 3. ohpm install @tencent/wechat_open_sdk
 * 4. DevEco Studio 编译运行
 */
import router from '@ohos.router';
import { WeChatService } from '../services/WeChatService';

// TODO: 登录微信开放平台 → 创建移动应用 → 获取 AppID
// https://open.weixin.qq.com → 管理中心 → 创建移动应用
// 包名: com.example.aiassistant
const WX_APP_ID = 'your_wechat_app_id_here';

@Entry
@Component
struct WeChatPairPage {
  @State pairingStatus: string = '等待扫码';
  @State isPaired: boolean = false;
  @State countdown: number = 120; // 2分钟有效期
  @State pairCode: string = '';

  aboutToAppear() {
    this.generatePairInfo();
    this.pollLoginStatus();
    this.startCountdown();
  }

  generatePairInfo() {
    // 终端唯一标识
    this.pairCode = this.generateDeviceCode();
    
    // 微信 OAuth 二维码 URL（需 AppID 后生效）
    // https://open.weixin.qq.com/connect/qrconnect
    //   ?appid=APP_ID
    //   &redirect_uri=https://your-server.com/wechat/callback
    //   &response_type=code
    //   &scope=snsapi_userinfo
    //   &state=STATE#wechat_redirect
    
    console.log(`[WeChatPair] 配对码: ${this.pairCode}`);
  }

  generateDeviceCode(): string {
    const chars = 'ABCDEFGHJKLMNPQRSTUVWXYZ23456789';
    let code = '';
    for (let i = 0; i < 6; i++) {
      code += chars[Math.floor(Math.random() * chars.length)];
    }
    return code;
  }

  pollLoginStatus() {
    const timer = setInterval(async () => {
      if (this.isPaired) {
        clearInterval(timer);
        return;
      }
      // WeChat SDK callback 自动处理登录状态
      // 这里轮询后端接口获取配对结果
    }, 2000);
  }

  startCountdown() {
    const timer = setInterval(() => {
      if (this.countdown <= 0 || this.isPaired) {
        clearInterval(timer);
        if (this.countdown <= 0 && !this.isPaired) {
          this.pairingStatus = '二维码已过期，点击刷新';
        }
        return;
      }
      this.countdown--;
    }, 1000);
  }

  build() {
    Column() {
      Row() {
        Text('←')
          .fontSize(22)
          .fontColor('#333')
          .onClick(() => router.back())

        Text('微信绑定')
          .fontSize(20)
          .fontWeight(FontWeight.Bold)
          .margin({ left: 12 })
      }
      .width('100%')
      .padding({ left: 16, right: 16, top: 48, bottom: 16 })

      Text(this.pairingStatus)
        .fontSize(16)
        .fontColor(this.isPaired ? '#52C41A' : '#999')
        .margin({ top: 40 })

      Column() {
        if (this.isPaired) {
          Text('✅')
            .fontSize(64)
          Text('绑定成功！')
            .fontSize(20)
            .fontWeight(FontWeight.Bold)
            .margin({ top: 12 })
          Text('微信已连接')
            .fontSize(14)
            .fontColor('#999')
            .margin({ top: 8 })
        } else {
          // 二维码区域
          Column() {
            Text('📱')
              .fontSize(64)

            // 终端配对码
            Text(this.pairCode)
              .fontSize(32)
              .fontWeight(FontWeight.Bold)
              .fontColor('#1677FF')
              .fontFamily('monospace')
              .letterSpacing(8)
              .margin({ top: 8 })

            Text('请用微信扫描二维码配对')
              .fontSize(15)
              .fontColor('#666')
              .margin({ top: 12 })

            Text(`有效期 ${Math.floor(this.countdown / 60)}:${(this.countdown % 60).toString().padStart(2, '0')}`)
              .fontSize(13)
              .fontColor('#BBB')
              .margin({ top: 6 })

            Text('配对码: ' + this.pairCode)
              .fontSize(11)
              .fontColor('#CCC')
              .margin({ top: 8 })
          }
          .width(260)
          .height(300)
          .backgroundColor('#FFFFFF')
          .borderRadius(16)
          .border({ width: 1, color: '#EEE' })
          .justifyContent(FlexAlign.Center)
        }
      }
      .margin({ top: 40 })

      Blank()

      Column() {
        Text('绑定后可使用：')
          .fontSize(14)
          .fontColor('#999')
          .margin({ bottom: 8 })
        Text('• 微信一键登录')
        Text('• 分享到好友/朋友圈')
        Text('• 微信支付集成')
      }
      .padding(20)
      .width('100%')
    }
    .width('100%')
    .height('100%')
    .backgroundColor('#F5F5F5')
    .alignItems(HorizontalAlign.Center)
  }
}
