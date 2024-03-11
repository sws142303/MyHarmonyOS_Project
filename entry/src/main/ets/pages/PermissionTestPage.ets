import abilityAccessCtrl, { Permissions } from '@ohos.abilityAccessCtrl'
import bundleManager from '@ohos.bundle.bundleManager';
import common from '@ohos.app.ability.common';

@Entry
@Component
struct PermissionTestPage {
  @State permissionState: string = '未授权'
  cameraPermission : Array<Permissions> = ['ohos.permission.CAMERA']

  aboutToAppear() {
    this.init()
    this.checkPermission(this.cameraPermission[0])
  }

  //当前应用的accessTokenID
  tokenId: number;
  //获取atManager实例
  atManager = abilityAccessCtrl.createAtManager();
  //授权状态 枚举实例
  grantStatus: abilityAccessCtrl.GrantStatus;
  /**
   * 初始化权限相关信息
   */
  async init() {
    try {
      let bundleInfo: bundleManager.BundleInfo = await bundleManager.getBundleInfoForSelf(bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_APPLICATION);
      let appInfo: bundleManager.ApplicationInfo = bundleInfo.appInfo
      this.tokenId = appInfo.accessTokenId
    } catch (error) {
    }
  }

  /**
   * 检查当前权限状态
   */
  async checkPermission(permission: Permissions): Promise<abilityAccessCtrl.GrantStatus> {
    try {
      this.grantStatus = await this.atManager.checkAccessToken(this.tokenId, permission)
    } catch (error) {
    }

    if (this.grantStatus == abilityAccessCtrl.GrantStatus.PERMISSION_GRANTED) {
      this.permissionState = "已授权"
    }else {
      this.permissionState = "未授权"
    }
    return this.grantStatus
  }

  /**
   * 申请权限
   */
  async onRequestPermission(permission : Array<Permissions>){
    //获取上下文
    let context = getContext(this) as common.UIAbilityContext

    this.atManager.requestPermissionsFromUser(context,permission).then((data) => {
      let permissionLength = data.permissions.length
      for (let index = 0; index < permissionLength; index++) {
        let permissionName : string  = data.permissions[index]
        let permissionState : number = data.authResults[0]
        console.log("权限昵称：" + permissionName + "   授权状态：" + (permissionState == abilityAccessCtrl.GrantStatus.PERMISSION_GRANTED) ? '已授权' : '未授权');
      }

      this.checkPermission(this.cameraPermission[0])
    })

  }

  build() {
    Row() {
      Column() {
        Text('相机权限：' + this.permissionState)

        Button('申请权限')
          .visibility((this.permissionState == '已授权') ? Visibility.Hidden : Visibility.Visible)
          .margin(20)
          .onClick(() => {
            this.onRequestPermission(this.cameraPermission)
          })
      }
      .width('100%')
    }
    .height('100%')
  }
}