package com.iu.s1.board.notice;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.iu.s1.board.BoardDTO;
import com.iu.s1.board.qna.QnaService;
import com.iu.s1.util.FileDown;
import com.iu.s1.util.Pager;

@Controller
@RequestMapping("notice/*")
public class NoticeController {

	@Autowired
	private NoticeService noticeService;
	
	@ModelAttribute("board")
	public String board() {
		return "notice";
	}
	
	@RequestMapping(value = "fileDown", method = RequestMethod.GET)
	public ModelAndView fileDown(NoticeFileDTO noticeFileDTO) throws Exception {
		ModelAndView mv = new ModelAndView();
		noticeFileDTO = noticeService.detailFile(noticeFileDTO);
		
		mv.setViewName("fileDown");
		mv.addObject("file", noticeFileDTO);
		
		return mv;
	}
	
	// list
	@RequestMapping(value = "list", method = RequestMethod.GET)
	public ModelAndView list(Pager pager) throws Exception {
		ModelAndView mv = new ModelAndView();
		List<BoardDTO> ar = noticeService.list(pager);
		
		mv.addObject("list", ar);
		mv.setViewName("board/list");
		
		return mv;
	}
		
	// detail
	@RequestMapping(value = "detail", method = RequestMethod.GET)
	public String detail(NoticeDTO noticeDTO, Model model) throws Exception {
		BoardDTO boardDTO = noticeService.detail(noticeDTO);
		model.addAttribute("dto", boardDTO);
		
		return "board/detail";
	}
	
	// add form 이동
	@RequestMapping(value = "add", method = RequestMethod.GET)
	public String add() throws Exception {
		
		return "board/add";
	}
	
	// add post
	@RequestMapping(value = "add", method = RequestMethod.POST)
	public String add(NoticeDTO noticeDTO, MultipartFile[] files) throws Exception {
		int result = noticeService.add(noticeDTO, files);
		
		return "redirect:./list";
	}
	
	// update get
	@RequestMapping(value = "update", method = RequestMethod.GET)
	public String update(NoticeDTO noticeDTO, Model model) throws Exception {
		
		BoardDTO boardDTO = noticeService.detail(noticeDTO);
		model.addAttribute("dto", boardDTO);
		
		return "board/update";
	}
	
	// update post
	@RequestMapping(value = "update", method = RequestMethod.POST)
	public String update(NoticeDTO noticeDTO) throws Exception {
		
		int result = noticeService.update(noticeDTO);
		
		return "redirect:./list";
	}
	
	// delete
	@RequestMapping(value = "delete", method = RequestMethod.GET)
	public String delete(NoticeDTO noticeDTO) throws Exception {
		
		int result = noticeService.delete(noticeDTO);
		
		return "redirect:./list";
	}
}
