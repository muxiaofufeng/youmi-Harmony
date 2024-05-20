/**
 * 基本内容规则
 */
export class BaseContentRule {
  /** 正文内容 */
  content?: string = '';
  /** 正文标题规则, chapterName */
  title?: string = '';
  //有些网站只能在正文中获取标题
  /** 正文下一页URL规则, 正文翻页规则 */
  nextContentUrl?: string = '';
  /** WebView JS */
  webJs?: string = '';
  /** 资源正则 */
  sourceRegex?: string = '';
  /** 替换规则 */
  replaceRegex?: string = '';
  /** 图片样式, 默认大小居中,FULL最大宽度 */
  imageStyle?: string = '';
  /** 图片解密, 图片bytes二次解密js, 返回解密后的bytes */
  imageDecode?: string = '';
  /** 购买操作,js或者包含{{js}}的url */
  payAction?: string = '';
}