/**
 * 微信扫码配对页
 * 明天睡醒扫码即可绑定微信
 */
import router from '@ohos.router';
import { WeChatService } from '../services/WeChatService';

@Entry
@Component
struct WeChatPairPage {
  @State pairingStatus: string = '等待扫码';
  @State isPaired: boolean = false;
  @State qrCodeUrl: string = '';
  @State countdown: number = 120; // 二维码有效期倒计时

  aboutToAppear() {
    this.generateQRCode();
    // 轮询登录状态
    this.pollLoginStatus();
    // 倒计时
    this.startCountdown();
  }

  generateQRCode() {
    // TODO: 从后端获取微信登录二维码
    // const response = await ApiService.getWeChatQRCode();
    // this.qrCodeUrl = response.qrCodeUrl;
    this.qrCodeUrl = 'https://open.weixin.qq.com/connect/qrconnect?appid=YOUR_APP_ID&redirect_uri=YOUR_REDIRECT&response_type=code&scope=snsapi_login&state=STATE#wechat_redirect';
    console.log('[WeChatPair] 二维码已生成');
  }

  pollLoginStatus() {
    // 每 2 秒检查一次登录状态
    const timer = setInterval(async () => {
      if (this.isPaired) {
        clearInterval(timer);
        return;
      }
      // TODO: 调用后端接口检查扫码状态
      // const status = await ApiService.checkWeChatLoginStatus(this.qrCodeUrl);
      // if (status.paired) { ... }
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
      // 标题
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

      // 状态提示
      Text(this.pairingStatus)
        .fontSize(16)
        .fontColor(this.isPaired ? '#52C41A' : '#999')
        .margin({ top: 40 })

      // 二维码占位区
      Column() {
        if (this.isPaired) {
          Text('✅')
            .fontSize(64)
          Text('绑定成功！')
            .fontSize(20)
            .fontWeight(FontWeight.Bold)
            .margin({ top: 12 })
          Text('微信已连接，可以使用微信登录和分享功能')
            .fontSize(14)
            .fontColor('#999')
            .margin({ top: 8 })
            .width('80%')
            .textAlign(TextAlign.Center)
        } else {
          // 二维码区域
          Column() {
            Text('📱')
              .fontSize(64)
            Text('请用微信扫描二维码')
              .fontSize(15)
              .fontColor('#666')
              .margin({ top: 12 })
            Text(`有效期 ${Math.floor(this.countdown / 60)}:${(this.countdown % 60).toString().padStart(2, '0')}`)
              .fontSize(13)
              .fontColor('#BBB')
              .margin({ top: 6 })
          }
          .width(240)
          .height(280)
          .backgroundColor('#FFFFFF')
          .borderRadius(16)
          .border({ width: 1, color: '#EEE' })
          .justifyContent(FlexAlign.Center)
        }
      }
      .margin({ top: 40 })

      Blank()

      // 底部说明
      Column() {
        Text('绑定后可使用：')
          .fontSize(14)
          .fontColor('#999')
          .margin({ bottom: 8 })
        Text('• 微信一键登录')
        Text('• 分享内容到好友/朋友圈')
        Text('• 微信支付')
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
