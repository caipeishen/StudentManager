package com.cps.service.impl;

import com.cps.dao.ArrangeCourseDao;
import com.cps.dao.RoomDao;
import com.cps.pojo.ArrangeCourse;
import com.cps.pojo.Room;
import com.cps.service.ArrangeCourseService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ArrangeCourseServiceImpl implements ArrangeCourseService {

    @Autowired
    ArrangeCourseDao arrangeCourseDao;
    @Autowired
    RoomDao roomDao;

    @Override
    public List<ArrangeCourse> findAllArrangeCourses() {
        return arrangeCourseDao.selectArrangeCourses();
    }

    /**
     * 为排课列表添加教室名
     * @param arrangeCourses
     */
    private void addRoomNameForArrangeCourses(List<ArrangeCourse> arrangeCourses) {
        for(ArrangeCourse arrangeCourse : arrangeCourses) {
            int rid = arrangeCourse.getRid();
            Room room = roomDao.selectRoom(rid);
            arrangeCourse.setRname(room.getRname());
        }
    }

    @Override
    public List<ArrangeCourse> findArrangeCoursesByPage(int page, int size) {
        int begin = (page - 1) * size;
        List<ArrangeCourse> arrangeCourses = arrangeCourseDao.selectArrangeCoursesByLimit(begin, size);
        //放入教室名
        addRoomNameForArrangeCourses(arrangeCourses);
        return arrangeCourses;
    }

    @Override
    public int getArrangeCoursesCount() {
        return arrangeCourseDao.getArrangeCoursesCount();
    }

    @Override
    public int deleteArrangeCourses(List<ArrangeCourse> arrangeCourses) {
        return arrangeCourseDao.deleteArrangeCourses(arrangeCourses);
    }

    @Override
    public int addArrangeCourse(ArrangeCourse arrangeCourse) {
        return arrangeCourseDao.insertArrangeCourse(arrangeCourse);
    }

    @Override
    public int updateArrangeCourse(ArrangeCourse arrangeCourse) {
        return arrangeCourseDao.updateArrangeCourse(arrangeCourse);
    }

    @Override
    public List<ArrangeCourse> findArrangeCoursesByPageByOid(int page, int size, int oid) {
        int begin = (page - 1) * size;
        List<ArrangeCourse> arrangeCourses = arrangeCourseDao.selectArrangeCoursesByLimitByOid(begin, size, oid);
        //放入教室名
        addRoomNameForArrangeCourses(arrangeCourses);
        return arrangeCourses;
    }

}
