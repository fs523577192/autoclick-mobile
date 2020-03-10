# 请先手动打开“领水滴”页面
cd D:\adb
.\adb devices

.\adb shell input tap 537 1462
echo 立即签到
Start-Sleep -Seconds 2
.\adb shell input tap 904 477
Start-Sleep -Seconds 2
.\adb shell input tap 967 1099
echo 领水滴
Start-Sleep -Seconds 2

.\adb shell input tap 918 884
echo 签到
Start-Sleep -Seconds 2

.\adb shell input tap 918 1100
echo 逛指定商品
Start-Sleep -Seconds 15
.\adb shell input keyevent 4
echo 返回

.\adb shell input tap 918 1308
echo 逛精选好货
Start-Sleep -Seconds 15
.\adb shell input keyevent 4
echo 返回

.\adb shell input tap 918 1525
echo 逛高抵扣
Start-Sleep -Seconds 15
.\adb shell input keyevent 4
echo 返回

.\adb shell input tap 918 1737
echo 逛福果
Start-Sleep -Seconds 8
.\种福果.ps1