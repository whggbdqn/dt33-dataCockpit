package com.airintelli.ssm.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.jdbc.core.support.JdbcDaoSupport;
import org.springframework.stereotype.Repository;

import com.airintelli.ssm.pojo.TableColumnInfo;
import com.airintelli.ssm.pojo.TempTablePagingData;
import com.airintelli.ssm.utils.ParseUtils;

/**
 * 临时表操作Dao
 * 
 * @author zengjia
 *
 */
@Repository
public class TempTableDao extends JdbcDaoSupport {

    Logger log = Logger.getLogger(TempTableDao.class);

    /**
     * Excel数据插入数据库
     * 
     * @param source
     * @param tableName
     * @param columnInfo
     * @throws Exception
     */
    public void insert(List<String[]> source, String tableName, List<TableColumnInfo> columnInfo) throws Exception {
	log.info("批量插入操作开始");

	List<Object[]> list = ParseUtils.parseAll(source, columnInfo);

	StringBuffer sql = new StringBuffer("insert into " + tableName + " values(?");

	for (int i = 1; i < columnInfo.size(); i++) {
	    sql.append(",?");
	}
	sql.append(")");
	// System.out.println(sql);
	log.debug("批量插入SQL语句：" + sql.toString());
	JdbcTemplate template = this.getJdbcTemplate();
	if (template != null) {
	    template.batchUpdate(sql.toString(), list);
	}

	log.info("批量插入操作结束");
    }

    /**
     * 取得记录总数
     * 
     * @param tableName
     * @return
     * @throws Exception
     */
    public long getRecordCount(String tableName) throws Exception {

	log.info("取得总记录数开始");
	String sql = "select count(1) as cnt from " + tableName;

	// ResultSet rs = DBUtils.executeQuery(sql, null);
	Long recordCount = this.getJdbcTemplate().queryForObject(sql, new RowMapper<Long>() {

	    @Override
	    public Long mapRow(ResultSet rs, int rowNum) throws SQLException {

		return rs.getLong(1);
	    }

	});
	log.info("取得总记录数结束");
	return recordCount;
    }

    /**
     * 根据分页数据查询记录，返回List<Map<String,Object>>类型对象
     * 
     * @param data
     * @param columnInfo
     * @throws Exception
     */
    public TempTablePagingData findByPage(TempTablePagingData data, List<TableColumnInfo> columnInfo) throws Exception {
	log.info("查找分页数据开始");
	data.setTotalCount(getRecordCount(data.getTableName()));
	int pageCount = 0;
	if (data.getTotalCount() % data.getPageSize() == 0) {
	    pageCount = (int) (data.getTotalCount() / data.getPageSize());
	} else {
	    pageCount = (int) (data.getTotalCount() / data.getPageSize()) + 1;
	}
	data.setPageCount(pageCount);

	String sql = "select * from " + data.getTableName() + " limit " + (data.getPageNow() - 1) * data.getPageSize()
		+ "," + data.getPageSize();
	log.debug(sql);
	List<Map<String, Object>> result = this.getJdbcTemplate().queryForList(sql);

	data.setResult(result);
	log.info("查找分页数据结束");
	return data;
    }

    /**
     * 取得企业用户表所有数据 findAll:()
     * 
     * @author zengjia
     * @param tableName
     *            企业用户表表名
     * @return List<Map<String, Object>>
     */
    public List<Map<String, Object>> findAll(String tableName) {
	String sql = "select * from " + tableName;
	List<Map<String, Object>> result = this.getJdbcTemplate().queryForList(sql);
	return result;
    }
}
