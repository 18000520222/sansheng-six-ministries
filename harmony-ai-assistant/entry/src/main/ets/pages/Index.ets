import { THREE_SHENG, SIX_MINISTRIES, Sheng, Ministry } from '../data/DepartmentData';
import router from '@ohos.router';

@Entry
@Component
struct Index {
  @State activeTab: number = 0; // 0=三省, 1=六部

  // ========== 三省视图 ==========
  @Builder
  SanShengView() {
    Column() {
      // 流程提示
      Row() {
        Text('中书草拟  →  门下审核  →  尚书执行')
          .fontSize(12)
          .fontColor('#999')
          .width('100%')
          .textAlign(TextAlign.Center)
          .padding({ top: 12, bottom: 16 })
      }

      ForEach(THREE_SHENG, (item: Sheng, index: number) => {
        Row() {
          // 序号圆
          Text(`${index + 1}`)
            .fontSize(18)
            .fontWeight(FontWeight.Bold)
            .fontColor('#FFFFFF')
            .width(32)
            .height(32)
            .backgroundColor('#1A1A1A')
            .borderRadius(16)
            .textAlign(TextAlign.Center)
            .margin({ right: 14 })

          Column() {
            Row() {
              Text(item.icon)
                .fontSize(22)
                .margin({ right: 8 })
              Text(item.name)
                .fontSize(18)
                .fontWeight(FontWeight.Bold)
              Text(` · ${item.role}`)
                .fontSize(14)
                .fontColor('#1677FF')
            }
            .margin({ bottom: 6 })

            Text(item.description)
              .fontSize(13)
              .fontColor('#666')
              .lineHeight(20)
              .margin({ bottom: 10 })

            // 下辖职能标签
            Row() {
              ForEach(item.handle, (tag: string) => {
                Text(tag)
                  .fontSize(11)
                  .fontColor('#1677FF')
                  .backgroundColor('#EEF4FF')
                  .borderRadius(4)
                  .padding({ left: 8, right: 8, top: 2, bottom: 2 })
                  .margin({ right: 6 })
              })
            }
          }
          .alignItems(HorizontalAlign.Start)
          .layoutWeight(1)
        }
        .width('100%')
        .padding(16)
        .backgroundColor('#FFFFFF')
        .borderRadius(14)
        .margin({ bottom: 12 })
        .onClick(() => {
          router.pushUrl({
            url: 'pages/ChatPage',
            params: {
              departmentId: item.id,
              departmentName: item.name,
              prompt: item.prompt
            }
          });
        })
      })
    }
    .padding({ left: 16, right: 16, top: 4 })
  }

  // ========== 六部视图 ==========
  @Builder
  LiuBuView() {
    Column() {
      ForEach(SIX_MINISTRIES, (item: Ministry) => {
        Row() {
          // 图标
          Text(item.icon)
            .fontSize(32)
            .margin({ right: 12 })

          Column() {
            Row() {
              Text(item.name)
                .fontSize(17)
                .fontWeight(FontWeight.Bold)
              Text(`  ${item.tagline}`)
                .fontSize(12)
                .fontColor('#BBB')
            }

            // 神将名
            Text(item.soulName)
              .fontSize(20)
              .fontWeight(FontWeight.Bold)
              .fontColor('#1677FF')
              .margin({ top: 2 })

            Text(item.description)
              .fontSize(12)
              .fontColor('#999')
              .margin({ top: 2 })
              .maxLines(1)

            // 业务标签
            Row() {
              ForEach(item.handles, (tag: string) => {
                Text(tag)
                  .fontSize(10)
                  .fontColor('#888')
                  .backgroundColor('#F5F5F5')
                  .borderRadius(3)
                  .padding({ left: 6, right: 6, top: 1, bottom: 1 })
                  .margin({ right: 4, top: 4 })
              })
            }
          }
          .alignItems(HorizontalAlign.Start)
          .layoutWeight(1)

          Text('→')
            .fontSize(18)
            .fontColor('#CCCCCC')
        }
        .width('100%')
        .padding(14)
        .backgroundColor('#FFFFFF')
        .borderRadius(12)
        .margin({ bottom: 10 })
        .onClick(() => {
          router.pushUrl({
            url: 'pages/ChatPage',
            params: {
              departmentId: item.id,
              departmentName: item.name,
              departmentTag: item.tagline,
              prompt: item.prompt
            }
          });
        })
      })
    }
    .padding({ left: 16, right: 16, top: 4 })
  }

  build() {
    Column() {
      // ===== 顶栏 =====
      Row() {
        Text('三省六部')
          .fontSize(26)
          .fontWeight(FontWeight.Bold)

        Blank()

        Text('AI·朝堂')
          .fontSize(13)
          .fontColor('#AAA')
          .padding({ left: 10, right: 10, top: 4, bottom: 4 })
          .border({ width: 1, color: '#EEE', radius: 6 })
      }
      .width('100%')
      .padding({ left: 20, right: 20, top: 48, bottom: 12 })
      .backgroundColor('#FFFFFF')

      // ===== Tab 切换 =====
      Row() {
        Button('三省 · 决策')
          .fontSize(14)
          .fontColor(this.activeTab === 0 ? '#FFF' : '#666')
          .backgroundColor(this.activeTab === 0 ? '#1A1A1A' : '#F5F5F5')
          .borderRadius(20)
          .height(36)
          .onClick(() => { this.activeTab = 0 })

        Button('六部 · 执行')
          .fontSize(14)
          .fontColor(this.activeTab === 1 ? '#FFF' : '#666')
          .backgroundColor(this.activeTab === 1 ? '#1A1A1A' : '#F5F5F5')
          .borderRadius(20)
          .height(36)
          .margin({ left: 10 })
          .onClick(() => { this.activeTab = 1 })
      }
      .width('100%')
      .padding({ left: 20, bottom: 12 })
      .backgroundColor('#FFFFFF')

      // ===== 内容区 =====
      Scroll() {
        if (this.activeTab === 0) {
          this.SanShengView()
        } else {
          this.LiuBuView()
        }
      }
      .layoutWeight(1)
      .backgroundColor('#F5F5F5')

      // ===== 底部微信配对入口 =====
      Row() {
        Text('💬 微信扫码配对')
          .fontSize(14)
          .fontColor('#1677FF')
      }
      .width('100%')
      .height(44)
      .justifyContent(FlexAlign.Center)
      .backgroundColor('#FFFFFF')
      .onClick(() => { router.pushUrl({ url: 'pages/WeChatPairPage' }) })
    }
    .width('100%')
    .height('100%')
  }
}
