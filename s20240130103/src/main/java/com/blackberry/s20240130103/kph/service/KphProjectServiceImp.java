package com.blackberry.s20240130103.kph.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.blackberry.s20240130103.kph.dao.KphProjectDao;
import com.blackberry.s20240130103.kph.model.KphProject;
import com.blackberry.s20240130103.kph.model.KphTask;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class KphProjectServiceImp implements KphProjectService {

	private final KphProjectDao kphProjectDao;

	@Override
	public int projectAdd(KphProject project) {
		System.out.println("KphProjectServiceImp projectAdd start...");
		int result = kphProjectDao.projectAdd(project);
		System.out.println("KphProjectServiceImp projectAdd result => " + result);
		return result;
	}


	@Override
	public List<KphProject> projectList(int user_no) {
		System.out.println("KphProjectServiceImp projectList start...");
		List<KphProject> projectList = kphProjectDao.projectList(user_no);
		System.out.println("KphProjectServiceImp projectList projectList.size=>" + projectList.size());
		return projectList;
	}


	@Override
	public List<KphTask> unCompTaskListByProjectNo(int project_no) {
		List<KphTask> upCompTaskList = kphProjectDao.unCompTaskListByProjectNo(project_no);
		return upCompTaskList;
	}


	@Override
	public List<KphTask> compTaskListByProjectNo(int project_no) {
		List<KphTask> CompTaskList = kphProjectDao.compTaskListByProjectNo(project_no);
		return CompTaskList;
	}
	
}