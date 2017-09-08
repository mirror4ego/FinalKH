package com.kh.web.dbParse;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.lang.reflect.Type;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.Collection;

import org.apache.http.HttpResponse;
import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClientBuilder;

import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import com.google.gson.reflect.TypeToken;

public class ParseJsonContentCommon {
	public static void main(String[] args)
			throws ClientProtocolException, IOException, ClassNotFoundException, SQLException {

		Connection con;
		PreparedStatement pstmt = null;

		CloseableHttpClient httpClient = HttpClientBuilder.create().build();
		HttpGet httpGet = new HttpGet(
				"http://api.visitkorea.or.kr/openapi/service/rest/KorService/areaBasedList?ServiceKey=ZhnHJ1fzbYGAO2Xl%2FSg5MHWhMO0GkoIguiXKwi3%2BlAB8OTO1xYkmp0228On6RJ6lgh6Z4%2BLCWnAsnPm0wysTgA%3D%3D&contentTypeId=&areaCode=&sigunguCode=&cat1=&cat2=&cat3=&listYN=Y&MobileOS=ETC&MobileApp=TourAPI3.0_Guide&arrange=A&numOfRows=26000&pageNo=1&_type=json");

		HttpResponse response = httpClient.execute(httpGet);

		System.out.println(response);

		Gson gson = new Gson();
		BufferedReader rd = new BufferedReader(new InputStreamReader(response.getEntity().getContent()));
		JsonParser jsonParser = new JsonParser();
		JsonElement jsonTree = jsonParser.parse(rd);
		JsonObject jsonObject = jsonTree.getAsJsonObject();
		JsonArray jsonItemObject = jsonObject.getAsJsonObject("response").getAsJsonObject("body")
				.getAsJsonObject("items").getAsJsonArray("item");

		Collection<DataEnumContentCommon> datas = null;
		Type collectionType = new TypeToken<Collection<DataEnumContentCommon>>() {
		}.getType();
		datas = gson.fromJson(jsonItemObject, collectionType);

		Class.forName("oracle.jdbc.driver.OracleDriver");
		con = DriverManager.getConnection("jdbc:oracle:thin:@mirror4ego.iptime.org:1521:orcl", "finalkh", "finalkh");
		System.out.println("데이터베이스의 연결에 성공하였습니다.");

		int count = 0;
		for (DataEnumContentCommon dataEnum : datas) {
			count++;
			//System.out.println(count);
			//System.out.println(dataEnum.toString());
			try {

				String sql = "insert into T_ContentCommon (ContentId, Addr1, Addr2, BookTour, CreatedTime, FirstImage, FirstImage2, MapX, MapY, MLevel, ModifiedTime, "
						+ "ReadCount, AreaCode, Cat1Code, Cat2Code, Cat3Code, ContentTypeId, Tel, Title, ZipCode, SiGunGuCode, HomePage, TelName, OverView) "
						+ "values (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
				pstmt = con.prepareStatement(sql);

				pstmt.setString(1, dataEnum.getContentid());
				pstmt.setString(2, dataEnum.getAddr1());
				pstmt.setString(3, dataEnum.getAddr2());
				pstmt.setString(4, dataEnum.getBooktour());
				pstmt.setString(5, dataEnum.getCreatedtime());
				pstmt.setString(6, dataEnum.getFirstimage());
				pstmt.setString(7, dataEnum.getFirstimage2());
				pstmt.setString(8, dataEnum.getMapX());
				pstmt.setString(9, dataEnum.getMapY());
				pstmt.setString(10, dataEnum.getmLevel());
				pstmt.setString(11, dataEnum.getModifiedTime());
				pstmt.setString(12, dataEnum.getReadcount());
				pstmt.setString(13, dataEnum.getAreacode());
				pstmt.setString(14, dataEnum.getCat1());
				pstmt.setString(15, dataEnum.getCat2());
				pstmt.setString(16, dataEnum.getCat3());
				pstmt.setString(17, dataEnum.getContenttypeid());
				pstmt.setString(18, dataEnum.getTel());
				pstmt.setString(19, dataEnum.getTitle());
				pstmt.setString(20, dataEnum.getZipcode());
				pstmt.setString(21, dataEnum.getSigungucode());
				pstmt.setString(22, dataEnum.getHomepage());
				pstmt.setString(23, dataEnum.getTelname());
				pstmt.setString(24, dataEnum.getOverview());
				pstmt.executeUpdate();



			} catch (SQLException sql) {
				System.out.println(sql.toString());
				System.out.println(count);
				System.out.println(dataEnum.toString());
				pstmt.close();
			} catch (Exception e) {
				System.out.println(e.toString());
				pstmt.close();
			} finally {
				pstmt.close();

			}
		}
		pstmt.close();
		con.close();
		System.out.println(count);
	}
}
