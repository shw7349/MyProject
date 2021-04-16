package notice;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class NoticeService {

	NoticeDAO noticeDAO;

	public NoticeService() {
		noticeDAO = new NoticeDAO();
	}

	public Map listArticles(Map<String, Integer> pagingMap) {
		Map articlesMap = new HashMap();
		//List<NoticeVO> articlesList = noticeDAO.selectAllArticles(pagingMap);
		List<NoticeVO> noticeArticleList = noticeDAO.selectAllArticles(pagingMap, "y");
		List<NoticeVO> articlesList = noticeDAO.selectAllArticles(pagingMap, "n");
		int totArticles = noticeDAO.selectTotArticles();
		articlesMap.put("noticeArticlesList", noticeArticleList);
		articlesMap.put("articlesList", articlesList);
		articlesMap.put("totArticles", totArticles);
		//articlesMap.put("totArticles", 156);
		return articlesMap;
	}

	public List<NoticeVO> listArticles() {
		List<NoticeVO> articlesList = noticeDAO.selectAllArticles();
		return articlesList;
	}

	public int addArticle(NoticeVO article) {
		return noticeDAO.insertNewArticle(article);
	}

	public NoticeVO viewArticle(int articleNO) {
		NoticeVO article = null;
		article = noticeDAO.selectArticle(articleNO);
		return article;
	}

	public void modArticle(NoticeVO article) {
		noticeDAO.updateArticle(article);
	}

	public List<Integer> removeArticle(int articleNO) {
		List<Integer> articleNOList = noticeDAO.selectRemovedArticles(articleNO);
		noticeDAO.deleteArticle(articleNO);
		return articleNOList;
	}

	public int addReply(NoticeVO article) {
		return noticeDAO.insertNewArticle(article);
	}

}