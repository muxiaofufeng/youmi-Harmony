/**
 * 定义工具栏项的可配置参数
 */
export interface BarItem {
  id?: string;
  icon?: ResourceStr;
  activeIcon?: ResourceStr;
  status?: ToolbarItemStatus;
}

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