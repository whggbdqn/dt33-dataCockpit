package com.airintelli.ssm.controller.resolver;

import javax.servlet.http.HttpServletRequest;

import com.airintelli.ssm.vo.datatable.DataTableParams;

/**
 * <pre>
draw=1
&columns[0][data]=first_name
&columns[0][name]=
&columns[0][searchable]=true
&columns[0][orderable]=true
&columns[0][search][value]=
&columns[0][search][regex]=false

&columns[1][data]=last_name
&columns[1][name]=
&columns[1][searchable]=true
&columns[1][orderable]=true
&columns[1][search][value]=
&columns[1][search][regex]=false

&columns[2][data]=position
&columns[2][name]=
&columns[2][searchable]=true
&columns[2][orderable]=true
&columns[2][search][value]=
&columns[2][search][regex]=false

&columns[3][data]=office
&columns[3][name]=
&columns[3][searchable]=true
&columns[3][orderable]=true
&columns[3][search][value]=
&columns[3][search][regex]=false

&columns[4][data]=start_date
&columns[4][name]=
&columns[4][searchable]=true
&columns[4][orderable]=true
&columns[4][search][value]=
&columns[4][search][regex]=false

&columns[5][data]=salary
&columns[5][name]=
&columns[5][searchable]=true
&columns[5][orderable]=true
&columns[5][search][value]=
&columns[5][search][regex]=false

&order[0][column]=0
&order[0][dir]=asc
&start=0
&length=10
&search[value]=
&search[regex]=false
&_=1499838977970
 * </pre>
 * 
 * @author thinkpad
 */
public class Converter {

	public DataTableParams toDataTableParams(HttpServletRequest request) {
		ParameterHelper ph = new ParameterHelper(request);
		DataTableParams dtp = new DataTableParams();
		
		dtp.setDraw(ph.getInt("draw", 0));
		dtp.setStart(ph.getInt("start", 0));
		dtp.setLength(ph.getInt("length", 10));
		return dtp;
	}

	private class ParameterHelper {
		
		public ParameterHelper(HttpServletRequest request) {
			this.request = request;
		}

		private HttpServletRequest request;

		private int toInt(String str, int defaultValue) {
			if (null != str) {
				try {
					return Integer.parseInt(str);
				} catch (Exception e) {
					// TODO: log exception
				}
			}
			return defaultValue;
		}

		private boolean getBoolean(String name) {
			String val = request.getParameter(name);
			return "true".equals(val);
		}

		private int getInt(String name, int defaultValue) {
			String val = request.getParameter(name);
			return this.toInt(val, defaultValue);
		}
	}
}
