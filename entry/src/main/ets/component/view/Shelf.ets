import promptAction from '@ohos.promptAction';
import { OperationItem } from '../../../common/ArkType';
import { $$this } from '../../../common/TsType';
import { HeaderBar } from '../HeaderBar';
import MeasureText from '@ohos.measure';
import { ShelfGrid } from '../common/shelf/ShelfGrid';

/**
 * 书架视图
 */
@Preview
@Component({ freezeWhenInactive: true })
export struct ShelfView {
  /** Tabs 的当前索引 */
  @State currentTabIndex: number = 0
  @State isRefreshing: boolean = false
  @State groups: string[] = [
    '全部',
    '最近',
    '喜欢',
    '小说',
    '漫画',
    '百合',
  ]
  /** 标题菜单 */
  private titleMenus: OperationItem[] = [
    {
      icon: $r('app.media.search'),
      action: () => {
        promptAction.showToast({ message: '搜索' })
      }
    },
    {
      icon: $r('app.media.history'),
      action: () => {
        promptAction.showToast({ message: '历史记录' })
      }
    }
  ]
  /** 更多菜单 */
  private moreMenus: OperationItem[] = [
    { title: '更新目录', icon: $r('app.media.history') },
    { title: '添加本地', icon: $r('app.media.history') },
    { title: '书架管理', icon: $r('app.media.history') },
  ]
  /** Tabs 控制器 */
  private controller: TabsController = new TabsController()
  private primary: ResourceColor = $r('app.color.primary')
  private bgColor: ResourceColor = $r('app.color.background')
  private secondFontColor: ResourceColor = $r("app.color.secondFontColor")
  private fontSm: ResourceStr = $r('app.float.font_sm');
  private _tagSize: SizeResult = { width: 60, height: 32 };
  /** 文本高度 */
  private textHeight: Length = 30
  /** 图标大小 */
  private iconSize: Length = $r('app.float.icon_sm')

  aboutToAppear() {
    this.textHeight = MeasureText.measureTextSize({
      textContent: '',
      constraintWidth: 110,
      fontSize: $r('app.float.font_xs'),
      maxLines: 2,
      overflow: TextOverflow.Ellipsis,
    }).height ?? this.textHeight
  }

  build() {
    Column() {
      HeaderBar({ title: '书架', menus: this.titleMenus }) {
        Button({ type: ButtonType.Circle, buttonStyle: ButtonStyleMode.TEXTUAL }) {
          Image($r('app.media.more'))
            .width(this.iconSize)
            .height(this.iconSize)
        }
        .padding(6)
        .bindMenu(this.moreMenuBuild())
      }

      Tabs({ barPosition: BarPosition.Start, controller: this.controller }) {
        ForEach(this.groups, (item: string, index: number) => {
          TabContent() {
            Refresh({ refreshing: $$this.isRefreshing }) {
              ShelfGrid()
            }
            .onRefreshing(() => this.onRefreshing())
          }
          .tabBar(this.tabBuilder(item, index))
        })
      }
      .vertical(false)
      .scrollable(true)
      .fadingEdge(false)
      .barMode(BarMode.Scrollable)
      .flexShrink(1)
      .onAnimationStart((_, targetIndex) => {
        this.currentTabIndex = targetIndex
      })
    }
    .width('100%')
    .height('100%')
  }

  // 页签标题
  @Builder
  tabBuilder(name: string, index: number) {
    Column() {
      Button({ type: ButtonType.Normal, stateEffect: true, buttonStyle: ButtonStyleMode.NORMAL }) {
        Text(name)
          .fontSize(this.fontSm)
          .fontColor(this.currentTabIndex === index ? this.bgColor : this.secondFontColor)
      }
      .width(this._tagSize.width)
      .height(this._tagSize.height)
      .backgroundColor(this.currentTabIndex === index ? this.primary : this.bgColor)
      .borderRadius('50%')
      .padding(0)
      .margin({ right: 5, left: 5 })
      .onClick(() => {
        this.currentTabIndex = index;
        this.controller.changeIndex(index)
      })
      .shadow(ShadowStyle.OUTER_DEFAULT_XS)
    }
    .height('100%')
    .justifyContent(FlexAlign.Center)
  }

  // 更多菜单
  @Builder
  moreMenuBuild() {
    Menu() {
      ForEach(this.moreMenus, (item: OperationItem) => {
        MenuItem({ startIcon: item.icon, content: item.title, })
          .borderRadius(0)
          .onClick(() => {
            promptAction.showToast({ message: item.title })
          })
      })
    }
    .radius(0)
    .padding(0)
  }

  /**
   * 刷新操作
   */
  onRefreshing() {
    promptAction.showToast({ message: '正在刷新' })
    // TODO: 刷新操作
    setTimeout(() => this.isRefreshing = false, 1000)
  }
}
