export default class BaseReviewRule {
  /**
   * 段评URL
   */
  reviewUrl: string = '';
  /**
   * 段评发布者头像
   */
  avatarRule: string = '';
  /**
   * 段评内容
   */
  contentRule: string = '';
  /**
   * 段评发布时间
   */
  postTimeRule: string = '';
  /**
   *  获取段评回复URL
   */
  reviewQuoteUrl: string = '';
  //----- 这些功能将在以上功能完成以后实现 ------

  /**
   * 点赞URL
   */
  voteUpUrl: string = '';
  /**
   * 点踩URL
   */
  voteDownUrl: string = '';
  /**
   * 发送回复URL
   */
  postReviewUrl: string = '';
  /**
   * 发送回复段评URL
   */
  postQuoteUrl: string = '';
  /**
   * 删除段评URL
   */
  deleteUrl: string = '';
}