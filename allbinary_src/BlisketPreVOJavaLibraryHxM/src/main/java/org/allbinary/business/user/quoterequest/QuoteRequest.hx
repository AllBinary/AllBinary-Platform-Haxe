/*
 *
 * AllBinary Open License Version 1
 * Copyright (c) 2011 AllBinary
 * 
 * By agreeing to this license you and any business entity you represent are
 * legally bound to the AllBinary Open License Version 1 legal agreement.
 * 
 * You may obtain the AllBinary Open License Version 1 legal agreement from
 * AllBinary or the root directory of AllBinary's AllBinary Platform repository.
 * 
 * Created By: Travis Berthelot
 *  
 */
// Generated Code Do Not Modify
package org.allbinary.business.user.quoterequest;

//import java.util.Calendar;
//import java.util.HashMap;
import org.allbinary.util.BasicArrayList;
import org.allbinary.util.BasicArrayListD;
//import javax.servlet.http.HttpServletRequest;
import org.allbinary.business.entry.EntryData;
import org.allbinary.business.quoterequest.QuoteRequestData;
import org.allbinary.business.user.UserData;
import org.allbinary.data.generator.QuoteRequestIdGenerator;
import org.allbinary.logic.StdUtil;
import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.logic.communication.sql.AbSqlData;
import org.allbinary.logic.string.StringMaker;
import org.allbinary.logic.string.StringUtil;
import org.allbinary.string.CommonStrings;

class QuoteRequest {
    public final logUtil : LogUtil = LogUtil.getInstance();
    public final commonStrings : CommonStrings = CommonStrings.getInstance();
    private var id : String;
    private var userName : String = null;
    private var projectInfo : String = null;
    private var userComments : String = null;
    private var budget : String = null;
    private var timeFrame : String = null;
    private var comments : String = null;
    public function new(userName : String, request : HttpServletRequest) {
        var quoteRequestData : QuoteRequestData = QuoteRequestData.getInstance();
        this.id = new QuoteRequestIdGenerator().getNext();
        this.setUserName(userName);
        this.setProjectInfo((cast request.getParameter(quoteRequestData.PROJECT_INFO) : String));
        this.setUserComments((cast request.getParameter(quoteRequestData.CUSTOMER_COMMENTS) : String));
        this.setBudget((cast request.getParameter(quoteRequestData.BUDGET) : String));
        this.setTimeFrame((cast request.getParameter(quoteRequestData.TIMEFRAME) : String));
        this.setComments((cast request.getParameter(quoteRequestData.COMMENTS) : String));
        if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().TAGHELPER)) {
            this.logUtil.putF("Created with: " + this.toHashMap(), this, this.commonStrings.CONSTRUCTOR);
        }
    }

    // Java overloaded constructor: Haxe allows one constructor
    public function new(hashMap : HashMap) {
        var quoteRequestData : QuoteRequestData = QuoteRequestData.getInstance();
        this.id = (cast hashMap.get(quoteRequestData.ID) : String);
        this.setUserName((cast hashMap.get(UserData.USERNAME) : String));
        this.setProjectInfo((cast hashMap.get(quoteRequestData.PROJECT_INFO) : String));
        this.setUserComments((cast hashMap.get(quoteRequestData.CUSTOMER_COMMENTS) : String));
        this.setBudget((cast hashMap.get(quoteRequestData.BUDGET) : String));
        this.setTimeFrame((cast hashMap.get(quoteRequestData.TIMEFRAME) : String));
        this.setComments((cast hashMap.get(quoteRequestData.COMMENTS) : String));
        if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().TAGHELPER)) {
            this.logUtil.putF("Created with: " + this.toHashMap(), this, this.commonStrings.CONSTRUCTOR);
        }
    }

    public function isValid() : Null<Bool> {
        try {
            var valid : Null<Bool> = true;
            if (this.userName == null || this.userName.length < 4 || this.userName.length > 250) {
                valid = false;
            }
            if (this.projectInfo == null || this.projectInfo.length < 0 || this.projectInfo.length > AbSqlData.MAXBLOB) {
                valid = false;
            }
            if (this.userComments == null || this.userComments.length < 0 || this.userComments.length > AbSqlData.MAXBLOB) {
                valid = false;
            }
            if (this.budget == null || this.budget.length < 0 || this.budget.length > AbSqlData.MAXBLOB) {
                valid = false;
            }
            if (this.timeFrame == null || this.timeFrame.length < 0 || this.timeFrame.length > AbSqlData.MAXBLOB) {
                valid = false;
            }
            if (this.comments == null || this.comments.length < 0 || this.comments.length > AbSqlData.MAXBLOB) {
                valid = false;
            }
            return valid;
        } catch (e : haxe.Exception) {
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().SQLTAGSERROR)) {
                this.logUtil.put("Failed to validate form", this, this.commonStrings.IS_VALID, e);
            }
            return false;
        }
    }

    public function validationInfo() : String {
        try {
            var stringBuffer : StringMaker = new StringMaker();
            if (this.userName == null || this.userName.length < 4 || this.userName.length > 250) {
                stringBuffer.append("Please enter a User Name with more than 4 characters.<br>");
            }
            if (this.projectInfo == null || this.projectInfo.length < 0 || this.projectInfo.length > AbSqlData.MAXBLOB) {
                stringBuffer.append("Please enter Project Info with less than " + AbSqlData.MAXBLOB + " characters.<br>");
            }
            if (this.userComments == null || this.userComments.length < 0 || this.userComments.length > AbSqlData.MAXBLOB) {
                stringBuffer.append("Please enter User Comments with less than " + AbSqlData.MAXBLOB + " characters.<br>");
            }
            if (this.budget == null || this.budget.length < 0 || this.budget.length > AbSqlData.MAXBLOB) {
                stringBuffer.append("Please enter Budget with less than " + AbSqlData.MAXBLOB + " characters.<br>");
            }
            if (this.timeFrame == null || this.timeFrame.length < 0 || this.timeFrame.length > AbSqlData.MAXBLOB) {
                stringBuffer.append("Please enter time frame with less than " + AbSqlData.MAXBLOB + " characters.<br>");
            }
            if (this.comments == null || this.comments.length < 0 || this.comments.length > AbSqlData.MAXBLOB) {
                stringBuffer.append("Please enter comments with less than " + AbSqlData.MAXBLOB + " characters.<br>");
            }
            return stringBuffer.toString();
        } catch (e : haxe.Exception) {
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().SQLTAGSERROR)) {
                this.logUtil.put("Failed to generate validation error info", this, "validationInfo()", e);
            }
            return "Error Validating Form";
        }
    }

    public function toVector() : BasicArrayList {
        var values : BasicArrayList = new BasicArrayListD();
        values.add(this.id);
        values.add(this.userName);
        values.add(this.projectInfo);
        values.add(this.userComments);
        values.add(this.budget);
        values.add(this.timeFrame);
        values.add(this.comments);
        var calendar : Calendar = Calendar.getInstance();
        var time : String = calendar.getTimeInMillis().toString();
        values.add(time);
        values.add(time);
        return values;
    }

    public function toHashMap() : HashMap {
        var quoteRequestData : QuoteRequestData = QuoteRequestData.getInstance();
        var values : HashMap = StdUtil.getInstance().createHashMap();
        values.put(UserData.USERNAME, userName);
        values.put(quoteRequestData.PROJECT_INFO, this.projectInfo);
        values.put(quoteRequestData.CUSTOMER_COMMENTS, this.userComments);
        values.put(quoteRequestData.BUDGET, this.budget);
        values.put(quoteRequestData.TIMEFRAME, this.timeFrame);
        values.put(quoteRequestData.COMMENTS, this.comments);
        var calendar : Calendar = Calendar.getInstance();
        var time : String = calendar.getTimeInMillis().toString();
        values.put(EntryData.getInstance().LASTMODIFIED, time);
        return values;
    }

    public function setUserName(value : String) : Void {
        this.userName = value;
    }

    public function setProjectInfo(value : String) : Void {
        this.projectInfo = value;
    }

    public function setUserComments(value : String) : Void {
        this.userComments = value;
    }

    public function setBudget(value : String) : Void {
        this.budget = value;
    }

    public function setTimeFrame(value : String) : Void {
        this.timeFrame = value;
    }

    public function setComments(value : String) : Void {
        this.comments = value;
        final stringUtil : StringUtil = StringUtil.getInstance();
        if (this.comments == null) {
            this.comments = stringUtil.EMPTY_STRING;
        }
    }

    public function getUserName() : String {
        return this.userName;
    }

    public function getProjectInfo() : String {
        return this.projectInfo;
    }

    public function getUserComments() : String {
        return this.userComments;
    }

    public function getBudget() : String {
        return this.budget;
    }

    public function getTimeFrame() : String {
        return this.timeFrame;
    }

    public function getComments() : String {
        return this.comments;
    }

}

