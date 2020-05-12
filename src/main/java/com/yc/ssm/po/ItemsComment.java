package com.yc.ssm.po;

import java.io.Serializable;
import java.util.Date;

public class ItemsComment implements Serializable {
    private Integer commentId;

    private Integer commentUserid;

    private Integer commentItemid;

    private Date commentTime;

    private String commentGrade;

    private String commentPic;

    private String commentContent;

    public Integer getCommentId() {
        return commentId;
    }

    public void setCommentId(Integer commentId) {
        this.commentId = commentId;
    }

    public Integer getCommentUserid() {
        return commentUserid;
    }

    public void setCommentUserid(Integer commentUserid) {
        this.commentUserid = commentUserid;
    }

    public Integer getCommentItemid() {
        return commentItemid;
    }

    public void setCommentItemid(Integer commentItemid) {
        this.commentItemid = commentItemid;
    }

    public Date getCommentTime() {
        return commentTime;
    }

    public void setCommentTime(Date commentTime) {
        this.commentTime = commentTime;
    }

    public String getCommentGrade() {
        return commentGrade;
    }

    public void setCommentGrade(String commentGrade) {
        this.commentGrade = commentGrade == null ? null : commentGrade.trim();
    }

    public String getCommentPic() {
        return commentPic;
    }

    public void setCommentPic(String commentPic) {
        this.commentPic = commentPic == null ? null : commentPic.trim();
    }

    public String getCommentContent() {
        return commentContent;
    }

    public void setCommentContent(String commentContent) {
        this.commentContent = commentContent == null ? null : commentContent.trim();
    }
}