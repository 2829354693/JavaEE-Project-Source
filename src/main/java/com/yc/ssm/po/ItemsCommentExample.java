package com.yc.ssm.po;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class ItemsCommentExample {
    protected String orderByClause;

    protected boolean distinct;

    protected List<Criteria> oredCriteria;

    public ItemsCommentExample() {
        oredCriteria = new ArrayList<Criteria>();
    }

    public void setOrderByClause(String orderByClause) {
        this.orderByClause = orderByClause;
    }

    public String getOrderByClause() {
        return orderByClause;
    }

    public void setDistinct(boolean distinct) {
        this.distinct = distinct;
    }

    public boolean isDistinct() {
        return distinct;
    }

    public List<Criteria> getOredCriteria() {
        return oredCriteria;
    }

    public void or(Criteria criteria) {
        oredCriteria.add(criteria);
    }

    public Criteria or() {
        Criteria criteria = createCriteriaInternal();
        oredCriteria.add(criteria);
        return criteria;
    }

    public Criteria createCriteria() {
        Criteria criteria = createCriteriaInternal();
        if (oredCriteria.size() == 0) {
            oredCriteria.add(criteria);
        }
        return criteria;
    }

    protected Criteria createCriteriaInternal() {
        Criteria criteria = new Criteria();
        return criteria;
    }

    public void clear() {
        oredCriteria.clear();
        orderByClause = null;
        distinct = false;
    }

    protected abstract static class GeneratedCriteria {
        protected List<Criterion> criteria;

        protected GeneratedCriteria() {
            super();
            criteria = new ArrayList<Criterion>();
        }

        public boolean isValid() {
            return criteria.size() > 0;
        }

        public List<Criterion> getAllCriteria() {
            return criteria;
        }

        public List<Criterion> getCriteria() {
            return criteria;
        }

        protected void addCriterion(String condition) {
            if (condition == null) {
                throw new RuntimeException("Value for condition cannot be null");
            }
            criteria.add(new Criterion(condition));
        }

        protected void addCriterion(String condition, Object value, String property) {
            if (value == null) {
                throw new RuntimeException("Value for " + property + " cannot be null");
            }
            criteria.add(new Criterion(condition, value));
        }

        protected void addCriterion(String condition, Object value1, Object value2, String property) {
            if (value1 == null || value2 == null) {
                throw new RuntimeException("Between values for " + property + " cannot be null");
            }
            criteria.add(new Criterion(condition, value1, value2));
        }

        public Criteria andCommentIdIsNull() {
            addCriterion("comment_id is null");
            return (Criteria) this;
        }

        public Criteria andCommentIdIsNotNull() {
            addCriterion("comment_id is not null");
            return (Criteria) this;
        }

        public Criteria andCommentIdEqualTo(Integer value) {
            addCriterion("comment_id =", value, "commentId");
            return (Criteria) this;
        }

        public Criteria andCommentIdNotEqualTo(Integer value) {
            addCriterion("comment_id <>", value, "commentId");
            return (Criteria) this;
        }

        public Criteria andCommentIdGreaterThan(Integer value) {
            addCriterion("comment_id >", value, "commentId");
            return (Criteria) this;
        }

        public Criteria andCommentIdGreaterThanOrEqualTo(Integer value) {
            addCriterion("comment_id >=", value, "commentId");
            return (Criteria) this;
        }

        public Criteria andCommentIdLessThan(Integer value) {
            addCriterion("comment_id <", value, "commentId");
            return (Criteria) this;
        }

        public Criteria andCommentIdLessThanOrEqualTo(Integer value) {
            addCriterion("comment_id <=", value, "commentId");
            return (Criteria) this;
        }

        public Criteria andCommentIdIn(List<Integer> values) {
            addCriterion("comment_id in", values, "commentId");
            return (Criteria) this;
        }

        public Criteria andCommentIdNotIn(List<Integer> values) {
            addCriterion("comment_id not in", values, "commentId");
            return (Criteria) this;
        }

        public Criteria andCommentIdBetween(Integer value1, Integer value2) {
            addCriterion("comment_id between", value1, value2, "commentId");
            return (Criteria) this;
        }

        public Criteria andCommentIdNotBetween(Integer value1, Integer value2) {
            addCriterion("comment_id not between", value1, value2, "commentId");
            return (Criteria) this;
        }

        public Criteria andCommentUseridIsNull() {
            addCriterion("comment_userid is null");
            return (Criteria) this;
        }

        public Criteria andCommentUseridIsNotNull() {
            addCriterion("comment_userid is not null");
            return (Criteria) this;
        }

        public Criteria andCommentUseridEqualTo(Integer value) {
            addCriterion("comment_userid =", value, "commentUserid");
            return (Criteria) this;
        }

        public Criteria andCommentUseridNotEqualTo(Integer value) {
            addCriterion("comment_userid <>", value, "commentUserid");
            return (Criteria) this;
        }

        public Criteria andCommentUseridGreaterThan(Integer value) {
            addCriterion("comment_userid >", value, "commentUserid");
            return (Criteria) this;
        }

        public Criteria andCommentUseridGreaterThanOrEqualTo(Integer value) {
            addCriterion("comment_userid >=", value, "commentUserid");
            return (Criteria) this;
        }

        public Criteria andCommentUseridLessThan(Integer value) {
            addCriterion("comment_userid <", value, "commentUserid");
            return (Criteria) this;
        }

        public Criteria andCommentUseridLessThanOrEqualTo(Integer value) {
            addCriterion("comment_userid <=", value, "commentUserid");
            return (Criteria) this;
        }

        public Criteria andCommentUseridIn(List<Integer> values) {
            addCriterion("comment_userid in", values, "commentUserid");
            return (Criteria) this;
        }

        public Criteria andCommentUseridNotIn(List<Integer> values) {
            addCriterion("comment_userid not in", values, "commentUserid");
            return (Criteria) this;
        }

        public Criteria andCommentUseridBetween(Integer value1, Integer value2) {
            addCriterion("comment_userid between", value1, value2, "commentUserid");
            return (Criteria) this;
        }

        public Criteria andCommentUseridNotBetween(Integer value1, Integer value2) {
            addCriterion("comment_userid not between", value1, value2, "commentUserid");
            return (Criteria) this;
        }

        public Criteria andCommentItemidIsNull() {
            addCriterion("comment_itemid is null");
            return (Criteria) this;
        }

        public Criteria andCommentItemidIsNotNull() {
            addCriterion("comment_itemid is not null");
            return (Criteria) this;
        }

        public Criteria andCommentItemidEqualTo(Integer value) {
            addCriterion("comment_itemid =", value, "commentItemid");
            return (Criteria) this;
        }

        public Criteria andCommentItemidNotEqualTo(Integer value) {
            addCriterion("comment_itemid <>", value, "commentItemid");
            return (Criteria) this;
        }

        public Criteria andCommentItemidGreaterThan(Integer value) {
            addCriterion("comment_itemid >", value, "commentItemid");
            return (Criteria) this;
        }

        public Criteria andCommentItemidGreaterThanOrEqualTo(Integer value) {
            addCriterion("comment_itemid >=", value, "commentItemid");
            return (Criteria) this;
        }

        public Criteria andCommentItemidLessThan(Integer value) {
            addCriterion("comment_itemid <", value, "commentItemid");
            return (Criteria) this;
        }

        public Criteria andCommentItemidLessThanOrEqualTo(Integer value) {
            addCriterion("comment_itemid <=", value, "commentItemid");
            return (Criteria) this;
        }

        public Criteria andCommentItemidIn(List<Integer> values) {
            addCriterion("comment_itemid in", values, "commentItemid");
            return (Criteria) this;
        }

        public Criteria andCommentItemidNotIn(List<Integer> values) {
            addCriterion("comment_itemid not in", values, "commentItemid");
            return (Criteria) this;
        }

        public Criteria andCommentItemidBetween(Integer value1, Integer value2) {
            addCriterion("comment_itemid between", value1, value2, "commentItemid");
            return (Criteria) this;
        }

        public Criteria andCommentItemidNotBetween(Integer value1, Integer value2) {
            addCriterion("comment_itemid not between", value1, value2, "commentItemid");
            return (Criteria) this;
        }

        public Criteria andCommentTimeIsNull() {
            addCriterion("comment_time is null");
            return (Criteria) this;
        }

        public Criteria andCommentTimeIsNotNull() {
            addCriterion("comment_time is not null");
            return (Criteria) this;
        }

        public Criteria andCommentTimeEqualTo(Date value) {
            addCriterion("comment_time =", value, "commentTime");
            return (Criteria) this;
        }

        public Criteria andCommentTimeNotEqualTo(Date value) {
            addCriterion("comment_time <>", value, "commentTime");
            return (Criteria) this;
        }

        public Criteria andCommentTimeGreaterThan(Date value) {
            addCriterion("comment_time >", value, "commentTime");
            return (Criteria) this;
        }

        public Criteria andCommentTimeGreaterThanOrEqualTo(Date value) {
            addCriterion("comment_time >=", value, "commentTime");
            return (Criteria) this;
        }

        public Criteria andCommentTimeLessThan(Date value) {
            addCriterion("comment_time <", value, "commentTime");
            return (Criteria) this;
        }

        public Criteria andCommentTimeLessThanOrEqualTo(Date value) {
            addCriterion("comment_time <=", value, "commentTime");
            return (Criteria) this;
        }

        public Criteria andCommentTimeIn(List<Date> values) {
            addCriterion("comment_time in", values, "commentTime");
            return (Criteria) this;
        }

        public Criteria andCommentTimeNotIn(List<Date> values) {
            addCriterion("comment_time not in", values, "commentTime");
            return (Criteria) this;
        }

        public Criteria andCommentTimeBetween(Date value1, Date value2) {
            addCriterion("comment_time between", value1, value2, "commentTime");
            return (Criteria) this;
        }

        public Criteria andCommentTimeNotBetween(Date value1, Date value2) {
            addCriterion("comment_time not between", value1, value2, "commentTime");
            return (Criteria) this;
        }

        public Criteria andCommentGradeIsNull() {
            addCriterion("comment_grade is null");
            return (Criteria) this;
        }

        public Criteria andCommentGradeIsNotNull() {
            addCriterion("comment_grade is not null");
            return (Criteria) this;
        }

        public Criteria andCommentGradeEqualTo(String value) {
            addCriterion("comment_grade =", value, "commentGrade");
            return (Criteria) this;
        }

        public Criteria andCommentGradeNotEqualTo(String value) {
            addCriterion("comment_grade <>", value, "commentGrade");
            return (Criteria) this;
        }

        public Criteria andCommentGradeGreaterThan(String value) {
            addCriterion("comment_grade >", value, "commentGrade");
            return (Criteria) this;
        }

        public Criteria andCommentGradeGreaterThanOrEqualTo(String value) {
            addCriterion("comment_grade >=", value, "commentGrade");
            return (Criteria) this;
        }

        public Criteria andCommentGradeLessThan(String value) {
            addCriterion("comment_grade <", value, "commentGrade");
            return (Criteria) this;
        }

        public Criteria andCommentGradeLessThanOrEqualTo(String value) {
            addCriterion("comment_grade <=", value, "commentGrade");
            return (Criteria) this;
        }

        public Criteria andCommentGradeLike(String value) {
            addCriterion("comment_grade like", value, "commentGrade");
            return (Criteria) this;
        }

        public Criteria andCommentGradeNotLike(String value) {
            addCriterion("comment_grade not like", value, "commentGrade");
            return (Criteria) this;
        }

        public Criteria andCommentGradeIn(List<String> values) {
            addCriterion("comment_grade in", values, "commentGrade");
            return (Criteria) this;
        }

        public Criteria andCommentGradeNotIn(List<String> values) {
            addCriterion("comment_grade not in", values, "commentGrade");
            return (Criteria) this;
        }

        public Criteria andCommentGradeBetween(String value1, String value2) {
            addCriterion("comment_grade between", value1, value2, "commentGrade");
            return (Criteria) this;
        }

        public Criteria andCommentGradeNotBetween(String value1, String value2) {
            addCriterion("comment_grade not between", value1, value2, "commentGrade");
            return (Criteria) this;
        }

        public Criteria andCommentPicIsNull() {
            addCriterion("comment_pic is null");
            return (Criteria) this;
        }

        public Criteria andCommentPicIsNotNull() {
            addCriterion("comment_pic is not null");
            return (Criteria) this;
        }

        public Criteria andCommentPicEqualTo(String value) {
            addCriterion("comment_pic =", value, "commentPic");
            return (Criteria) this;
        }

        public Criteria andCommentPicNotEqualTo(String value) {
            addCriterion("comment_pic <>", value, "commentPic");
            return (Criteria) this;
        }

        public Criteria andCommentPicGreaterThan(String value) {
            addCriterion("comment_pic >", value, "commentPic");
            return (Criteria) this;
        }

        public Criteria andCommentPicGreaterThanOrEqualTo(String value) {
            addCriterion("comment_pic >=", value, "commentPic");
            return (Criteria) this;
        }

        public Criteria andCommentPicLessThan(String value) {
            addCriterion("comment_pic <", value, "commentPic");
            return (Criteria) this;
        }

        public Criteria andCommentPicLessThanOrEqualTo(String value) {
            addCriterion("comment_pic <=", value, "commentPic");
            return (Criteria) this;
        }

        public Criteria andCommentPicLike(String value) {
            addCriterion("comment_pic like", value, "commentPic");
            return (Criteria) this;
        }

        public Criteria andCommentPicNotLike(String value) {
            addCriterion("comment_pic not like", value, "commentPic");
            return (Criteria) this;
        }

        public Criteria andCommentPicIn(List<String> values) {
            addCriterion("comment_pic in", values, "commentPic");
            return (Criteria) this;
        }

        public Criteria andCommentPicNotIn(List<String> values) {
            addCriterion("comment_pic not in", values, "commentPic");
            return (Criteria) this;
        }

        public Criteria andCommentPicBetween(String value1, String value2) {
            addCriterion("comment_pic between", value1, value2, "commentPic");
            return (Criteria) this;
        }

        public Criteria andCommentPicNotBetween(String value1, String value2) {
            addCriterion("comment_pic not between", value1, value2, "commentPic");
            return (Criteria) this;
        }
    }

    public static class Criteria extends GeneratedCriteria {

        protected Criteria() {
            super();
        }
    }

    public static class Criterion {
        private String condition;

        private Object value;

        private Object secondValue;

        private boolean noValue;

        private boolean singleValue;

        private boolean betweenValue;

        private boolean listValue;

        private String typeHandler;

        public String getCondition() {
            return condition;
        }

        public Object getValue() {
            return value;
        }

        public Object getSecondValue() {
            return secondValue;
        }

        public boolean isNoValue() {
            return noValue;
        }

        public boolean isSingleValue() {
            return singleValue;
        }

        public boolean isBetweenValue() {
            return betweenValue;
        }

        public boolean isListValue() {
            return listValue;
        }

        public String getTypeHandler() {
            return typeHandler;
        }

        protected Criterion(String condition) {
            super();
            this.condition = condition;
            this.typeHandler = null;
            this.noValue = true;
        }

        protected Criterion(String condition, Object value, String typeHandler) {
            super();
            this.condition = condition;
            this.value = value;
            this.typeHandler = typeHandler;
            if (value instanceof List<?>) {
                this.listValue = true;
            } else {
                this.singleValue = true;
            }
        }

        protected Criterion(String condition, Object value) {
            this(condition, value, null);
        }

        protected Criterion(String condition, Object value, Object secondValue, String typeHandler) {
            super();
            this.condition = condition;
            this.value = value;
            this.secondValue = secondValue;
            this.typeHandler = typeHandler;
            this.betweenValue = true;
        }

        protected Criterion(String condition, Object value, Object secondValue) {
            this(condition, value, secondValue, null);
        }
    }
}