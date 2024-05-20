import router from '@ohos.router';
import { Constants } from '../../common/Constants';

/**
 * 闪屏页
 */
@Entry
@Component
struct Splash {
  @State timeId: number = 0;
  @State image: string = '/assets/image/splash.png'

  build() {
    Column() {
      Image(this.image)
        .width("80%")
        .height("80%")
        .objectFit(ImageFit.Contain)
      Image($r('app.media.youmi'))
        .height(100)
        .objectFit(ImageFit.ScaleDown)
        .scale({ x: 0.9, y: 0.9 })
        .markAnchor({ x: '50%', y: '120%' })
        .position({ x: '50%', y: '100%' })
    }
    .width("100%")
    .height("100%")
    .justifyContent(FlexAlign.Center)
    .alignItems(HorizontalAlign.Center)
  }

  onPageShow(): void {
    this.timeId = setTimeout(() => {
      router.replaceUrl({
        url: Constants.pageIndex,
      });
    }, Constants.splashTime);
  }

  onPageHide() {
    clearTimeout(this.timeId);
    this.timeId = 0;
  }
}