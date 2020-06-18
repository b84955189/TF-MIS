/**
 * 菜单
 * @param data 菜单JSON数据
 *        id 菜单唯一ID
 *        name 菜单名称
 *        url 菜单链接地址
 *        icon 图标
 *        pid  父级ID
 *        is_out 是否外链0否|1是,外链a标签没有class='multitabs'
 *        is_home 是否首页
 */
var setSidebar = function(data){
    if (data.length == 0) return false;
    var arrData = (typeof data == 'object') ? data : JSON.parse(data);
    var treeObj = getTrees(arrData, 0, 'id', 'pid', 'children');
    html = createMenu(treeObj, true);
    $('.sidebar-main').append(html);
}

var createMenu = function (data, is_frist) {
    var menu_body = is_frist ? '<ul class="nav nav-drawer">' : '<ul class="nav nav-subnav">';

    for(var i = 0; i < data.length; i++){
        iframe_class = data[i].is_out == 1 ? '' : 'class="multitabs"';
        icon_div     = data[i].pid == 0 ? '<i class="' + data[i].icon + '"></i>' : '';
        selected     = (data[i].pid == 0) && (data[i].is_home == 1) ? 'active' : '';
        menuName     = data[i].pid == 0 ? '<span>' + data[i].name + '</span>' : data[i].name;
        if (data[i].children && data[i].children.length > 0) {
            menu_body += '<li class="nav-item nav-item-has-subnav"><a href="javascript:void(0)">' + icon_div + menuName + '</a>';
            menu_body += createMenu(data[i].children);
        } else {
            menu_body += '<li class="nav-item ' + selected + '"><a href="' + data[i].url + '" '+ iframe_class +'>' + icon_div + menuName + '</a>';
        }
        menu_body += '</li>';
    }

    menu_body += '</ul>';
    return menu_body;
};

/**
 * 树状的算法
 * @params list     代转化数组
 * @params parentId 起始节点
 * @params idName 主键ID名
 * @params parentIdName 父级ID名称
 * @params childrenName 子级名称
 * @author CSDN博主「伤包子」
 */
var getTrees = function (list, parentId, idName, parentIdName, childrenName) {
    let items= {};
    // 获取每个节点的直属子节点，*记住是直属，不是所有子节点
    for (let i = 0; i < list.length; i++) {
        let key = list[i][parentIdName];
        if (items[key]) {
            items[key].push(list[i]);
        } else {
            items[key] = [];
            items[key].push(list[i]);
        }
    }
    return formatTree(items, parentId, idName, childrenName);
}

/**
 * 利用递归格式化每个节点
 */
var formatTree = function (items, parentId, idName, childrenName) {
    let result = [];
    if (!items[parentId]) {
        return result;
    }
    for (let t in items[parentId]) {
        items[parentId][t][childrenName] = formatTree(items, items[parentId][t][idName])
        result.push(items[parentId][t]);
    }
    return result;
}

// 使用
var json_str = JSON.stringify(menu_list);
setSidebar(json_str);