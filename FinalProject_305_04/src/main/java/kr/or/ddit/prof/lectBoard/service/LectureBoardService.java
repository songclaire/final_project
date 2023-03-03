package kr.or.ddit.prof.lectBoard.service;

import java.util.Map;

import kr.or.ddit.vo.AttaFileVO;
import kr.or.ddit.vo.LectBoardVO;
import kr.or.ddit.vo.LectureVO;
import kr.or.ddit.vo.PagingVO;

public interface LectureBoardService {
	
	/**
	 * 강의 정보 조회
	 * @param lectId
	 * @return
	 */
	public LectureVO retrieveLectInfo(String lectId);
	/**
	 * 게시판 목록 조회
	 * @param pagingVO
	 */
	public void retrieveLectBoardList(PagingVO<LectBoardVO> pagingVO);
	/**
	 * 게시글 조회
	 * @param lectBoardId
	 * @return
	 */
	public LectBoardVO retrieveLectBoard(String lectBoardId);
	/**
	 * 게시글 등록
	 * @param lectBoard
	 * @return
	 */
	public int createLectBoard(LectBoardVO lectBoard);
	/**
	 * 게시글 수정
	 * @param lectBoard
	 * @return
	 */
	public int modifyLectBoard(LectBoardVO lectBoard);
	/**
	 * 게시글 삭제
	 * @param lectBoardId
	 * @return
	 */
	public int removeLectBoard(String lectBoardId);
	
	/**
	 * 파일 삭제
	 * @param notiId
	 * @return
	 */
	public int deleteAttaFileList(AttaFileVO attaFileVO);
	
	/**
	 * 파일 다운로드
	 * @param attaFileVO
	 * @return
	 */
	public Map<String, Object> downloadFile(Map<String, Object> map);
}
