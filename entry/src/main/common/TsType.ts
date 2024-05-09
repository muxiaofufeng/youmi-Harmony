// TODO: 由于 $$this 在编辑器中报错, 故再次声明 $$this 的类型
export declare let $$this: any;

/**
 * 源分类
 */
export enum ESourceType {
  /** 文本 */
  All = -1,
  /** 文本 */
  Text = 0,
  /** 图片 - 漫画 */
  Image = 1,
  /** 视频 */
  Video = 2,
  /** 音频 */
  Audio = 3,
  /** 文件 */
  File = 4,
}