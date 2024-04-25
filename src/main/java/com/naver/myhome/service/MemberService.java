package com.naver.myhome.service;

import java.util.List;

import com.naver.myhome.domain.Member;

public interface MemberService {

	public int isId(String id, String password);
	
	public int insert(Member m);
	
	public int isId(String id);
	
	public Member member_info(String id);
	
	public void delete(String id);
	
	public int update(Member m);
	
	public List<Member> getSearchList(int index, String search_word, int page, int limit);
	
	public int getSearchListCount(int index, String search_word);
}
