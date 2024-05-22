import promptAction from '@ohos.promptAction';
import { OperationItem } from '../../../common/ArkType';
import { HeaderBar } from '../HeaderBar';
import MeasureText from '@ohos.measure';
import { ShelfGrid } from '../common/shelf/ShelfGrid';
import { LazyData } from '../../../common/LazyData';

/**
 * 书架视图
 */
@Preview
@Component({ freezeWhenInactive: true })
export struct ShelfView {
  /** Swiper 页面的当前索引 */
  @State currentIndex: number = 0
  /** 分组 */
  @State groups: LazyData<string> = new LazyData<string>([
    '全部',
    '最近',
    '喜欢',
    '小说',
    '漫画',
    '百合',
    '漫画',
  ])
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
    { title: '添加远程', icon: $r('app.media.history') },
    { title: '书架管理', icon: $r('app.media.history') },
    { title: '缓存/导出', icon: $r('app.media.history') },
    { title: '分组管理', icon: $r('app.media.history') },
    { title: '书架布局', icon: $r('app.media.history') },
    { title: '导出书单', icon: $r('app.media.history') },
    { title: '导入书单', icon: $r('app.media.history') },
    { title: '日志', icon: $r('app.media.journal') },
  ]
  /** Swiper 控制器 */
  private swiperController: SwiperController = new SwiperController()
  /** List 控制器 */
  private listScroller: ListScroller = new ListScroller()
  /** 分组按钮的宽度 */
  private tagWidth: number = 60
  /** 文本高度 */
  private textHeight: Length = 30
  private primary: ResourceColor = $r('app.color.primary')
  private onFontColor: ResourceColor = $r('app.color.onFontColor')
  private secondFontColor: ResourceColor = $r("app.color.secondFontColor")
  private buttonEffect: ResourceColor = $r("app.color.buttonEffect")
  private fontSm: ResourceStr = $r('app.float.font_sm');
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

      this.tabsBuild()
      Swiper(this.swiperController) {
        LazyForEach(this.groups, (item: string) => {
          ShelfGrid()
        })
      }
      .index($$this.currentIndex)
      .loop(false)
      .cachedCount(1)
      .flexShrink(1)
      .indicator(false)
      .effectMode(EdgeEffect.None)
      .nestedScroll(SwiperNestedScrollMode.SELF_FIRST)
      .onAnimationStart((_, targetIndex) => {
        this.listScroller.scrollToIndex(targetIndex, true, ScrollAlign.CENTER)
      })
    }
    .width('100%')
    .height('100%')
  }

  /**
   * 页签标题
   */
  @Builder
  tabsBuild() {
    Row() {
      List({ space: 5, initialIndex: 0, scroller: this.listScroller }) {
        LazyForEach(this.groups, (item: string, index: number) => {
          ListItem() {
            Button() {
              Text(item)
                .fontSize(this.fontSm)
                .fontColor(this.currentIndex === index ? this.onFontColor : this.secondFontColor)
            }
            .width(this.tagWidth)
            .height(this.tagWidth / 2)
            .backgroundColor(this.currentIndex === index ? this.primary : this.buttonEffect)
            .onClick(() => {
              this.currentIndex = index;
              this.listScroller.scrollToIndex(index, true, ScrollAlign.CENTER)
            })
          }
        })
      }
      .width('100%')
      .height(this.tagWidth / 2)
      .cachedCount(1)
      .chainAnimation(true)
      .alignListItem(ListItemAlign.Center)
      .edgeEffect(EdgeEffect.Spring)
      .scrollBar(BarState.Off)
      .listDirection(Axis.Horizontal)
    }
    .width('100%')
    .padding({ left: 10, right: 10, top: 10, bottom: -10 })
    .justifyContent(FlexAlign.Start)
    .alignItems(VerticalAlign.Center)
  }

  /**
   * 更多菜单
   */
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
}
