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
package org.allbinary.business.init.db;


interface DatabaseConnectionInfoInterface {
    function getUrl() : String;

    function getJdbcDriver() : String;

    function getName() : String;

    function getUserName() : String;

    function getPassword() : String;

    function getHost() : String;

    function getSchema() : String;

    function getServer() : String;

    function getPort() : String;

    function setJdbcDriver(value : String) : Void;

    function setName(value : String) : Void;

    function setUserName(value : String) : Void;

    function setPassword(value : String) : Void;

    function setSchema(value : String) : Void;

    function setServer(value : String) : Void;

    function setPort(value : String) : Void;

    function getUserNameKey() : String;

    function getPasswordKey() : String;

}

