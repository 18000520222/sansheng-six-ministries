/**
 * API 服务层 — 对接 Kimi / DeepSeek 等大模型
 */
import { http } from '@kit.NetworkKit';

const KIMI_API_KEY = 'sk-kimi-NIaObIyvtTBPc8SUCNMce5es5CYunA8iXLS5vI7vaCeAvI1msvPsuF0xBmiwmRcs';
const KIMI_BASE_URL = 'https://api.moonshot.cn/v1';

export class ApiService {
  /**
   * 调用大模型对话
   * @param systemPrompt 系统提示词（各部的 soul prompt）
   * @param userMessage 用户消息
   * @param history 历史消息
   */
  static async chat(
    systemPrompt: string,
    userMessage: string,
    history: Array<{ role: string; content: string }> = []
  ): Promise<string> {
    const messages: Array<{ role: string; content: string }> = [
      { role: 'system', content: systemPrompt },
      ...history,
      { role: 'user', content: userMessage }
    ];

    try {
      const request = http.createHttp();
      const response = await request.request(
        `${KIMI_BASE_URL}/chat/completions`,
        {
          method: http.RequestMethod.POST,
          header: {
            'Content-Type': 'application/json',
            'Authorization': `Bearer ${KIMI_API_KEY}`
          },
          extraData: {
            model: 'moonshot-v1-8k',
            messages: messages,
            temperature: 0.7
          }
        }
      );

      request.destroy();

      if (response.responseCode === 200) {
        const data = JSON.parse(response.result as string);
        return data.choices?.[0]?.message?.content || '（未能获取回复）';
      }
      return `[接口异常: ${response.responseCode}]`;
    } catch (err) {
      return `[网络错误: ${JSON.stringify(err)}]`;
    }
  }

  /**
   * 流式对话（用于实时打字效果）
   */
  static async chatStream(
    systemPrompt: string,
    userMessage: string,
    history: Array<{ role: string; content: string }> = [],
    onChunk: (text: string) => void
  ): Promise<void> {
    const messages: Array<{ role: string; content: string }> = [
      { role: 'system', content: systemPrompt },
      ...history,
      { role: 'user', content: userMessage }
    ];

    try {
      const request = http.createHttp();
      const response = await request.request(
        `${KIMI_BASE_URL}/chat/completions`,
        {
          method: http.RequestMethod.POST,
          header: {
            'Content-Type': 'application/json',
            'Authorization': `Bearer ${KIMI_API_KEY}`
          },
          extraData: {
            model: 'moonshot-v1-8k',
            messages: messages,
            temperature: 0.7,
            stream: true
          }
        }
      );

      request.destroy();

      // 处理流式响应（简化版，实际需解析 SSE）
      if (response.responseCode === 200) {
        const result = response.result as string;
        onChunk(result);
      }
    } catch (err) {
      onChunk(`[流式错误: ${JSON.stringify(err)}]`);
    }
  }
}
