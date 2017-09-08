package com.kh.web.service.member;

import java.util.List;

import com.kh.web.model.member.dto.MemberVO;
import com.kh.web.model.member.dto.MypageCalVO;
import com.kh.web.model.member.dto.MypageVO;
import com.kh.web.model.travel.dto.PlanMainVO;

public interface MypageService {
	// ������������ �����س��� �����ฮ��Ʈ ����
	public List<MypageVO> selectAllTravel(String id);

	public List<PlanMainVO> selectAllTravelname(String id);

	public List<MypageCalVO> selectAllCal(String id, String travel_name);

	// ���������� �����߰�
	public void insertTravel(String id, String travel_name);

	public void deleteTravel(String id, String travel_name);

	// ����������->�÷��ʿ��� �����س��� ������ ����
	public List<MypageVO> selectAllAlbum(String id, String travel_name);

	// ������������ �ٹ��� ���� �ֱ�
	public void insertAlbum(MypageVO mVo);

	public void deleteAlbum(String albumpath);

	// chart ��������
	public MypageVO getChart(String id, String travel_name);

	// ��Ʈ �Է�
	public void insertChart(MypageVO mVo);

	// ��Ʈ ������Ʈ
	public void updateChart(MypageVO mVo);

	public MemberVO getMember(String id);

	public void updateMember(MemberVO mmVo);
}
