package javacode;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import tools.DBUtils;

public class selectsubject {
	public static void main(String[] args) {
		String sql="SELECT lesson.weekdayid AS weekdayid,lesson.classnumber AS classnumber,clazz.clazzname AS clazzname,teacher.teachername AS teachername,subject.subjectname AS subjectname,lesson.clazzid AS clazzid" 
				+" FROM lesson"
				+" JOIN clazz ON lesson.clazzid=clazz.id"
				+" JOIN teacher ON teacher.id=lesson.teacherid"
				+" JOIN SUBJECT ON teacher.subjectid=subject.id"
				+" where teachername='Ù¡ÏæÓñ'";
		List<Map<String, Object>> lessonlist = DBUtils.query(sql);
		Map<String, Object> lessonmap = new HashMap<>();
		for (Map<String, Object> map : lessonlist) {
			int weekdayid = Integer.parseInt(map.get("weekdayid").toString());
			int lessonnumber = Integer.parseInt(map.get("classnumber").toString());
			String tname=map.get("teachername").toString();
			String clazzid=map.get("clazzid").toString();
			String subjectname=map.get("subjectname").toString();
			String sql2="SELECT CONCAT(grade.gradename,clazz.clazzname) AS clazzname FROM clazz JOIN grade ON grade.year=clazz.year WHERE clazz.id="+clazzid+"";
    		List<Map<String, Object>> classlist=DBUtils.query(sql2);
    		String classname=classlist.get(0).get("clazzname").toString();
    		
			lessonmap.put(weekdayid+"_"+lessonnumber,classname);
		
		
		System.out.println(lessonmap);
	}
}
}