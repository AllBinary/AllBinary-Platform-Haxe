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
package org.allbinary.business.user;

//import java.util.HashMap;
import org.allbinary.business.user.modules.configuration.UserConfigurationInterface;
import org.allbinary.business.user.role.UserRole;
import org.allbinary.data.tables.TableMappingInterface;
import org.allbinary.logic.communication.http.request.session.WeblisketSessionInterface;
import org.allbinary.logic.control.validate.ValidationInterface;

interface UserInterface extends TableMappingInterface extends ValidationInterface {
    function setUserName(value : String) : Void;

    function setPrefixName(value : String) : Void;

    function setFirstName(value : String) : Void;

    function setLastName(value : String) : Void;

    function setMiddleName(value : String) : Void;

    function setSuffixName(value : String) : Void;

    function setCompany(value : String) : Void;

    function setPositionAtCompany(value : String) : Void;

    function setMainEmail(value : String) : Void;

    function setSecondaryEmail(value : String) : Void;

    function setHomePhone(value : String) : Void;

    function setCellPhone(value : String) : Void;

    function setWorkPhone(value : String) : Void;

    function setOtherContact(value : String) : Void;

    function setElectronicContact(value : String) : Void;

    function setFax(value : String) : Void;

    function setRole(aRole : UserRole) : Void;

    function setEncryption(value : String) : Void;

    function setSecret(value : String) : Void;

    function setPassword(value : String) : Void;

    function setPermissions(value : String) : Void;

    function enable() : Void;

    function setEnable(enable : String) : Void;

    function getUserName() : String;

    function getPrefixName() : String;

    function getFirstName() : String;

    function getLastName() : String;

    function getMiddleName() : String;

    function getSuffixName() : String;

    function getCompany() : String;

    function getPositionAtCompany() : String;

    function getMainEmail() : String;

    function getSecondaryEmail() : String;

    function getHomePhone() : String;

    function getCellPhone() : String;

    function getWorkPhone() : String;

    function getOtherContact() : String;

    function getElectronicContact() : String;

    function getFax() : String;

    function getRole() : UserRole;

    function getEncryption() : String;

    function getSecret() : String;

    function getPassword() : String;

    function getPermissions() : String;

    function getUserConfigurationInterface() : UserConfigurationInterface;

    function setUserConfigurationInterface(userConfigurationInterface : UserConfigurationInterface) : Void;

    function toPasswordHashMap() : HashMap;

    function validateSession(weblisketSession : WeblisketSessionInterface) : Void;

    function updateSession(weblisketSession : WeblisketSessionInterface) : Void;

    function isSessionValid() : Null<Bool>;

}

