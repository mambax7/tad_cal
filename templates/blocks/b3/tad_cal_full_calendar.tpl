
<{$block.jquery_path}>

<link rel="stylesheet" type="text/css" href="<{$xoops_url}>/modules/tad_cal/module.css">
<link rel="stylesheet" type="text/css" href="<{$xoops_url}>/modules/tadtools/fullcalendar/redmond/theme.css">
<link rel="stylesheet" type="text/css" href="<{$xoops_url}>/modules/tadtools/fullcalendar/fullcalendar.css">

<script src="<{$xoops_url}>/modules/tadtools/moment/moment-with-locales.min.js" type="text/javascript"></script>
<script src="<{$xoops_url}>/modules/tad_cal/class/jquery-impromptu.6.2.3.min.js" type="text/javascript"></script>
<script src="<{$xoops_url}>/modules/tadtools/fullcalendar/fullcalendar.js" type="text/javascript"></script>
<script src="<{$xoops_url}>/modules/tadtools/fullcalendar/gcal.js" type="text/javascript" ></script>

<link rel="stylesheet" type="text/css" href="<{$xoops_url}>/modules/tadtools/jquery.qtip_2/jquery.qtip.min.css">
<script src="<{$xoops_url}>/modules/tadtools/jquery.qtip_2/jquery.qtip.min.js" type="text/javascript"></script>


<script type="text/javascript">
$(document).ready(function(){
  var calendar = $("#full_calendar_block").fullCalendar({
    theme: true,
    locale: navigator.language,
    firstDay:<{$block.firstDay}>,
    locale: window.navigator.userLanguage || window.navigator.language,
    buttonText:{today:"<{$smarty.const._MB_TADCAL_TODAY}>"},
    header: {
      left: "prev,today,next",
      center: "",
      right: "title"
    },
    <{$block.eventAdd}>
    <{$block.eventDrop}>
    events: function(start, end, timezone ,callback) {
      $.getJSON("<{$xoops_url}>/modules/tad_cal/get_event.php",
      {
        start: start.format(),
        end: end.format(),
        cate_sn: <{$block.cate_sn}>
      },
      function(result) {
        callback(result);
      });
    },
      <{$block.eventShowMode}>: function(event) {
        if (event.rel) {
          $(this).qtip({
           content: {
            // 設定載入中圖片
            text: "<img class='throbber' src='<{$xoops_url}>/modules/tad_cal/images/loading.gif' alt='Loading...' />",
            ajax: {
              url: event.rel //載入指定之連結
            },
            title: {
             text: event.title, //給予標題文字
             button: true
            }
           },
           position: {
              at: "top center", // 提示位置
              my: "bottom center",
              viewport: $(window), //確保提示在畫面上
              effect: false, // 取消動畫
              adjust: {
               target: $(document),
               resize: true // Can be ommited (e.g. default behaviour)
              }
           },
           show: {
            event: "false",
            ready: true, // ... but show the tooltip when ready
            solo: true // 一次只秀出一個提示
           },
           hide: "unfocus",
           style: {
            classes: "ui-tooltip-shadow ui-tooltip-rounded"
           }
          })
          return false;
        }
    }
  });
});


function delete_tad_cal_event_func(sn){
  var sure = window.confirm("<{$smarty.const._TAD_DEL_CONFIRM}>");
  if (!sure)  return;
  location.href="<{$xoops_url}>/modules/tad_cal/index.php?op=delete_tad_cal_event&sn=" + sn;
}
</script>

<div id="full_calendar_block" style="margin-top:20px;"></div>
<div style="margin:10px auto;width:auto;"><{$block.style_mark}></div>

<div style="text-align:right;">
  <a href="<{$xoops_url}>/modules/tad_cal" class="label label-info"><{$smarty.const._MB_TADCAL_TO_INDEX}></a>
</div>
<{$block.my_counter}>