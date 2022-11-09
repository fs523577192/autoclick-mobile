cd D:\adb
.\adb devices

function goBack {
    .\adb shell input keyevent 4
    echo 返回
    Start-Sleep -Seconds 2
}
function swipe {
    Start-Sleep -Seconds 1
    .\adb shell input swipe 536 1600 543 1400 500
}

$private:guangHaoHuo=1
$private:guangHaoWu=1
for ($private:i = 0; $private:i -lt 7; $private:i += 1) {
    .\adb shell screencap -p /storage/self/primary/Pictures/Screenshots/adb_cap.png
    .\adb pull /storage/self/primary/Pictures/Screenshots/adb_cap.png
    if ( $private:guangHaoHuo ) {
        #$private:result=java -cp F:\java\screenShotAnalyzer\out\production\screenShotAnalyzer\ org.firas.tool.ssa.Main  match  D:\adb\adb_cap.png  D:\adb\BaBaNongChang\GuangHaoHuo.png 221 881 741 2190 | findstr Matched
        $private:result=java -cp F:\java\screenShotAnalyzer\out\production\screenShotAnalyzer\ org.firas.tool.ssa.Main  match  D:\adb\adb_cap.png  D:\adb\BaBaNongChang\Jingxuan.png 221 881 741 2190 | findstr Matched
        echo $private:result
        if ( "$private:result" -ne "" ) {
            $private:result = "$private:result".Split(" ")
            #$private:x = [int]$private:result[1] + 700
            $private:x = [int]$private:result[1] + 600
            $private:y = [int]$private:result[2] + 50
            .\adb shell input tap $private:x $private:y
            echo 逛精选好货
            swipe
            Start-Sleep -Seconds 17
            goBack
            continue
        }
    }
    
    $private:guangHaoHuo=0
    if ( $private:guangHaoWu ) {
        #$private:result=java -cp F:\java\screenShotAnalyzer\out\production\screenShotAnalyzer\ org.firas.tool.ssa.Main  match  D:\adb\adb_cap.png  D:\adb\BaBaNongChang\GuangHaoWu.png 221 881 741 2190 | findstr Matched
        $private:result=java -cp F:\java\screenShotAnalyzer\out\production\screenShotAnalyzer\ org.firas.tool.ssa.Main  match  D:\adb\adb_cap.png  D:\adb\BaBaNongChang\Special_Jingxuan.png 221 881 741 2190 | findstr Matched
        echo $private:result
        if ( "$private:result" -ne "" ) {
            $private:result = "$private:result".Split(" ")
            #$private:x = [int]$private:result[1] + 700
            $private:x = [int]$private:result[1] + 600
            $private:y = [int]$private:result[2] + 50
            .\adb shell input tap $private:x $private:y
            echo 逛精选商品
            swipe
            Start-Sleep -Seconds 17
            goBack
            continue
        }
    }

    $private:guangHaoWu=0
    $private:result=java -cp F:\java\screenShotAnalyzer\out\production\screenShotAnalyzer\ org.firas.tool.ssa.Main  match  D:\adb\adb_cap.png  D:\adb\BaBaNongChang\GuangShangPin.png 221 881 741 2190 | findstr Matched
    echo $private:result
    if ( "$private:result" -ne "" ) {
        $private:result = "$private:result".Split(" ")
        $private:x = [int]$private:result[1] + 700
        $private:y = [int]$private:result[2] + 50
        .\adb shell input tap $private:x $private:y
        echo 逛精选商品
        swipe
        Start-Sleep -Seconds 17
        goBack
        continue
    }
    
    $private:result=java -cp F:\java\screenShotAnalyzer\out\production\screenShotAnalyzer\ org.firas.tool.ssa.Main  match  D:\adb\adb_cap.png  D:\adb\BaBaNongChang\YiMei.png 221 881 741 2190 | findstr Matched
    echo $private:result
    if ( "$private:result" -ne "" ) {
        $private:result = "$private:result".Split(" ")
        $private:x = [int]$private:result[1] + 700
        $private:y = [int]$private:result[2] + 50
        .\adb shell input tap $private:x $private:y
        echo 逛医美
        swipe
        Start-Sleep -Seconds 17
        goBack
        continue
    }
    
    #$private:result=java -cp F:\java\screenShotAnalyzer\out\production\screenShotAnalyzer\ org.firas.tool.ssa.Main  match  D:\adb\adb_cap.png  D:\adb\BaBaNongChang\LingXianJin.png 221 881 741 2190 | findstr Matched
    #echo $private:result
    if ( 1 -ne 1 -and "$private:result" -ne "" ) {
        $private:result = "$private:result".Split(" ")
        $private:x = [int]$private:result[1] + 700
        $private:y = [int]$private:result[2] + 50
        .\adb shell input tap $private:x $private:y
        echo 浏览领现金
        Start-Sleep -Seconds 2
        .\adb shell input tap 1000 574
        Start-Sleep -Seconds 17
        goBack
        #goBack
        continue
    }
    
    #$private:result=java -cp F:\java\screenShotAnalyzer\out\production\screenShotAnalyzer\ org.firas.tool.ssa.Main  match  D:\adb\adb_cap.png  D:\adb\BaBaNongChang\FanHongBao.png 221 881 741 2190 | findstr Matched
    #echo $private:result
    if ( 1 -ne 1 -and "$private:result" -ne "" ) {
        $private:result = "$private:result".Split(" ")
        $private:x = [int]$private:result[1] + 700
        $private:y = [int]$private:result[2] + 50
        .\adb shell input tap $private:x $private:y
        echo 逛逛返红包
        Start-Sleep -Seconds 2
        .\adb shell input tap 1000 574
        Start-Sleep -Seconds 17
        goBack
        #goBack
        continue
    }
    
    $private:result=java -cp F:\java\screenShotAnalyzer\out\production\screenShotAnalyzer\ org.firas.tool.ssa.Main  match  D:\adb\adb_cap.png  D:\adb\BaBaNongChang\DuanShiPin.png 221 881 741 2190 | findstr Matched
    echo $private:result
    if ( "$private:result" -ne "" ) {
        $private:result = "$private:result".Split(" ")
        $private:x = [int]$private:result[1] + 700
        $private:y = [int]$private:result[2] + 50
        .\adb shell input tap $private:x $private:y
        echo 浏览短视频
        Start-Sleep -Seconds 18
        goBack
        continue
    }

    break
}