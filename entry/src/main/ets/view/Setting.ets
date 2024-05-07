import { ListGroupItem, ListItem } from '../../entity/component/common'
import { OperationType, SubHeader } from '@ohos.arkui.advanced.SubHeader';
import promptAction from '@ohos.promptAction';

@Preview
@Component
export struct SettingView {
  @State listItems: ListGroupItem[] = [
    {
      items: [
        {
          icon: $r('app.media.search'),
          title: '源管理',
          subTitle: '新建，导入，编辑或管理源',
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
  private _background: ResourceColor = $r('app.color.background');
  private _on_background: ResourceColor = $r('app.color.on_background');

  build() {
    Column() {
      SubHeader({
        primaryTitle: '我的',
        operationType: OperationType.ICON_GROUP,
        operationItem: [
          {
            value: $r('app.media.help'),
            action: () => {
              promptAction.showToast({ message: 'demo' })
            }
          }
        ]
      }).backgroundColor(this._background)
        .shadow({ radius: 20, color: this._on_background, offsetY: 5 })
        .zIndex(2)

      List({ space: 10, initialIndex: 0 }) {
        ForEach(this.listItems, (item: ListGroupItem) => {
          ListItemGroup({ header: this.listHeaderBuild(item.name) }) {
            ForEach(item.items, (item: ListItem) => {
              ListItem() {
                Button({ type: ButtonType.Normal, stateEffect: true, buttonStyle: ButtonStyleMode.NORMAL }) {
                  Row() {
                    if (item.icon) {
                      Image(item.icon)
                        .width(24)
                        .height(24)
                        .margin({ right: 10, left: 10 })
                    }
                    Column() {
                      if (item.title) {
                        Text(item.title).fontSize(16)
                      }
                      if (item.subTitle) {
                        Text(item.subTitle).fontSize(13)
                      }
                    }
                    .height('100%')
                    .justifyContent(FlexAlign.SpaceEvenly)
                    .alignItems(HorizontalAlign.Start)
                  }
                  .height(65)
                  .width('100%')
                  .justifyContent(FlexAlign.Start)
                  .alignItems(VerticalAlign.Center)
                }
                .width('100%')
                .height('auto')
                .backgroundColor(this._background)
              }
            })
          }
        })
      }
      .width('100%')
      .height('auto')
      .listDirection(Axis.Vertical) // 排列方向
      .scrollBar(BarState.Off) // 关闭滚动条
      .edgeEffect(EdgeEffect.Spring) // 边缘效果设置为Spring
      .sticky(StickyStyle.None) // 设置ListItemGroup中header和footer是否要吸顶或吸底
      .enableScrollInteraction(true) // 设置是否支持滚动手势
      .edgeEffect(EdgeEffect.Fade) // 设置List组件的边缘滑动效果，支持弹簧效果和阴影效果
    }
    .width('100%')
    .height('100%')
    .backgroundColor(this._on_background)
  }

  @Builder
  listHeaderBuild(name: string) {
    if (name) {
      Text(name)
        .fontSize(13)
        .padding(10)
        .width('100%')
        .backgroundColor(this._background)
    }
  }
}