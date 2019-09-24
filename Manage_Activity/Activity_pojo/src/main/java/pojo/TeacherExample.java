package pojo;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

public class TeacherExample implements Serializable
{
    protected String orderByClause;

    protected boolean distinct;

    protected List<Criteria> oredCriteria;

    public TeacherExample() {
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

        public Criteria andTnumIsNull() {
            addCriterion("tnum is null");
            return (Criteria) this;
        }

        public Criteria andTnumIsNotNull() {
            addCriterion("tnum is not null");
            return (Criteria) this;
        }

        public Criteria andTnumEqualTo(String value) {
            addCriterion("tnum =", value, "tnum");
            return (Criteria) this;
        }

        public Criteria andTnumNotEqualTo(String value) {
            addCriterion("tnum <>", value, "tnum");
            return (Criteria) this;
        }

        public Criteria andTnumGreaterThan(String value) {
            addCriterion("tnum >", value, "tnum");
            return (Criteria) this;
        }

        public Criteria andTnumGreaterThanOrEqualTo(String value) {
            addCriterion("tnum >=", value, "tnum");
            return (Criteria) this;
        }

        public Criteria andTnumLessThan(String value) {
            addCriterion("tnum <", value, "tnum");
            return (Criteria) this;
        }

        public Criteria andTnumLessThanOrEqualTo(String value) {
            addCriterion("tnum <=", value, "tnum");
            return (Criteria) this;
        }

        public Criteria andTnumLike(String value) {
            addCriterion("tnum like", value, "tnum");
            return (Criteria) this;
        }

        public Criteria andTnumNotLike(String value) {
            addCriterion("tnum not like", value, "tnum");
            return (Criteria) this;
        }

        public Criteria andTnumIn(List<String> values) {
            addCriterion("tnum in", values, "tnum");
            return (Criteria) this;
        }

        public Criteria andTnumNotIn(List<String> values) {
            addCriterion("tnum not in", values, "tnum");
            return (Criteria) this;
        }

        public Criteria andTnumBetween(String value1, String value2) {
            addCriterion("tnum between", value1, value2, "tnum");
            return (Criteria) this;
        }

        public Criteria andTnumNotBetween(String value1, String value2) {
            addCriterion("tnum not between", value1, value2, "tnum");
            return (Criteria) this;
        }

        public Criteria andTnameIsNull() {
            addCriterion("tname is null");
            return (Criteria) this;
        }

        public Criteria andTnameIsNotNull() {
            addCriterion("tname is not null");
            return (Criteria) this;
        }

        public Criteria andTnameEqualTo(String value) {
            addCriterion("tname =", value, "tname");
            return (Criteria) this;
        }

        public Criteria andTnameNotEqualTo(String value) {
            addCriterion("tname <>", value, "tname");
            return (Criteria) this;
        }

        public Criteria andTnameGreaterThan(String value) {
            addCriterion("tname >", value, "tname");
            return (Criteria) this;
        }

        public Criteria andTnameGreaterThanOrEqualTo(String value) {
            addCriterion("tname >=", value, "tname");
            return (Criteria) this;
        }

        public Criteria andTnameLessThan(String value) {
            addCriterion("tname <", value, "tname");
            return (Criteria) this;
        }

        public Criteria andTnameLessThanOrEqualTo(String value) {
            addCriterion("tname <=", value, "tname");
            return (Criteria) this;
        }

        public Criteria andTnameLike(String value) {
            addCriterion("tname like", value, "tname");
            return (Criteria) this;
        }

        public Criteria andTnameNotLike(String value) {
            addCriterion("tname not like", value, "tname");
            return (Criteria) this;
        }

        public Criteria andTnameIn(List<String> values) {
            addCriterion("tname in", values, "tname");
            return (Criteria) this;
        }

        public Criteria andTnameNotIn(List<String> values) {
            addCriterion("tname not in", values, "tname");
            return (Criteria) this;
        }

        public Criteria andTnameBetween(String value1, String value2) {
            addCriterion("tname between", value1, value2, "tname");
            return (Criteria) this;
        }

        public Criteria andTnameNotBetween(String value1, String value2) {
            addCriterion("tname not between", value1, value2, "tname");
            return (Criteria) this;
        }

        public Criteria andTtelphoneIsNull() {
            addCriterion("ttelphone is null");
            return (Criteria) this;
        }

        public Criteria andTtelphoneIsNotNull() {
            addCriterion("ttelphone is not null");
            return (Criteria) this;
        }

        public Criteria andTtelphoneEqualTo(String value) {
            addCriterion("ttelphone =", value, "ttelphone");
            return (Criteria) this;
        }

        public Criteria andTtelphoneNotEqualTo(String value) {
            addCriterion("ttelphone <>", value, "ttelphone");
            return (Criteria) this;
        }

        public Criteria andTtelphoneGreaterThan(String value) {
            addCriterion("ttelphone >", value, "ttelphone");
            return (Criteria) this;
        }

        public Criteria andTtelphoneGreaterThanOrEqualTo(String value) {
            addCriterion("ttelphone >=", value, "ttelphone");
            return (Criteria) this;
        }

        public Criteria andTtelphoneLessThan(String value) {
            addCriterion("ttelphone <", value, "ttelphone");
            return (Criteria) this;
        }

        public Criteria andTtelphoneLessThanOrEqualTo(String value) {
            addCriterion("ttelphone <=", value, "ttelphone");
            return (Criteria) this;
        }

        public Criteria andTtelphoneLike(String value) {
            addCriterion("ttelphone like", value, "ttelphone");
            return (Criteria) this;
        }

        public Criteria andTtelphoneNotLike(String value) {
            addCriterion("ttelphone not like", value, "ttelphone");
            return (Criteria) this;
        }

        public Criteria andTtelphoneIn(List<String> values) {
            addCriterion("ttelphone in", values, "ttelphone");
            return (Criteria) this;
        }

        public Criteria andTtelphoneNotIn(List<String> values) {
            addCriterion("ttelphone not in", values, "ttelphone");
            return (Criteria) this;
        }

        public Criteria andTtelphoneBetween(String value1, String value2) {
            addCriterion("ttelphone between", value1, value2, "ttelphone");
            return (Criteria) this;
        }

        public Criteria andTtelphoneNotBetween(String value1, String value2) {
            addCriterion("ttelphone not between", value1, value2, "ttelphone");
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