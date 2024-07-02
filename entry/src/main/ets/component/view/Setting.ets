import { ListGroupItem, ListItem, OperationItem } from '../../../common/ArkType';
import promptAction from '@ohos.promptAction';
import { HeaderBar } from '../HeaderBar';

@Preview
@Component({ freezeWhenInactive: true })
export struct SettingView {
  /** 列表分组项 */
  @State listItems: ListGroupItem[] = [
    {
      items: [
        {
          icon: $r('app.media.search'),
          title: '源管理',
          subTitle: '新建，导入，编辑或管理源',
          action: ()=>{

          }
        },
        {
          icon: $r('app.media.search'),
          title: '目录规则',
          subTitle: '配置目录规则',
        },
        {
          icon: $r('app.media.search'),
          title: '替换净化',
          subTitle: '配置替换净化规则',
        },
        {
          icon: $r('app.media.search'),
          title: '字典规则',
          subTitle: '配置字典规则',
        },
        {
          icon: $r('app.media.search'),
          title: '主题模式',
          subTitle: '选择主题模式',
        },
        {
          icon: $r('app.media.search'),
          title: 'Web 服务',
          subTitle: '用浏览器写源',
        }
      ]
    },
    {
      name: '设置',
      items: [
        {
          icon: $r('app.media.search'),
          title: '备份与恢复',
          subTitle: 'WebDav 设置/导入数据',
        },
        {
          icon: $r('app.media.search'),
          title: '主题设置',
          subTitle: '于界面/颜色相关的一些设置',
        },
        {
          icon: $r('app.media.search'),
          title: '其它设置',
          subTitle: '于功能相关的一些设置',
        }
      ]
    },
    {
      name: '其它',
      items: [
        {
          icon: $r('app.media.search'),
          title: '书签',
          subTitle: '所有书签',
        },
        {
          icon: $r('app.media.search'),
          title: '阅读记录',
          subTitle: '阅读时间记录',
        },
        {
          icon: $r('app.media.search'),
          title: '文件管理',
          subTitle: '管理私有文件夹的文件',
        },
        {
          icon: $r('app.media.search'),
          title: '关于',
        },
        {
          icon: $r('app.media.search'),
          title: '退出',
        }
      ]
    }
  ];
  /** 帮助按钮 */
  private helpButton: OperationItem = {
    icon: $r('app.media.help'),
    action: () => {
      promptAction.showToast({ message: 'demo' })
    }
  }
  /** 列表项的最小高度 */
  private itemHeight: number = 65;
  private fontSize: Resource = $r('app.float.font');
  private fontSm: Resource = $r('app.float.font_sm');
  private iconSize: Resource = $r('app.float.icon');
  private primary: Resource = $r('app.color.primary');
  private fontColor: Resource = $r('app.color.fontColor');
  private secondFontColor: Resource = $r('app.color.secondFontColor');

  build() {
    Column() {
      HeaderBar({ title: '我的', menus: [this.helpButton] })

      List({ initialIndex: 0 }) {
        ForEach(this.listItems, (item: ListGroupItem) => {
          ListItemGroup({ header: this.listHeaderBuild(item.name) }) {
            ForEach(item.items, (item: ListItem) => {
              this.listItemBuild(item)
            })
          }
        })
      }
      .width('100%')
      .height('auto')
      .listDirection(Axis.Vertical) // 排列方向
      .scrollBar(BarState.Off) // 关闭滚动条
      .sticky(StickyStyle.None) // 设置ListItemGroup中header和footer是否要吸顶或吸底
      .enableScrollInteraction(true) // 设置是否支持滚动手势
      .edgeEffect(EdgeEffect.None) // 设置List组件的边缘滑动效果，支持弹簧效果和阴影效果
      .divider({ strokeWidth: 8 }) // 分割线样式
      .layoutWeight(1) // 设置了layoutWeight属性的子元素与兄弟元素占主轴尺寸按照权重进行分配
    }
    .width('100%')
    .height('100%')
  }

  @Builder
  listItemBuild(item: ListItem) {
    ListItem() {
      Button({ type: ButtonType.Normal, buttonStyle: ButtonStyleMode.TEXTUAL }) {
        Row() {
          Image(item.icon)
            .width(this.iconSize)
            .height(this.iconSize)
            .margin({ right: 10, left: 10 })
            .fillColor(this.primary)
          Column() {
            if (item.title) {
              Text(item.title)
                .fontSize(this.fontSize)
                .fontColor(this.fontColor)
            }
            if (item.subTitle) {
              Text(item.subTitle)
                .fontSize(this.fontSm)
                .fontColor(this.secondFontColor)
            }
          }
          .justifyContent(FlexAlign.SpaceEvenly)
          .alignItems(HorizontalAlign.Start)
          .constraintSize({ minHeight: this.itemHeight })
        }
        .width('100%')
        .justifyContent(FlexAlign.Start)
        .alignItems(VerticalAlign.Center)
      }
      .width('100%')
      .height('auto')
    }
  }

  @Builder
  listHeaderBuild(name: string) {
    if (name) {
      Text(name)
        .fontSize(this.fontSm)
        .fontColor(this.primary)
        .padding(10)
        .width('100%')
    }
  }
}