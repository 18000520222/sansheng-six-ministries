import { UIAbility, Want, AbilityConstant } from '@kit.AbilityKit';
import { window } from '@kit.ArkUI';
import { WeChatService } from '../services/WeChatService';

export default class MainAbility extends UIAbility {
  onCreate(want: Want, launchParam: AbilityConstant.LaunchParam): void {
    console.log('[MainAbility] onCreate');
    // 初始化微信 SDK
    WeChatService.init(this.context);
  }

  onDestroy(): void {
    console.log('[MainAbility] onDestroy');
  }

  onWindowStageCreate(windowStage: window.WindowStage): void {
    windowStage.loadContent('pages/Index', (err) => {
      if (err.code) {
        console.error(`[MainAbility] loadContent failed: ${JSON.stringify(err)}`);
        return;
      }
      console.log('[MainAbility] loadContent success');
    });
  }

  onWindowStageDestroy(): void {
    console.log('[MainAbility] onWindowStageDestroy');
  }

  onForeground(): void {
    console.log('[MainAbility] onForeground');
  }

  onBackground(): void {
    console.log('[MainAbility] onBackground');
  }
}
