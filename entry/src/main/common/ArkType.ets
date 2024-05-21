/**
 * 列表项参数
 */
export interface ListItem {
  icon?: ResourceStr;
  title?: ResourceStr;
  subTitle?: ResourceStr;
}

/**
 * 列表项参数
 */
export interface ListGroupItem {
  name?: string;
  items?: ListItem[];
}

/**
 * 操作项参数
 */
export interface OperationItem {
  /** 标题 */
  title?: ResourceStr;
  /** 图标 */
  icon?: ResourceStr;

  /** 点击文本或图标时的回调函数 */
  action?: () => void;
}