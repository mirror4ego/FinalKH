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
import org.apache.http.client.HttpClient;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.impl.client.HttpClientBuilder;

import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import com.google.gson.reflect.TypeToken;

public class ParseJsonContentGallary {
	public static void main(String[] args)
			throws ClientProtocolException, IOException, ClassNotFoundException, SQLException {

		Connection con;
		PreparedStatement pstmt = null;

		HttpClient httpClient = HttpClientBuilder.create().build();
		HttpGet httpGet = new HttpGet(
				"http://api.visitkorea.or.kr/openapi/service/rest/PhotoGalleryService/galleryList?ServiceKey=cbFiEQk%2FbfjsErq0XKgDF3990ILxrAuoE7Zd4GWjEdceZ5aShgd59vrS097mD1POhj02QJ9EcB9vI%2F%2BN47iw6w%3D%3D&numOfRows=50000&pageNo=1&MobileOS=ETC&MobileApp=TestApp&_type=json");

		HttpResponse response = httpClient.execute(httpGet);

		System.out.println(response);

		Gson gson = new Gson();
		BufferedReader rd = new BufferedReader(new InputStreamReader(response.getEntity().getContent()));
		JsonParser jsonParser = new JsonParser();
		JsonElement jsonTree = jsonParser.parse(rd);
		JsonObject jsonObject = jsonTree.getAsJsonObject();
		JsonArray jsonItemObject = jsonObject.getAsJsonObject("response").getAsJsonObject("body")
				.getAsJsonObject("items").getAsJsonArray("item");

		Collection<DataEnumContentGallary> datas = null;
		Type collectionType = new TypeToken<Collection<DataEnumContentGallary>>() {
		}.getType();
		datas = gson.fromJson(jsonItemObject, collectionType);

		Class.forName("oracle.jdbc.driver.OracleDriver");
		con = DriverManager.getConnection("jdbc:oracle:thin:@mirror4ego.iptime.org:1521:orcl", "finalkh", "finalkh");
		System.out.println("데이터베이스의 연결에 성공하였습니다.");

		int count = 0;
		for (DataEnumContentGallary dataEnum : datas) {
			count++;
			//System.out.println(count);
			//System.out.println(dataEnum.toString());
			try {

				String sql = "insert into T_ContentGallary (GalContentId, GalContentTypeId, GalCreatedTime, GalModifiedTime, GalPhotographer, "
						+ "GalPhotographyLocation, GalPhotographyMonth, GalSearchKeyword, GalTitle, GalViewCount, GalWebImageUrl)"
						+ "values (?,?,?,?,?,?,?,?,?,?,?)";
				pstmt = con.prepareStatement(sql);

				pstmt.setString(1, dataEnum.getGalContentId());
				pstmt.setString(2, dataEnum.getGalContentTypeId());
				pstmt.setString(3, dataEnum.getGalCreatedtime());
				pstmt.setString(4, dataEnum.getGalModifiedtime());
				pstmt.setString(5, dataEnum.getGalPhotographer());
				pstmt.setString(6, dataEnum.getGalPhotographyLocation());
				pstmt.setString(7, dataEnum.getGalPhotographyMonth());
				pstmt.setString(8, dataEnum.getGalSearchKeyword());
				pstmt.setString(9, dataEnum.getGalTitle());
				pstmt.setString(10, dataEnum.getGalViewCount());
				pstmt.setString(11, dataEnum.getGalWebImageUrl());
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
