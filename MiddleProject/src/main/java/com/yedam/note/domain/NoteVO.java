package com.yedam.note.domain;

import java.sql.Date;

import lombok.Data;

@Data
public class NoteVO {
	private int noteId;
	private String userId;
	private String noteCT;
	private Date noteDate;
	private int noteViews;
}
