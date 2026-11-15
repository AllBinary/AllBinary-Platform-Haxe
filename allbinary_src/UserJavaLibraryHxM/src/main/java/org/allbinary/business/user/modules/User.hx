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
package org.allbinary.business.user.modules;

//import java.util.Calendar;
//import java.util.HashMap;
import org.allbinary.util.BasicArrayList;
import org.allbinary.util.BasicArrayListD;
//import javax.servlet.http.HttpServletRequest;
import org.allbinary.business.context.modules.storefront.StoreFrontData;
import org.allbinary.business.entry.EntryData;
import org.allbinary.business.user.UserData;
import org.allbinary.business.user.UserInterface;
import org.allbinary.business.user.modules.configuration.UserConfigurationDomDocumentMapping;
import org.allbinary.business.user.modules.configuration.UserConfigurationInterface;
import org.allbinary.business.user.modules.configuration.UserConfigurationInterfaceFactory;
import org.allbinary.business.user.password.Password;
import org.allbinary.business.user.role.UserRole;
import org.allbinary.business.user.role.UserRoleB;
import org.allbinary.business.user.role.UserRoleData;
import org.allbinary.business.user.username.UserName;
import org.allbinary.logic.StdUtil;
import org.allbinary.logic.communication.http.request.RequestParams;
import org.allbinary.logic.communication.http.request.session.WeblisketSessionData;
import org.allbinary.logic.communication.http.request.session.WeblisketSessionInterface;
import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.logic.string.StringMaker;
import org.allbinary.logic.string.StringUtil;
import org.allbinary.logic.string.StringValidationUtil;
import org.allbinary.string.CommonStrings;
import org.w3c.dom.Document;
import org.w3c.dom.Node;

class User implements UserInterface {
    public final logUtil : LogUtil = LogUtil.getInstance();
    private var userName : String = null;
    private var prefixName : String = null;
    private var firstName : String = null;
    private var lastName : String = null;
    private var middleName : String = null;
    private var suffixName : String = null;
    private var company : String = null;
    private var positionAtCompany : String = null;
    private var mainEmail : String = null;
    private var secondaryEmail : String = null;
    private var homePhone : String = null;
    private var cellPhone : String = null;
    private var workPhone : String = null;
    private var otherContact : String = null;
    private var electronicDevice : String = null;
    private var fax : String = null;
    private var role : UserRole = null;
    private var encryption : String = null;
    private var secret : String = null;
    private var password : Password;
    private var enable : String = null;
    private var permissions : String = null;
    private var userConfigurationInterface : UserConfigurationInterface;
    public function new() {
        this.userConfigurationInterface = UserConfigurationInterfaceFactory.getInstance();
        this.password = new Password(StringUtil.getInstance().EMPTY_STRING);
    }

    // Java overloaded constructor: Haxe allows one constructor
    public function new(request : HttpServletRequest) {
        this.getFormData(new RequestParams(request).toHashMap());
        this.userConfigurationInterface = UserConfigurationInterfaceFactory.getInstance(this.getRole());
    }

    // Java overloaded constructor: Haxe allows one constructor
    public function new(userHashMap : HashMap) {
        this.getFormData(userHashMap);
        this.userConfigurationInterface = UserConfigurationInterfaceFactory.getInstance(this.getRole());
    }

    // throws Exception
    public function getFormData(userHashMap : HashMap) : Void {
        this.userName = new UserName(userHashMap).get();
        final stringUtil : StringUtil = StringUtil.getInstance();
        var passwordString : String = stringUtil.getNonNull((cast userHashMap.get(UserData.PASSWORD) : String));
        final stringValidationUtil : StringValidationUtil = StringValidationUtil.getInstance();
        if (stringValidationUtil.isEmpty(this.userName) && stringValidationUtil.isEmpty(passwordString)) {
            this.userName = stringUtil.getNonNull((cast userHashMap.get(WeblisketSessionData.REMOVABLEUSERNAME) : String));
            passwordString = stringUtil.getNonNull((cast userHashMap.get(WeblisketSessionData.REMOVABLEPASSWORD) : String));
        }
        var encryption : String = stringUtil.getNonNull((cast userHashMap.get(EntryData.getInstance().ENCRYPTION) : String));
        var secret : String = stringUtil.getNonNull((cast userHashMap.get(UserData.SECRET) : String));
        this.password = new Password(passwordString);
        this.prefixName = stringUtil.getNonNull((cast userHashMap.get(UserData.PREFIXNAME) : String));
        this.firstName = stringUtil.getNonNull((cast userHashMap.get(UserData.FIRSTNAME) : String));
        this.lastName = stringUtil.getNonNull((cast userHashMap.get(UserData.LASTNAME) : String));
        this.middleName = stringUtil.getNonNull((cast userHashMap.get(UserData.MIDDLENAME) : String));
        this.suffixName = stringUtil.getNonNull((cast userHashMap.get(UserData.SUFFIXNAME) : String));
        this.company = stringUtil.getNonNull((cast userHashMap.get(UserData.COMPANY) : String));
        this.positionAtCompany = stringUtil.getNonNull((cast userHashMap.get(UserData.POSITIONATCOMPANY) : String));
        this.mainEmail = stringUtil.getNonNull((cast userHashMap.get(UserData.MAINEMAIL) : String));
        this.secondaryEmail = stringUtil.getNonNull((cast userHashMap.get(UserData.SECONDARYEMAIL) : String));
        this.homePhone = stringUtil.getNonNull((cast userHashMap.get(UserData.HOMEPHONE) : String));
        this.cellPhone = stringUtil.getNonNull((cast userHashMap.get(UserData.CELLPHONE) : String));
        this.workPhone = stringUtil.getNonNull((cast userHashMap.get(UserData.WORKPHONE) : String));
        this.otherContact = stringUtil.getNonNull((cast userHashMap.get(UserData.OTHERCONTACT) : String));
        this.electronicDevice = stringUtil.getNonNull((cast userHashMap.get(UserData.ELECTRONICDEVICE) : String));
        this.fax = stringUtil.getNonNull((cast userHashMap.get(UserData.FAX) : String));
        this.role = UserRoleB.getRole((cast userHashMap.get(Std.string(UserRoleData.NAME)) : String));
        this.permissions = stringUtil.getNonNull((cast userHashMap.get(UserData.PERMISSIONS) : String));
        if (!stringValidationUtil.isEmpty(this.permissions) && Reflect.compare(this.permissions, StoreFrontData.getInstance().NAME) == 0) {
            this.permissions = stringUtil.getNonNull((cast userHashMap.get(StoreFrontData.getInstance().NAME) : String));
        } else if (this.permissions == null) {
            this.permissions = "No Permissions";
        }
        this.enable = stringUtil.getNonNull((cast userHashMap.get(EntryData.getInstance().ENABLE) : String));
    }

    public function isValid() : Null<Bool> {
        try {
            var valid : Null<Bool> = true;
            if (!UserName.getInstance().isValid(this.userName)) {
                valid = false;
            }
            if (!this.password.isValid()) {
                valid = false;
            }
            final stringValidationUtil : StringValidationUtil = StringValidationUtil.getInstance();
            if (!stringValidationUtil.isValidRequired(this.firstName, 1, UserData.MAXLEN)) {
                valid = false;
            }
            if (!stringValidationUtil.isValidRequired(this.lastName, 1, UserData.MAXLEN)) {
                valid = false;
            }
            if (!stringValidationUtil.isValidRequired(this.mainEmail, 1, UserData.MAXLEN) || this.mainEmail.indexOf("@") == -1) {
                valid = false;
            }
            return valid;
        } catch (e : haxe.Exception) {
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().VALIDATIONERROR)) {
                final commonStrings : CommonStrings = CommonStrings.getInstance();
                this.logUtil.put("Failed to validate form", this, commonStrings.IS_VALID, e);
            }
            return false;
        }
    }

    public function validationInfo() : String {
        try {
            final stringValidationUtil : StringValidationUtil = StringValidationUtil.getInstance();
            final stringBuffer : StringMaker = new StringMaker();
            stringBuffer.append(UserName.getValidationInfo(this.userName));
            stringBuffer.append(this.password.getValidationInfo());
            if (!stringValidationUtil.isValidRequired(this.firstName, 1, UserData.MAXLEN)) {
                stringBuffer.append("Please enter a valid First Name.<br />");
            }
            if (!stringValidationUtil.isValidRequired(this.lastName, 1, UserData.MAXLEN)) {
                stringBuffer.append("Please enter a valid Last Name.<br />");
            }
            if (!stringValidationUtil.isValidRequired(this.mainEmail, 1, UserData.MAXLEN) || this.mainEmail.indexOf("@") == -1) {
                stringBuffer.append("Please enter a valid email address.<br />");
            }
            return Std.string(stringBuffer);
        } catch (e : haxe.Exception) {
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().SQLTAGSERROR)) {
                this.logUtil.put("Failed to generate validation error info", this, "validationInfo()", e);
            }
            return "Error Validating Form";
        }
    }

    public function setUserName(value : String) : Void {
        this.userName = value;
    }

    public function setPrefixName(value : String) : Void {
        this.prefixName = value;
    }

    public function setFirstName(value : String) : Void {
        this.firstName = value;
    }

    public function setLastName(value : String) : Void {
        this.lastName = value;
    }

    public function setMiddleName(value : String) : Void {
        this.middleName = value;
    }

    public function setSuffixName(value : String) : Void {
        this.suffixName = value;
    }

    public function setCompany(value : String) : Void {
        this.company = value;
    }

    public function setPositionAtCompany(value : String) : Void {
        this.positionAtCompany = value;
    }

    public function setMainEmail(value : String) : Void {
        this.mainEmail = value;
    }

    public function setSecondaryEmail(value : String) : Void {
        this.secondaryEmail = value;
    }

    public function setHomePhone(value : String) : Void {
        this.homePhone = value;
    }

    public function setCellPhone(value : String) : Void {
        this.cellPhone = value;
    }

    public function setWorkPhone(value : String) : Void {
        this.workPhone = value;
    }

    public function setOtherContact(value : String) : Void {
        this.otherContact = value;
    }

    public function setElectronicContact(value : String) : Void {
        this.electronicDevice = value;
    }

    public function setFax(value : String) : Void {
        this.fax = value;
    }

    public function setRole(role : UserRole) : Void {
        this.role = role;
    }

    public function setPermissions(value : String) : Void {
        this.permissions = value;
    }

    public function setEncryption(value : String) : Void {
        this.encryption = value;
    }

    public function setSecret(value : String) : Void {
        this.secret = value;
    }

    public function setPassword(value : String) : Void {
        this.password.set(value);
    }

    public function enable() : Void {
        this.setEnable("Yes");
    }

    public function disable() : Void {
        this.setEnable("No");
    }

    public function setEnable(enable : String) : Void {
        this.enable = enable;
    }

    public function getUserName() : String {
        return this.userName;
    }

    public function getPrefixName() : String {
        return this.prefixName;
    }

    public function getFirstName() : String {
        return this.firstName;
    }

    public function getLastName() : String {
        return this.lastName;
    }

    public function getMiddleName() : String {
        return this.middleName;
    }

    public function getSuffixName() : String {
        return this.suffixName;
    }

    public function getCompany() : String {
        return this.company;
    }

    public function getPositionAtCompany() : String {
        return this.positionAtCompany;
    }

    public function getMainEmail() : String {
        return this.mainEmail;
    }

    public function getSecondaryEmail() : String {
        return this.secondaryEmail;
    }

    public function getHomePhone() : String {
        return this.homePhone;
    }

    public function getCellPhone() : String {
        return this.cellPhone;
    }

    public function getWorkPhone() : String {
        return this.workPhone;
    }

    public function getOtherContact() : String {
        return this.otherContact;
    }

    public function getElectronicContact() : String {
        return this.electronicDevice;
    }

    public function getFax() : String {
        return this.fax;
    }

    public function getRole() : UserRole {
        return this.role;
    }

    public function getPermissions() : String {
        return this.permissions;
    }

    public function getEncryption() : String {
        return this.encryption;
    }

    public function getSecret() : String {
        return this.secret;
    }

    public function getPassword() : String {
        return this.password.get();
    }

    // throws Exception
    public function toVector() : BasicArrayList {
        var values : BasicArrayList = new BasicArrayListD();
        values.add(this.userName);
        values.add(this.prefixName);
        values.add(this.firstName);
        values.add(this.lastName);
        values.add(this.middleName);
        values.add(this.suffixName);
        values.add(this.company);
        values.add(this.positionAtCompany);
        values.add(this.mainEmail);
        values.add(this.secondaryEmail);
        values.add(this.homePhone);
        values.add(this.cellPhone);
        values.add(this.workPhone);
        values.add(this.otherContact);
        values.add(this.electronicDevice);
        values.add(this.fax);
        values.add(Std.string(this.getRole()));
        var userConfigurationDomDocumentMapping : UserConfigurationDomDocumentMapping = new UserConfigurationDomDocumentMapping(this.getUserConfigurationInterface());
        values.add(userConfigurationDomDocumentMapping.toDomDocumentString());
        values.add(this.permissions);
        values.addAllList(this.password.toVector(this.secret));
        values.add(this.enable);
        var calendar : Calendar = Calendar.getInstance();
        var time : String = Std.string(calendar.getTimeInMillis());
        values.add(time);
        values.add(time);
        return values;
    }

    // throws Exception
    public function toHashMap() : HashMap {
        var values : HashMap = StdUtil.getInstance().createHashMap();
        values.put(UserData.USERNAME, userName);
        values.put(UserData.PREFIXNAME, prefixName);
        values.put(UserData.FIRSTNAME, firstName);
        values.put(UserData.LASTNAME, lastName);
        values.put(UserData.MIDDLENAME, middleName);
        values.put(UserData.SUFFIXNAME, suffixName);
        values.put(UserData.COMPANY, company);
        values.put(UserData.POSITIONATCOMPANY, positionAtCompany);
        values.put(UserData.MAINEMAIL, mainEmail);
        values.put(UserData.SECONDARYEMAIL, secondaryEmail);
        values.put(UserData.HOMEPHONE, homePhone);
        values.put(UserData.CELLPHONE, cellPhone);
        values.put(UserData.WORKPHONE, workPhone);
        values.put(UserData.OTHERCONTACT, otherContact);
        values.put(UserData.ELECTRONICDEVICE, electronicDevice);
        values.put(UserData.FAX, fax);
        if (this.getRole() != null) {
            values.put(Std.string(UserRoleData.NAME), Std.string(this.getRole()));
        }
        var userConfigurationDomDocumentMapping : UserConfigurationDomDocumentMapping = new UserConfigurationDomDocumentMapping(this.getUserConfigurationInterface());
        values.put(UserData.CONFIGURATION, userConfigurationDomDocumentMapping.toDomDocumentString());
        values.put(UserData.PERMISSIONS, this.permissions);
        values.putAll(this.password.toHashMap(this.secret));
        values.put(EntryData.getInstance().ENABLE, this.enable);
        var calendar : Calendar = Calendar.getInstance();
        var time : String = Std.string(calendar.getTimeInMillis());
        values.put(EntryData.getInstance().LASTMODIFIED, time);
        return values;
    }

    public function toPasswordHashMap() : HashMap {
        return this.password.toHashMap(this.secret);
    }

    public function validateSession(weblisketSession : WeblisketSessionInterface) : Void {
        weblisketSession.setAuthenticated();
        weblisketSession.setRole(this.getRole());
        weblisketSession.setUserName(this.getUserName());
    }

    public function updateSession(weblisketSession : WeblisketSessionInterface) : Void {
    }

    public function isSessionValid() : Null<Bool> {
        return true;
    }

    // throws Exception
    public function getKey() : Any {
        return (cast this.userName : Any);
    }

    public function toValidationInfoDoc() : Document {
        return null;
    }

    public function toValidationInfoNode(document : Document) : Node {
        return null;
    }

    public function getUserConfigurationInterface() : UserConfigurationInterface {
        return this.userConfigurationInterface;
    }

    public function setUserConfigurationInterface(userConfigurationInterface : UserConfigurationInterface) : Void {
        this.userConfigurationInterface = userConfigurationInterface;
    }

}

