package com.cps.controller;

import com.cps.pojo.Manager;
import com.cps.service.ManagerService;
import com.cps.utils.JsonUtil;
import com.cps.utils.PageResult;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;
import java.util.Map;

@RestController
@RequestMapping("/manager")
public class ManagerController {

    @Autowired
    ManagerService service;

    /**
     * 查询管理员
     * @param page  当前页码
     * @param limit 每页大小
     * @return 管理员信息
     */
    @RequestMapping("queryManagers.do")
    public PageResult queryManagers(Integer page, Integer limit){
        //获取管理员数量
        int count = service.getManagersCount();
        //获取数据
        List<Manager> managers = service.findManagersByPage(page,limit);
        //返回结果
        return PageResult.success(count, managers);
    }

    /**
     * 查询所有管理员
     * @return 管理员信息
     */
    @RequestMapping("queryAllManagers.do")
    public List<Manager> queryAllManagers(){
        return service.findAllManagers();
    }

    /**
     * 删除管理员
     * @param json 管理员对象的json
     * @return 成功行数
     */
    @RequestMapping("deleteManagers.do")
    public Integer deleteManagers(String json){
        if(json.charAt(0) != '[') json = '[' + json + ']';  //如果不是数组形式，变成数组形式
        List<Manager> managers = JsonUtil.parseList(json, Manager.class);
        return service.deleteManagers(managers);
    }

    /**
     * 添加一个管理员
     * @param json 管理员对象的json
     * @return 成功标志1
     */
    @RequestMapping("addManager.do")
    public Integer addManager(String json){
        Manager manager = JsonUtil.parseObject(json, Manager.class);
        return service.addManager(manager);
    }

    /**
     * 修改一个管理员
     * @param json 管理员对象的json
     * @return 成功标志1
     */
    @RequestMapping("updateManager.do")
    public Integer updateManager(String json){
        Manager manager = JsonUtil.parseObject(json, Manager.class);
        return service.updateManager(manager);
    }

    /**
     * 获取管理员总数
     * @return 管理员总数
     */
    @RequestMapping("getAmount.do")
    public Integer getAmount() {
        return service.getManagersCount();
    }

    /**
     * 搜索管理员
     * @param page 当前页码
     * @param limit 每页大小
     * @param json 搜索的参数
     *             {"username":用户名,"name":姓名}
     * @return 管理员信息
     */
    @RequestMapping("searchManagers.do")
    public PageResult searchManagers(Integer page, Integer limit, String json){
        //获得搜索的参数
        Map<String, Object> searchParam = JsonUtil.parseMap(json, String.class, Object.class);
        //获取查询个数
        int count = service.getSearchCount(searchParam);
        //查询数据
        List<Manager> managers = service.searchManagers(page, limit, searchParam);
        //返回结果
        return PageResult.success(count, managers);
    }

}
