package com.wangpeng.service.impl;

import com.wangpeng.dao.ApprovalDao;
import com.wangpeng.dao.StudentDao;
import com.wangpeng.pojo.Approval;
import com.wangpeng.pojo.Student;
import com.wangpeng.service.ApprovalService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ApprovalServiceImpl implements ApprovalService {

    @Autowired
    ApprovalDao approvalDao;
    @Autowired
    StudentDao studentDao;

    @Override
    public List<Approval> findAllApprovals() {
        return approvalDao.selectApprovals();
    }

    /**
     * 为专业列表添加学生姓名
     * @param approvals
     */
    private void addStudentNameForMajors(List<Approval> approvals) {
        for(Approval approval : approvals) {
            Integer sid = approval.getSid();
            if (sid != null) {
                Student student = studentDao.selectStudent(sid);
                if (student != null) {
                    approval.setSname(student.getSname());
                }
            }
        }
    }

    @Override
    public List<Approval> findApprovalsByPage(int page, int size) {
        int begin = (page - 1) * size;
        List<Approval> approvals = approvalDao.selectApprovalsByLimit(begin, size);
        //添加学生姓名信息
        addStudentNameForMajors(approvals);
        return approvals;
    }

    @Override
    public int getApprovalsCount() {
        return approvalDao.getApprovalsCount();
    }

    @Override
    public int deleteApprovals(List<Approval> approvals) {
        return approvalDao.deleteApprovals(approvals);
    }

    @Override
    public int addApproval(Approval approval) {
        return approvalDao.insertApproval(approval);
    }

    @Override
    public int updateApproval(Approval approval) {
        return approvalDao.updateApproval(approval);
    }

    @Override
    public int getApprovalsCountBySid(Integer sid) {
        return approvalDao.getApprovalsCountBySid(sid);
    }

    @Override
    public List<Approval> findApprovalsByPageBySid(Integer page, Integer size, Integer sid) {
        return approvalDao.selectApprovalsByLimitBySid((page - 1) * size, size, sid);
    }

    @Override
    public int getApprovalsCountByWait() {
        return approvalDao.getApprovalsCountByWait();
    }

    @Override
    public List<Approval> findApprovalsByPageByWait(Integer page, Integer size) {
        int begin = (page - 1) * size;
        List<Approval> approvals = approvalDao.selectApprovalsByLimitByWait(begin, size);
        //添加学生姓名信息
        addStudentNameForMajors(approvals);
        return approvals;
    }

    @Override
    public Integer getApprovalsCountUntreated() {
        return approvalDao.getApprovalsCountUntreated();
    }

}
