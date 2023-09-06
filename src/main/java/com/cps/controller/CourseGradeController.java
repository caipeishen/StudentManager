package com.cps.controller;

import com.cps.pojo.CourseGrade;
import com.cps.service.CourseGradeService;
import com.cps.utils.JsonUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.math.BigDecimal;
import java.util.Map;

@RestController
@RequestMapping("/courseGrade")
public class CourseGradeController {

    @Autowired
    CourseGradeService service;

    /**
     * 保存分数
     * @param json [{sid:score},...]
     * @param oid 开课id
     * @return 成功的数量
     */
    @RequestMapping({"saveScore.do", "teacher/saveScore.do"})
    public Integer saveScore(String json, Integer oid){
        Map<Integer, BigDecimal> paramMap = JsonUtil.parseMap(json,Integer.class,BigDecimal.class);
        //sid:score
        int res = 0;
        for(Map.Entry<Integer,BigDecimal> entry : paramMap.entrySet()) {
            Integer sid = entry.getKey();
            BigDecimal score = entry.getValue();

            if(score == null) continue;

            res += service.saveCourseGrade(new CourseGrade(null,oid,sid,score));
        }
        return res;
    }
}
