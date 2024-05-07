/**
 * 定义工具栏项的可配置参数
 */
export interface BarItem {
  id?: string;
  icon?: ResourceStr;
  activeIcon?: ResourceStr;
  status?: ToolbarItemStatus;
}