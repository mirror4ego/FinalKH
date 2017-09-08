package com.kh.web.util;

import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;

import com.google.gson.Gson;

public class JsonResponseUtil {
	/** * JSON View 화면 처리를 위해 JSON변환 후 ResponseEntity로 반환. * @param obj * @return */
	public static ResponseEntity<Object> getJSONResponse(Object obj) {
		String json = new Gson().toJson(obj).toString();
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "application/json; charset=UTF-8");
		return new ResponseEntity<Object>(json, responseHeaders, HttpStatus.OK);
	}

	/** * JSON View 화면 처리를 위해 JSON변환 후 ResponseEntity로 반환. * @param obj * @return */
	public static String getJSONString(Object obj) {
		return new Gson().toJson(obj).toString();
	}

}
