<?php
//區塊主函式 (小行事曆(tad_cal_calendar))
function tad_cal_calendar($options)
{
    global $xoTheme;
    //引入TadTools的函式庫
    if (!file_exists(XOOPS_ROOT_PATH . "/modules/tadtools/tad_function.php")) {
        redirect_header("http://www.tad0616.net/modules/tad_uploader/index.php?of_cat_sn=50", 3, _TAD_NEED_TADTOOLS);
    }
    include_once XOOPS_ROOT_PATH . "/modules/tadtools/tad_function.php";

    $modhandler        = xoops_getHandler('module');
    $xoopsModule       = $modhandler->getByDirname("tad_cal");
    $config_handler    = xoops_getHandler('config');
    $module_id         = $xoopsModule->getVar('mid');
    $xoopsModuleConfig = $config_handler->getConfigsByCat(0, $module_id);

    get_jquery(true); //一般只要此行即可

    $block['firstDay'] = $xoopsModuleConfig['cal_start'];

    $ver = intval(str_replace('.', '', substr(XOOPS_VERSION, 6, 5)));
    if ($ver >= 259) {
        $xoTheme->addScript('modules/tadtools/jquery/jquery-migrate-3.0.0.min.js');
    } else {
        $xoTheme->addScript('modules/tadtools/jquery/jquery-migrate-1.4.1.min.js');
    }

    $xoTheme->addStylesheet('modules/tad_cal/module.css');
    $xoTheme->addStylesheet('modules/tadtools/fullcalendar/redmond/theme.css');
    $xoTheme->addStylesheet('modules/tadtools/fullcalendar/fullcalendar.css');
    $xoTheme->addStylesheet('modules/tadtools/jquery.qtip_2/jquery.qtip.min.css');

    $xoTheme->addScript('modules/tadtools/moment/moment-with-locales.min.js');
    $xoTheme->addScript('modules/tad_cal/class/jquery-impromptu.6.2.3.min.js');
    $xoTheme->addScript('modules/tadtools/fullcalendar/fullcalendar.js');
    $xoTheme->addScript('modules/tadtools/fullcalendar/gcal.js');
    $xoTheme->addScript('modules/tadtools/jquery.qtip_2/jquery.qtip.min.js');

    return $block;
}
