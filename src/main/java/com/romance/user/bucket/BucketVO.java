package com.romance.user.bucket;

import lombok.Data;

@Data
public class BucketVO {
	private int bucket_seq;
	private int book_seq;
	private int bucket__book_count;
	private String user_id;
}
