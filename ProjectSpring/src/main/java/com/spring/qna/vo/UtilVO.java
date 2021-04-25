package com.spring.qna.vo;

import org.springframework.web.util.UriComponentsBuilder;

import lombok.Data;

@Data
public class UtilVO 
{

	private int pageNum;
	private int amount;

	private String type;
	private String keyword;

	public UtilVO() {
		this(1, 10);
	}

	public UtilVO(int pageNum, int amount) {
		this.pageNum = pageNum;
		this.amount = amount;
	}

	public String[] getTypeArr() {

		return type == null ? new String[] {} : type.split("");
	}

	public String getListLink() {
		UriComponentsBuilder builder = UriComponentsBuilder.fromPath("").queryParam("pageNum", this.pageNum)
				.queryParam("amount", this.getAmount()).queryParam("type", this.getType())
				.queryParam("keyword", this.getKeyword());

		return builder.toUriString();
	}

}