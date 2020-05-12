package com.yc.ssm.controller;


import com.yc.ssm.po.CommentCustom;
import com.yc.ssm.po.ItemsComment;
import com.yc.ssm.po.User;
import com.yc.ssm.service.CommentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpSession;
import java.io.File;
import java.util.*;

@Controller
@RequestMapping("/comment")
public class CommentController {

    @Autowired
    CommentService commentService;

    @RequestMapping("/getComments")
    @ResponseBody
    public List<CommentCustom> getComments(Integer itemId) throws Exception{

        List<CommentCustom> comments = commentService.getCommentsByItemId(itemId);
        Collections.reverse(comments);
        return comments;
    }


    @RequestMapping("/addComment")
    @ResponseBody
    public String addComment(HttpSession session, ItemsComment itemsComment, MultipartFile comment_pic) throws Exception{
        User user = (User) session.getAttribute("user");
        if (user == null){
            return "user_log_out";
        }

        ItemsComment itemsComment1 = new ItemsComment();

        itemsComment1.setCommentUserid(user.getUserId());
        itemsComment1.setCommentItemid(itemsComment.getCommentItemid());
        itemsComment1.setCommentTime(new Date());
        itemsComment1.setCommentContent(itemsComment.getCommentContent());
        itemsComment1.setCommentGrade(itemsComment.getCommentGrade());

        String originalFilename = comment_pic.getOriginalFilename();
        if (originalFilename != null && originalFilename.length() > 0){
            String base_path = "/home/yucong/easyshop/pictures/comment_pic/";
            String newPicName = UUID.randomUUID() + originalFilename.substring(originalFilename.lastIndexOf("."));
            File commentPic = new File(base_path + newPicName);
            comment_pic.transferTo(commentPic);

            itemsComment1.setCommentPic(newPicName);
        }

        commentService.addComment(itemsComment1);

        return "commment_success";
    }




}
