package com.cps.service;

import com.cps.pojo.CourseGrade;

public interface CourseGradeService {

    CourseGrade findScoreByOidAndSid(int oid, int sid);

    int saveCourseGrade(CourseGrade courseGrade);
}
