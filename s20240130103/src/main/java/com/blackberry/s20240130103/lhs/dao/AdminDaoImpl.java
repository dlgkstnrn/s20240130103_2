package com.blackberry.s20240130103.lhs.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import lombok.RequiredArgsConstructor;

@Repository
@RequiredArgsConstructor
public class AdminDaoImpl implements AdminDao {
	
	private final SqlSession session;

	@Override
	public Map<String, Long> selectTablesCnt() {
		Map<String, Long> tableCntMap = session.selectOne("LhsAdminCntMapget");
		System.out.println("AdminDaoImpl map size : " + tableCntMap.size());
		int i = 1;
		System.out.println("===AdminDaoImpl selectTablesCnt map values===");
		for(String key : tableCntMap.keySet()) {
			System.out.println("key value" + (i++) +" "+key +" : " + tableCntMap.get(key));
		}
		System.out.println("===AdminDaoImpl selectTablesCnt map end===");
		return tableCntMap;
	}
	
	@Override
	public List<Map<String, Long>> selectUserJoinCnt() {
		List<Map<String, Long>> userJoinCntList = session.selectList("LhsAdminJoinUserCnt5day");
		System.out.println("AdminDaoImpl List size : " + userJoinCntList.size());
		System.out.println("===AdminDaoImpl selectUserJoinCnt List Map values===");
		for(Map<String, Long> map : userJoinCntList) {
			for(String key : map.keySet()) {
				System.out.println("List Map key : " + key + " value : " + map.get(key));
			}
		}
		System.out.println("===AdminDaoImpl selectUserJoinCnt List map end===");
		return userJoinCntList;
	}

}
/*
 * 
쿼리문

 * */