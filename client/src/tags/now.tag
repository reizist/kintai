<now>
    <h3>{ time }</h3>
       var self = this

       this.tick = function () {
         self.update({ time: formatted_time() })
       }

       var timer = setInterval(this.tick, 1000)

       this.on('unmount', function () {
         clearInterval(timer)
       })

       function formatted_time() {
           var now = new Date();
           // 「年」「月」「日」「曜日」を Date オブジェクトから取り出してそれぞれに代入
           var y   = now.getFullYear();
           var m   = now.getMonth() + 1;
           var d   = now.getDate();
           var w   = now.getDay();
           var h   = now.getHours();
           var min = now.getMinutes();
           var s   = now.getSeconds();

           // 曜日の表記を文字列の配列で指定
           var wNames = ['日', '月', '火', '水', '木', '金', '土'];

           // 「月」と「日」で1桁だったときに頭に 0 をつける
           if (m < 10) {
             m = '0' + m;
           }
           if (d < 10) {
             d = '0' + d;
           }
           if (h < 10) {
             h = '0' + h;
           }

           if (min < 10) {
             min = '0' + min;
           }
           if (s < 10) {
             s = '0' + s;
           }

           return y + "年" + m + "月" + d + "日(" + wNames[w] + ") " + h + ":" + min + ":" + s
       }
</now>
