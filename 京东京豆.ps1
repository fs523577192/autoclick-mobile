# 请先手动打开“领京豆”页面
cd D:\adb
.\adb devices

.\adb shell input tap 480 615
echo 进店领豆
Start-Sleep -Seconds 15

#.\adb shell input tap 900 620
# 第一个店
#.\adb shell input tap 900 1220
# 第二个店
function enterAndGet {
    .\adb shell screencap -p /storage/self/primary/DCIM/Screenshots/adb_cap.png
    .\adb pull /storage/self/primary/DCIM/Screenshots/adb_cap.png
    $private:result=java -cp F:\java\screenShotAnalyzer\out\production\screenShotAnalyzer\ org.firas.tool.ssa.Main  match  D:\adb\adb_cap.png  D:\adb\jd_enter.png 791 568 | findstr Matched
    if ( "$private:result" -ne "" ) {
        $private:result = "$private:result".Split(" ")
        $private:x = [int]$private:result[1] + 108
        $private:y = [int]$private:result[2] + 43
        .\adb shell input tap $private:x $private:y
        echo 进店领豆
        
        Start-Sleep -Seconds 15
        .\adb shell input keyevent 4
        echo 返回
        Start-Sleep -Seconds 5
    }
}
enterAndGet
enterAndGet
.\adb shell input keyevent 4
echo 返回
Start-Sleep -Seconds 5

.\adb shell input tap 540 400
echo 签到
Start-Sleep -Seconds 15
.\adb shell input keyevent 4
echo 返回
Start-Sleep -Seconds 5

.\adb shell input tap 1000 326
echo 种豆得豆
Start-Sleep -Seconds 15

.\adb shell input tap 872 462
echo 免费水果
Start-Sleep -Seconds 15
.\adb shell input tap 125 1633
echo 每日签到
Start-Sleep -Seconds 5
.\adb shell input tap 543 1342
echo 签到
Start-Sleep -Seconds 5
.\adb shell input tap 551 1370
echo 我知道了
Start-Sleep -Seconds 5
for ($i = 0; $i -lt 10; $i += 1) {
    .\adb shell input tap 908 1651
    echo 浇水
    Start-Sleep -Seconds 10
}
.\adb shell input keyevent 4
echo 返回
Start-Sleep -Seconds 5

.\adb shell input tap 360 1680
echo 关注任务
Start-Sleep -Seconds 5
.\adb shell input tap 440 1390
echo 关注商品
Start-Sleep -Seconds 10

function tapHeart {
    .\adb shell screencap -p /storage/self/primary/DCIM/Screenshots/adb_cap.png
    .\adb pull /storage/self/primary/DCIM/Screenshots/adb_cap.png
    $private:result=java -cp F:\java\screenShotAnalyzer\out\production\screenShotAnalyzer\ org.firas.tool.ssa.Main  match  D:\adb\adb_cap.png  D:\adb\jd_heart.png 920 1194 | findstr Matched
    if ( "$private:result" -ne "" ) {
        $private:result = "$private:result".Split(" ")
        $private:x = [int]$private:result[1] + 40
        $private:y = [int]$private:result[2] + 40
        .\adb shell input tap $private:x $private:y
        echo 取消关注
    }
}

for ($i = 0; $i -lt 6; $i += 1) {
    .\adb shell input tap 830 1490
    echo 关注商品
    Start-Sleep -Seconds 10
    tapHeart
    Start-Sleep -Seconds 5
    .\adb shell input keyevent 4
    echo 返回
    Start-Sleep -Seconds 2
    .\adb shell input swipe 830 1490 240 1490 500
    echo 右划
    Start-Sleep -Seconds 2
}
.\adb shell input keyevent 4
echo 返回
Start-Sleep -Seconds 5

.\adb shell input tap 738 1678
echo 逛逛会场
Start-Sleep -Seconds 5
.\adb shell screencap -p /storage/self/primary/DCIM/Screenshots/adb_cap.png
.\adb pull /storage/self/primary/DCIM/Screenshots/adb_cap.png
$private:result=java -cp F:\java\screenShotAnalyzer\out\production\screenShotAnalyzer\ org.firas.tool.ssa.Main  match  D:\adb\adb_cap.png  D:\adb\jd_walk.png 129 1035 | findstr Matched
if ( "$private:result" -ne "" ) {
    $private:result = "$private:result".Split(" ")
    $private:x = [int]$private:result[1] + 84
    $private:y = [int]$private:result[2] + 28
    .\adb shell input tap $private:x $private:y
}
.\adb shell input keyevent 4
echo 返回
Start-Sleep -Seconds 5

.\adb shell input tap 360 1680
echo 关注任务
Start-Sleep -Seconds 5
.\adb shell input tap 236 1390
echo 关注店铺
Start-Sleep -Seconds 15

$script:bottleCount=4
function gotBottle {
    .\adb shell screencap -p /storage/self/primary/DCIM/Screenshots/adb_cap.png
    .\adb pull /storage/self/primary/DCIM/Screenshots/adb_cap.png
    $private:result=java -cp F:\java\screenShotAnalyzer\out\production\screenShotAnalyzer\ org.firas.tool.ssa.Main  match  D:\adb\adb_cap.png  D:\adb\jd_got_bottle.png 341 704 | findstr Matched
    if ( "$private:result" -ne "" ) {
        echo 找到营养液
        $script:bottleCount-=1
    }
}
function tapStore {
    .\adb shell screencap -p /storage/self/primary/DCIM/Screenshots/adb_cap.png
    .\adb pull /storage/self/primary/DCIM/Screenshots/adb_cap.png
    $private:result=java -cp F:\java\screenShotAnalyzer\out\production\screenShotAnalyzer\ org.firas.tool.ssa.Main  match  D:\adb\adb_cap.png  D:\adb\jd_enter_favor.png 100 679 | findstr Matched
    echo $private:result
    if ( "$private:result" -ne "" ) {
        $private:result = "$private:result".Split(" ")
        $private:x = [int]$private:result[1] + 102
        $private:y = [int]$private:result[2] + 37
        .\adb shell input tap $private:x $private:y
        echo 进店并关注
    } else {
        $script:bottleCount=0
        echo 无法进店
    }
}
while ($script:bottleCount -gt 0) {
    tapStore
    if ($script:bottleCount -le 0) {
        break
    }
    Start-Sleep -Seconds 15
    gotBottle
    .\adb shell input tap 1006 146
    Start-Sleep -Seconds 2
    .\adb shell input tap 960 293
    echo 取消关注
    Start-Sleep -Seconds 5
    .\adb shell input keyevent 4
    echo 返回
    Start-Sleep -Seconds 5
}
#for ($i = 0; $i -lt 3; $i += 1) {
#    $x = 206 + $i * 336
#    .\adb shell input tap $x 720
#    # 关注店铺
#    Start-Sleep -Seconds 15
#    .\adb shell input tap 1006 146
#    Start-Sleep -Seconds 2
#    .\adb shell input tap 960 293
#    # 取消关注
#    Start-Sleep -Seconds 5
#    .\adb shell input keyevent 4
#    # 返回
#    Start-Sleep -Seconds 5
#
#    .\adb shell input tap $x 1078
#    # 关注店铺
#    Start-Sleep -Seconds 15
#    .\adb shell input tap 1006 146
#    Start-Sleep -Seconds 2
#    .\adb shell input tap 960 293
#    # 取消关注
#    Start-Sleep -Seconds 5
#    .\adb shell input keyevent 4
#    # 返回
#    Start-Sleep -Seconds 5
#}
# 返回
.\adb shell input keyevent 4
Start-Sleep -Seconds 5

.\adb shell input tap 562 1468
echo 浇培养液
Start-Sleep -Seconds 5