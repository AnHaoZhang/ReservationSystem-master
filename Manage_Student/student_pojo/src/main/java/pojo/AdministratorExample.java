package pojo;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

public class AdministratorExample implements Serializable {
    protected String orderByClause;

    protected boolean distinct;

    protected List<Criteria> oredCriteria;

    public AdministratorExample() {
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

        public Criteria andAidIsNull() {
            addCriterion("aid is null");
            return (Criteria) this;
        }

        public Criteria andAidIsNotNull() {
            addCriterion("aid is not null");
            return (Criteria) this;
        }

        public Criteria andAidEqualTo(String value) {
            addCriterion("aid =", value, "aid");
            return (Criteria) this;
        }

        public Criteria andAidNotEqualTo(String value) {
            addCriterion("aid <>", value, "aid");
            return (Criteria) this;
        }

        public Criteria andAidGreaterThan(String value) {
            addCriterion("aid >", value, "aid");
            return (Criteria) this;
        }

        public Criteria andAidGreaterThanOrEqualTo(String value) {
            addCriterion("aid >=", value, "aid");
            return (Criteria) this;
        }

        public Criteria andAidLessThan(String value) {
            addCriterion("aid <", value, "aid");
            return (Criteria) this;
        }

        public Criteria andAidLessThanOrEqualTo(String value) {
            addCriterion("aid <=", value, "aid");
            return (Criteria) this;
        }

        public Criteria andAidLike(String value) {
            addCriterion("aid like", value, "aid");
            return (Criteria) this;
        }

        public Criteria andAidNotLike(String value) {
            addCriterion("aid not like", value, "aid");
            return (Criteria) this;
        }

        public Criteria andAidIn(List<String> values) {
            addCriterion("aid in", values, "aid");
            return (Criteria) this;
        }

        public Criteria andAidNotIn(List<String> values) {
            addCriterion("aid not in", values, "aid");
            return (Criteria) this;
        }

        public Criteria andAidBetween(String value1, String value2) {
            addCriterion("aid between", value1, value2, "aid");
            return (Criteria) this;
        }

        public Criteria andAidNotBetween(String value1, String value2) {
            addCriterion("aid not between", value1, value2, "aid");
            return (Criteria) this;
        }

        public Criteria andApwdIsNull() {
            addCriterion("apwd is null");
            return (Criteria) this;
        }

        public Criteria andApwdIsNotNull() {
            addCriterion("apwd is not null");
            return (Criteria) this;
        }

        public Criteria andApwdEqualTo(String value) {
            addCriterion("apwd =", value, "apwd");
            return (Criteria) this;
        }

        public Criteria andApwdNotEqualTo(String value) {
            addCriterion("apwd <>", value, "apwd");
            return (Criteria) this;
        }

        public Criteria andApwdGreaterThan(String value) {
            addCriterion("apwd >", value, "apwd");
            return (Criteria) this;
        }

        public Criteria andApwdGreaterThanOrEqualTo(String value) {
            addCriterion("apwd >=", value, "apwd");
            return (Criteria) this;
        }

        public Criteria andApwdLessThan(String value) {
            addCriterion("apwd <", value, "apwd");
            return (Criteria) this;
        }

        public Criteria andApwdLessThanOrEqualTo(String value) {
            addCriterion("apwd <=", value, "apwd");
            return (Criteria) this;
        }

        public Criteria andApwdLike(String value) {
            addCriterion("apwd like", value, "apwd");
            return (Criteria) this;
        }

        public Criteria andApwdNotLike(String value) {
            addCriterion("apwd not like", value, "apwd");
            return (Criteria) this;
        }

        public Criteria andApwdIn(List<String> values) {
            addCriterion("apwd in", values, "apwd");
            return (Criteria) this;
        }

        public Criteria andApwdNotIn(List<String> values) {
            addCriterion("apwd not in", values, "apwd");
            return (Criteria) this;
        }

        public Criteria andApwdBetween(String value1, String value2) {
            addCriterion("apwd between", value1, value2, "apwd");
            return (Criteria) this;
        }

        public Criteria andApwdNotBetween(String value1, String value2) {
            addCriterion("apwd not between", value1, value2, "apwd");
            return (Criteria) this;
        }

        public Criteria andAroleIsNull() {
            addCriterion("arole is null");
            return (Criteria) this;
        }

        public Criteria andAroleIsNotNull() {
            addCriterion("arole is not null");
            return (Criteria) this;
        }

        public Criteria andAroleEqualTo(Integer value) {
            addCriterion("arole =", value, "arole");
            return (Criteria) this;
        }

        public Criteria andAroleNotEqualTo(Integer value) {
            addCriterion("arole <>", value, "arole");
            return (Criteria) this;
        }

        public Criteria andAroleGreaterThan(Integer value) {
            addCriterion("arole >", value, "arole");
            return (Criteria) this;
        }

        public Criteria andAroleGreaterThanOrEqualTo(Integer value) {
            addCriterion("arole >=", value, "arole");
            return (Criteria) this;
        }

        public Criteria andAroleLessThan(Integer value) {
            addCriterion("arole <", value, "arole");
            return (Criteria) this;
        }

        public Criteria andAroleLessThanOrEqualTo(Integer value) {
            addCriterion("arole <=", value, "arole");
            return (Criteria) this;
        }

        public Criteria andAroleIn(List<Integer> values) {
            addCriterion("arole in", values, "arole");
            return (Criteria) this;
        }

        public Criteria andAroleNotIn(List<Integer> values) {
            addCriterion("arole not in", values, "arole");
            return (Criteria) this;
        }

        public Criteria andAroleBetween(Integer value1, Integer value2) {
            addCriterion("arole between", value1, value2, "arole");
            return (Criteria) this;
        }

        public Criteria andAroleNotBetween(Integer value1, Integer value2) {
            addCriterion("arole not between", value1, value2, "arole");
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