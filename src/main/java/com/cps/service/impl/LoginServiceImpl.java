package com.cps.service.impl;

import com.cps.dao.ClazzDao;
import com.cps.dao.StudentDao;
import com.cps.dao.TeacherDao;
import com.cps.dao.ManagerDao;
import com.cps.pojo.Clazz;
import com.cps.pojo.Student;
import com.cps.pojo.Teacher;
import com.cps.pojo.Manager;
import com.cps.service.LoginService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.Map;

@Service
public class LoginServiceImpl implements LoginService {

    @Autowired
    ManagerDao managerDao;
    @Autowired
    TeacherDao teacherDao;
    @Autowired
    StudentDao studentDao;
    @Autowired
    ClazzDao clazzDao;

    @Override
    public Manager managerLogin(String username, String password) {
        Map<String,Object> map = new HashMap<>();
        map.put("username",username);
        map.put("password",password);
        return managerDao.checkByUsernameAndPassword(map);
    }

    @Override
    public Teacher teacherLogin(String username, String password) {
        Map<String,Object> map = new HashMap<>();
        map.put("username",username);
        map.put("password",password);
        return teacherDao.checkByUsernameAndPassword(map);
    }

    @Override
    public Student studentLogin(String username, String password) {
        Map<String,Object> map = new HashMap<>();
        map.put("username",username);
        map.put("password",password);
        Student student = studentDao.checkByUsernameAndPassword(map);

        //添加班级名信息
        if(student != null) {
            Integer cid = student.getCid();
            if (cid != null) {
                Clazz clazz = clazzDao.selectClazz(cid);
                if (clazz != null) {
                    student.setCname(clazz.getCname());
                }
            }
        }
        return student;
    }

    @Override
    public void setManagerPassword(Manager manager, String password) {
        manager.setPassword(password);
        managerDao.updateManager(manager);
    }

    @Override
    public void setTeacherPassword(Teacher teacher, String password) {
        teacher.setPswd(password);
        teacherDao.updateTeacher(teacher);
    }

    @Override
    public void setStudentPassword(Student student, String password) {
        student.setPswd(password);
        studentDao.updateStudent(student);
    }
}
