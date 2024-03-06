import router from '@ohos.router';


@Entry
@Component
struct WelcomePage {
  //跳转倒计时
  @State number : number = 5

  /**
   * 开启定时器 倒计时结束启动页面
   */
  aboutToAppear()
  {
    var intervalId = setInterval(() => {
      if (this.number == 0) {
        clearInterval(intervalId)
        // this.onStartLoginHome()
        return
      }else {
        this.number--;
      }
    },1000)
  }

  /**
   * 启动登录页面
   */
  onStartLoginHome()
  {

    // router.pushUrl({ url : 'pages/LoginPage' }) //启动新页面
    router.replaceUrl({ url : 'pages/LoginPage' }) //启动新页面 并销毁当前页面
  }


  build() {
      Stack({
        alignContent : Alignment.TopEnd
      }) {
        Image($r('app.media.page_welcome_bg'))
          .width('100%')
          .height('100%')

        Text((this.number == 0) ? ' 跳过 ' : '倒计时：' + this.number)
          .padding({
            top : 10,
            bottom : 10,
            left : 15,
            right : 15
          })
          .margin({
            top : 20,
            right : 20
          })
          .borderRadius(10)
          .backgroundColor('#80377DFF')
          .fontColor('#ffffff')
          .onClick(() => {
            if (this.number == 0) {
              this.onStartLoginHome()
            }
          })
      }
      .width('100%')
      .height('100%')
  }
}
