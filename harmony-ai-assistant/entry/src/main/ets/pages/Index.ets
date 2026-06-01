import { CEO_PANGU, NINE_DEPARTMENTS, Department } from '../data/DepartmentData';
import router from '@ohos.router';

@Entry
@Component
struct Index {
  @State activeTab: number = 0; // 0=总经理, 1=九部

  // ========== 总经理视图 ==========
  @Builder
  CEOView() {
    Column() {
      Row() {
        Text(CEO_PANGU.icon)
          .fontSize(48)
          .margin({ right: 16 })

        Column() {
          Text(CEO_PANGU.name)
            .fontSize(22)
            .fontWeight(FontWeight.Bold)
          Text(`神将 · ${CEO_PANGU.soulName}`)
            .fontSize(14)
            .fontColor('#1677FF')
            .margin({ top: 4 })
        }
        .alignItems(HorizontalAlign.Start)
      }
      .width('100%')
      .padding(20)
      .backgroundColor('#FFFFFF')
      .borderRadius(14)
      .margin({ bottom: 16 })

      Text(CEO_PANGU.description)
        .fontSize(14)
        .fontColor('#666')
        .lineHeight(22)
        .padding({ left: 4, right: 4 })
        .margin({ bottom: 16 })

      Text('下辖九部')
        .fontSize(16)
        .fontWeight(FontWeight.Bold)
        .margin({ bottom: 12 })
        .width('100%')

      ForEach(NINE_DEPARTMENTS, (dept: Department) => {
        Row() {
          Text(dept.icon)
            .fontSize(20)
            .margin({ right: 10 })
          Text(`${dept.name} · ${dept.soulName}`)
            .fontSize(14)
            .fontColor('#333')
        }
        .width('100%')
        .padding({ top: 8, bottom: 8 })
      })
    }
    .padding({ left: 16, right: 16, top: 8 })
  }

  // ========== 九部视图 ==========
  @Builder
  NineDepartmentsView() {
    Column() {
      ForEach(NINE_DEPARTMENTS, (item: Department) => {
        Row() {
          // 神将图标
          Text(item.icon)
            .fontSize(36)
            .margin({ right: 14 })

          Column() {
            // 部门名 + 神将
            Row() {
              Text(item.name)
                .fontSize(17)
                .fontWeight(FontWeight.Bold)
              Text(`  ${item.tagline}`)
                .fontSize(12)
                .fontColor('#CCC')
            }

            // 神将名
            Text(item.soulName)
              .fontSize(22)
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
              ForEach(item.handles.slice(0, 3), (tag: string) => {
                Text(tag)
                  .fontSize(10)
                  .fontColor('#888')
                  .backgroundColor('#F5F5F5')
                  .borderRadius(3)
                  .padding({ left: 6, right: 6, top: 1, bottom: 1 })
                  .margin({ right: 4, top: 4 })
              })
            }

            // 开源武器标签
            Row() {
              ForEach(item.openSourceWeapons.slice(0, 2), (weapon: string) => {
                Text(`⚔️ ${weapon}`)
                  .fontSize(9)
                  .fontColor('#E6A817')
                  .backgroundColor('#FFF8E1')
                  .borderRadius(3)
                  .padding({ left: 5, right: 5, top: 1, bottom: 1 })
                  .margin({ right: 4, top: 2 })
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
        .padding(16)
        .backgroundColor('#FFFFFF')
        .borderRadius(14)
        .margin({ bottom: 10 })
        .onClick(() => {
          router.pushUrl({
            url: 'pages/ChatPage',
            params: {
              departmentId: item.id,
              departmentName: item.name,
              soulName: item.soulName,
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
        Text('总经理 · 盘古')
          .fontSize(22)
          .fontWeight(FontWeight.Bold)

        Blank()

        Text('九部制')
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
        Button('🌐 总经理')
          .fontSize(14)
          .fontColor(this.activeTab === 0 ? '#FFF' : '#666')
          .backgroundColor(this.activeTab === 0 ? '#1A1A1A' : '#F5F5F5')
          .borderRadius(20)
          .height(36)
          .onClick(() => { this.activeTab = 0 })

        Button('📋 九部')
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
          this.CEOView()
        } else {
          this.NineDepartmentsView()
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
