import router from '@ohos.router';
import { ApiService } from '../services/ApiService';
import { promptAction } from '@kit.ArkUI';

interface Message {
  role: 'user' | 'assistant';
  content: string;
  time: string;
}

@Entry
@Component
struct ChatPage {
  @State departmentName: string = '';
  @State soulName: string = '';
  @State systemPrompt: string = '';
  @State inputText: string = '';
  @State messages: Message[] = [];
  @State isLoading: boolean = false;

  aboutToAppear() {
    const params = router.getParams() as Record<string, string>;
    this.departmentName = params['departmentName'] || '总经理';
    this.soulName = params['soulName'] || '';
    this.systemPrompt = params['prompt'] || '';

    const title = this.soulName ? `${this.departmentName} · ${this.soulName}` : this.departmentName;
    this.messages.push({
      role: 'assistant',
      content: `我是${title}，请讲。`,
      time: this.getCurrentTime()
    });
  }

  getCurrentTime(): string {
    const now = new Date();
    return `${now.getHours().toString().padStart(2, '0')}:${now.getMinutes().toString().padStart(2, '0')}`;
  }

  async sendMessage() {
    if (!this.inputText.trim() || this.isLoading) return;

    const userMsg: Message = {
      role: 'user',
      content: this.inputText.trim(),
      time: this.getCurrentTime()
    };
    this.messages.push(userMsg);
    const query = this.inputText.trim();
    this.inputText = '';
    this.isLoading = true;

    // 构建历史消息（最近 10 条）
    const history = this.messages.slice(-11, -1).map(msg => ({
      role: msg.role,
      content: msg.content
    }));

    try {
      const reply = await ApiService.chat(this.systemPrompt, query, history);
      this.messages.push({
        role: 'assistant',
        content: reply,
        time: this.getCurrentTime()
      });
    } catch (err) {
      this.messages.push({
        role: 'assistant',
        content: `调用失败，请稍后重试。\n${JSON.stringify(err)}`,
        time: this.getCurrentTime()
      });
    } finally {
      this.isLoading = false;
    }
  }

  build() {
    Column() {
      // 标题栏
      Row() {
        Text('←')
          .fontSize(22)
          .fontColor('#333')
          .onClick(() => router.back())

        Column() {
          Text(this.departmentName)
            .fontSize(16)
            .fontWeight(FontWeight.Medium)
          if (this.soulName) {
            Text(this.soulName)
              .fontSize(20)
              .fontWeight(FontWeight.Bold)
              .fontColor('#1677FF')
          }
        }
        .alignItems(HorizontalAlign.Start)
        .margin({ left: 10 })
      }
      .width('100%')
      .height(52)
      .padding({ left: 16, right: 16 })
      .backgroundColor('#FFFFFF')

      // 消息列表
      Scroll() {
        Column() {
          ForEach(this.messages, (msg: Message) => {
            Column() {
              Row() {
                if (msg.role === 'assistant') {
                  Text(msg.content)
                    .fontSize(15)
                    .fontColor('#1A1A1A')
                    .backgroundColor('#FFFFFF')
                    .borderRadius(12)
                    .padding(12)
                    .constraintSize({ maxWidth: '75%' })
                } else {
                  Blank()
                  Text(msg.content)
                    .fontSize(15)
                    .fontColor('#FFFFFF')
                    .backgroundColor('#1677FF')
                    .borderRadius(12)
                    .padding(12)
                    .constraintSize({ maxWidth: '75%' })
                }
              }
              .width('100%')
              .padding({ left: 16, right: 16 })

              Text(msg.time)
                .fontSize(11)
                .fontColor('#CCC')
                .margin({ top: 4 })
                .padding(msg.role === 'user' ? { right: 16 } : { left: 16 })
                .width('100%')
                .textAlign(msg.role === 'user' ? TextAlign.End : TextAlign.Start)
            }
            .width('100%')
            .margin({ top: 16 })
          })

          // 加载指示器
          if (this.isLoading) {
            Text('正在生成...')
              .fontSize(13)
              .fontColor('#999')
              .padding({ left: 28, top: 8 })
              .width('100%')
          }
        }
        .padding({ bottom: 16 })
      }
      .layoutWeight(1)
      .backgroundColor('#F5F5F5')

      // 输入栏
      Row() {
        TextInput({ text: this.inputText, placeholder: this.isLoading ? '回复中...' : '输入任务...' })
          .layoutWeight(1)
          .height(44)
          .backgroundColor('#FFFFFF')
          .borderRadius(22)
          .padding({ left: 16, right: 16 })
          .enabled(!this.isLoading)
          .onChange((value: string) => { this.inputText = value; })

        Button('发送')
          .height(44)
          .margin({ left: 10 })
          .backgroundColor(this.isLoading ? '#CCCCCC' : '#1677FF')
          .borderRadius(22)
          .enabled(!this.isLoading)
          .onClick(() => this.sendMessage())
      }
      .width('100%')
      .padding({ left: 12, right: 12, top: 10, bottom: 24 })
      .backgroundColor('#FFFFFF')
    }
    .width('100%')
    .height('100%')
  }
}
