import router from '@ohos.router';
import { Constants } from '../../common/Constants';

/**
 * 闪屏页
 */
@Entry
@Component
struct Splash {
  @State timeId: number = 0;

  build() {
    Column() {
      Stack({ alignContent: Alignment.Bottom }) {
        Image($r('app.media.splash'))
          .width("100%")
          .height("100%")
          .objectFit(ImageFit.Contain)
        Image($r('app.media.youmi'))//.width("200vp")
          .height(100)
          .objectFit(ImageFit.ScaleDown)
          .scale({ x: 0.9, y: 0.9 })
      }
      .width("100%")
      .height("100%")
    }
    .width("100%")
    .height("100%")
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