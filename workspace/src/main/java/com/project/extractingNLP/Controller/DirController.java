package com.project.extractingNLP.Controller;

import java.sql.SQLException;

import org.json.simple.JSONArray;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.project.extractingNLP.Model.Dao.*;



@Controller
public class DirController {
//private static final Logger logger = LoggerFactory.getLogger(DirController.class);
	DirDao dDao = DirDao.getInstance();
	
	@ResponseBody
	@PostMapping("/dir/add/{did}/{pdid}/{dname}/{aid}")
	public boolean addDir(@PathVariable("did") int did, @PathVariable("pdid") int pdid,@PathVariable("dname") String dname, @PathVariable("aid") String aid) throws SQLException {
		System.out.println("@POST: ADD DIR");
		return dDao.addDir(did, pdid, dname, aid);
	}
	
	@ResponseBody
	@PutMapping("/dir/move/{did}/{pdid}")
	public boolean movedir(@PathVariable("did") int did, @PathVariable("pdid") int pdid) throws SQLException {
		System.out.println("did:" + did + " pdid: " + pdid);
		return dDao.moveDir(did, pdid);
	}
	
	@ResponseBody
	//@PostMapping("/dir/delete/{did}")
	@RequestMapping(value="/dir/delete/{did}", method = {RequestMethod.GET, RequestMethod.POST})
	public boolean deletedir(@PathVariable("did") int did) throws SQLException {
		System.out.println("deletedir �޼ҵ�");
		return dDao.deleteDir(did);
	}

	@ResponseBody
	@RequestMapping(value="/dir/get/{aid}/{pdid}", method= {RequestMethod.GET})
	public JSONArray findDirs(@PathVariable("aid") String aid, @PathVariable("pdid") int pdid) throws SQLException {
		System.out.println("aid: " + aid + " pdid: " + pdid );
		JSONArray tmp = dDao.findDirs(aid, pdid);
//		for(int i = 0; i<tmp.size() ; i++) {
//			System.out.println(tmp.get(i));
//		}
		return tmp;
	}
	
	 @ResponseBody
	 @GetMapping("/dir/rename/{did}/{newName}")
	 public boolean renameDir(@PathVariable("did") int did, @PathVariable("newName") String newName) throws SQLException{
		 System.out.println("RENAME FILE!!");
		   
		 return dDao.renameFile(did, newName);
	 }
}
