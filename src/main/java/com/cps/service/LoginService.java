package com.cps.service;

import com.cps.pojo.Student;
import com.cps.pojo.Teacher;
import com.cps.pojo.Manager;

public interface LoginService {
    Manager managerLogin(String username, String password);

    Teacher teacherLogin(String username, String password);

    Student studentLogin(String username, String password);

    void setManagerPassword(Manager manager, String password);

    void setTeacherPassword(Teacher loginTeacher, String password);

    void setStudentPassword(Student loginStudent, String password);
}
