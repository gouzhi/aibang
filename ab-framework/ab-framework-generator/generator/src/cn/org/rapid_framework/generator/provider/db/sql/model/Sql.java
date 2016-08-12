package cn.org.rapid_framework.generator.provider.db.sql.model;

import cn.org.rapid_framework.generator.provider.db.table.model.Column;
import cn.org.rapid_framework.generator.provider.db.table.model.Table;
import cn.org.rapid_framework.generator.util.StringHelper;
import cn.org.rapid_framework.generator.util.sqlparse.SqlParseHelper;
import cn.org.rapid_framework.generator.util.sqlparse.SqlTypeChecker;
import java.util.Iterator;
import java.util.LinkedHashSet;
import java.util.List;

public class Sql
{
  public static String MULTIPLICITY_ONE = "one";
  public static String MULTIPLICITY_MANY = "many";
  public static String MULTIPLICITY_PAGING = "paging";

  String tableSqlName = null;
  String operation = null;
  String resultClass;
  String parameterClass;
  String remarks;
  String multiplicity = MULTIPLICITY_ONE;
  boolean paging = false;
  String sqlmap;
  LinkedHashSet<Column> columns = new LinkedHashSet();
  LinkedHashSet<SqlParameter> params = new LinkedHashSet();
  String sourceSql;
  String executeSql;
  private String paramType = "primitive";
  private String ibatisSql;
  private String ibatis3Sql;

  public Sql()
  {
  }

  public Sql(Sql sql)
  {
    this.tableSqlName = sql.tableSqlName;

    this.operation = sql.operation;
    this.parameterClass = sql.parameterClass;
    this.resultClass = sql.resultClass;
    this.multiplicity = sql.multiplicity;

    this.columns = sql.columns;
    this.params = sql.params;
    this.sourceSql = sql.sourceSql;
    this.executeSql = sql.executeSql;
    this.remarks = sql.remarks;
  }

  public boolean isColumnsInSameTable()
  {
    if ((this.columns == null) || (this.columns.isEmpty())) return false;
    Column firstTable = (Column)this.columns.iterator().next();
    if (this.columns.size() == 1) return true;
    if (firstTable.getTable() == null) {
      return false;
    }

    String preTableName = firstTable.getTable().getSqlName();
    for (Column c : this.columns) {
      Table table = c.getTable();
      if (table == null) {
        return false;
      }
      if (!preTableName.equalsIgnoreCase(table.getSqlName()))
      {
        return false;
      }
    }
    return true;
  }

  public String getResultClass()
  {
    if (StringHelper.isNotBlank(this.resultClass)) return this.resultClass;
    if (this.columns.size() == 1) {
      return ((Column)this.columns.iterator().next()).getSimpleJavaType();
    }
    if (isColumnsInSameTable()) {
      return ((Column)this.columns.iterator().next()).getTable().getClassName();
    }
    if (this.operation == null) return null;
    return StringHelper.makeAllWordFirstLetterUpperCase(StringHelper.toUnderscoreName(this.operation)) + System.getProperty("generator.sql.resultClass.suffix", "Result");
  }

  public void setResultClass(String queryResultClass)
  {
    this.resultClass = queryResultClass;
  }

  public String getResultClassName()
  {
    int lastIndexOf = getResultClass().lastIndexOf(".");
    return lastIndexOf >= 0 ? getResultClass().substring(lastIndexOf + 1) : getResultClass();
  }

  public String getParameterClass()
  {
    if (StringHelper.isNotBlank(this.parameterClass)) return this.parameterClass;
    if (StringHelper.isBlank(this.operation)) return null;
    if (isSelectSql()) {
      return StringHelper.makeAllWordFirstLetterUpperCase(StringHelper.toUnderscoreName(this.operation)) + "Query";
    }
    return StringHelper.makeAllWordFirstLetterUpperCase(StringHelper.toUnderscoreName(this.operation)) + "Parameter";
  }

  public void setParameterClass(String parameterClass)
  {
    this.parameterClass = parameterClass;
  }

  public String getParameterClassName()
  {
    int lastIndexOf = getParameterClass().lastIndexOf(".");
    return lastIndexOf >= 0 ? getParameterClass().substring(lastIndexOf + 1) : getParameterClass();
  }

  public int getColumnsCount()
  {
    return this.columns.size();
  }
  public void addColumn(Column c) {
    this.columns.add(c);
  }

  public String getOperation()
  {
    return this.operation;
  }
  public void setOperation(String operation) {
    this.operation = operation;
  }
  public String getOperationFirstUpper() {
    return StringHelper.capitalize(getOperation());
  }

  public String getMultiplicity()
  {
    return this.multiplicity;
  }

  public void setMultiplicity(String multiplicity) {
    this.multiplicity = multiplicity;
  }

  public LinkedHashSet<Column> getColumns()
  {
    return this.columns;
  }
  public void setColumns(LinkedHashSet<Column> columns) {
    this.columns = columns;
  }

  public LinkedHashSet<SqlParameter> getParams()
  {
    return this.params;
  }
  public void setParams(LinkedHashSet<SqlParameter> params) {
    this.params = params;
  }
  public SqlParameter getParam(String paramName) {
    for (SqlParameter p : getParams()) {
      if (p.getParamName().equals(paramName)) {
        return p;
      }
    }
    return null;
  }

  public String getSourceSql()
  {
    return this.sourceSql;
  }
  public void setSourceSql(String sourceSql) {
    this.sourceSql = sourceSql;
  }

  public String getSqlmap() {
    return this.sqlmap;
  }

  public void setSqlmap(String sqlmap) {
    if (StringHelper.isNotBlank(sqlmap)) {
      sqlmap = StringHelper.replace(sqlmap, "${cdata-start}", "<![CDATA[");
      sqlmap = StringHelper.replace(sqlmap, "${cdata-end}", "]]>");
    }
    this.sqlmap = sqlmap;
  }

  public String getSqlmap(List<String> params) {
    if ((params == null) || (params.size() == 0)) {
      return this.sqlmap;
    }

    String result = this.sqlmap;

    if (params.size() == 1) {
      return StringHelper.replace(result, "${param1}", "value");
    }
    for (int i = 0; i < params.size(); i++) {
      result = StringHelper.replace(result, "${param" + (i + 1) + "}", (String)params.get(i));
    }

    return result;
  }

  public boolean isHasSqlMap() {
    return StringHelper.isNotBlank(this.sqlmap);
  }

  public String getExecuteSql()
  {
    return this.executeSql;
  }

  public void setExecuteSql(String executeSql) {
    this.executeSql = executeSql;
  }

  public String getCountHql() {
    return toCountSqlForPaging(getHql());
  }

  public String getCountSql() {
    return toCountSqlForPaging(getSql());
  }

  public String getIbatisCountSql() {
    return toCountSqlForPaging(getIbatisSql());
  }

  public String getIbatis3CountSql() {
    return toCountSqlForPaging(getIbatis3Sql());
  }

  public String getSqlmapCountSql() {
    return toCountSqlForPaging(getSqlmap());
  }

  public String getSql() {
    return replaceWildcardWithColumnsSqlName(this.sourceSql);
  }

  public String toCountSqlForPaging(String sql) {
    if (sql == null) return null;
    if (isSelectSql()) {
      return SqlParseHelper.toCountSqlForPaging(sql, "select count(*) ");
    }
    return sql;
  }

  public String getSpringJdbcSql() {
    return SqlParseHelper.convert2NamedParametersSql(getSql(), ":", "");
  }

  public String getHql() {
    return SqlParseHelper.convert2NamedParametersSql(getSql(), ":", "");
  }

  public String getIbatisSql() {
    return StringHelper.isBlank(this.ibatisSql) ? SqlParseHelper.convert2NamedParametersSql(getSql(), "#", "#") : this.ibatisSql;
  }

  public String getIbatis3Sql() {
    return StringHelper.isBlank(this.ibatis3Sql) ? SqlParseHelper.convert2NamedParametersSql(getSql(), "#{", "}") : this.ibatis3Sql;
  }

  public void setIbatisSql(String ibatisSql) {
    this.ibatisSql = ibatisSql;
  }

  public void setIbatis3Sql(String ibatis3Sql) {
    this.ibatis3Sql = ibatis3Sql;
  }

  private String joinColumnsSqlName()
  {
    StringBuffer sb = new StringBuffer();
    for (Iterator it = this.columns.iterator(); it.hasNext(); ) {
      Column c = (Column)it.next();
      sb.append(c.getSqlName());
      if (it.hasNext()) sb.append(",");
    }
    return sb.toString();
  }

  public String replaceWildcardWithColumnsSqlName(String sql) {
    if ((SqlTypeChecker.isSelectSql(sql)) && (SqlParseHelper.getSelect(SqlParseHelper.removeSqlComments(sql)).indexOf("*") >= 0) && (SqlParseHelper.getSelect(SqlParseHelper.removeSqlComments(sql)).indexOf("count(") < 0)) {
      return SqlParseHelper.getPrettySql("select " + joinColumnsSqlName() + " " + SqlParseHelper.removeSelect(sql));
    }
    return sql;
  }

  public boolean isSelectSql()
  {
    return SqlTypeChecker.isSelectSql(this.sourceSql);
  }

  public boolean isUpdateSql()
  {
    return SqlTypeChecker.isUpdateSql(this.sourceSql);
  }

  public boolean isDeleteSql()
  {
    return SqlTypeChecker.isDeleteSql(this.sourceSql);
  }

  public boolean isInsertSql()
  {
    return SqlTypeChecker.isInsertSql(this.sourceSql);
  }

  public String getTableSqlName()
  {
    return this.tableSqlName;
  }

  public void setTableSqlName(String tableName) {
    this.tableSqlName = tableName;
  }

  public String getRemarks()
  {
    return this.remarks;
  }

  public String getParamType() {
    return this.paramType;
  }

  public void setParamType(String paramType) {
    this.paramType = paramType;
  }

  public void setRemarks(String comments) {
    this.remarks = comments;
  }

  public boolean isPaging() {
    if (MULTIPLICITY_PAGING.equalsIgnoreCase(this.multiplicity)) {
      return true;
    }
    return this.paging;
  }

  public void setPaging(boolean paging) {
    this.paging = paging;
  }

  public String getTableClassName()
  {
    if (StringHelper.isBlank(this.tableSqlName)) return null;
    String removedPrefixSqlName = Table.removeTableSqlNamePrefix(this.tableSqlName);
    return StringHelper.makeAllWordFirstLetterUpperCase(StringHelper.toUnderscoreName(removedPrefixSqlName));
  }

  public Column getColumnBySqlName(String sqlName) {
    for (Column c : getColumns()) {
      if (c.getSqlName().equalsIgnoreCase(sqlName)) {
        return c;
      }
    }
    return null;
  }

  public Column getColumnByName(String name) {
    Column c = getColumnBySqlName(name);
    if (c == null) {
      c = getColumnBySqlName(StringHelper.toUnderscoreName(name));
    }
    return c;
  }

  public String toString() {
    return "sourceSql:\n" + this.sourceSql + "\nsql:" + getSql();
  }
}