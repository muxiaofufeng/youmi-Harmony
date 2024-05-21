import { ShelfItem } from './ShelfItem';
import MeasureText from '@ohos.measure';
import { LazyData } from '../../../../common/LazyData';

@Preview
@Component
export struct ShelfGrid {
  /**
   * 需要显示的项目
   */
  @State items: LazyData<string> = new LazyData<string>([
    '防静电',
    '防静电开始今日份科技风数据额空间f',
    '防静电开',
    '防静电开',
    '防静电开始今日份科技风数据额空间f',
    '防静电开始今日份科技风数据额空间f',
    '防静电',
    '防静电开始今日份科技风数据额空间f',
    '防静电开始今日份科技风数据额空间f',
    '防静电开始今日份科技风数据额空间f',
    '防静电开始今日份科技风数据额空间f',
    '防静电开始今日份科技风数据额空间f',
    '防静电开始今日份科技风数据额空间f',
    '防静电开始今日份科技风数据额空间f',
    '防静电开始今日份科技风数据额空间f',
    '防静电',
  ])
  /** 项目宽度 */
  @State itemWidth: number = 110;
  /** 文本高度 */
  private textHeight: Length = 30

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
    Grid() {
      LazyForEach(this.items, (item: string) => {
        GridItem() {
          ShelfItem({
            text: item,
            coverWidth: this.itemWidth,
            textHeight: this.textHeight
          })
        }
      })
    }
    .columnsTemplate(`repeat(auto-fit, ${ this.itemWidth }vp)`)
    .columnsGap(0)
    .rowsGap(0)
    .minCount(3) // 当layoutDirection是Row/RowReverse时，表示可显示的最小列数
    .edgeEffect(EdgeEffect.Fade) // 设置组件的边缘滑动效果
    .enableScrollInteraction(true) // 设置是否支持滚动手势
    .scrollBarWidth(0)
  }
}