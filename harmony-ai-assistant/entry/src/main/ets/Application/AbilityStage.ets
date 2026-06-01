import { AbilityStage, Want } from '@kit.AbilityKit';

export default class MyAbilityStage extends AbilityStage {
  onCreate(): void {
    console.log('[MyAbilityStage] onCreate');
  }

  onAcceptWant(want: Want): string {
    return 'MyAbilityStage';
  }
}
