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
package org.allbinary.business.user.commerce.money.payment.gateway;

//import java.util.HashMap;
import org.allbinary.util.BasicArrayList;
import org.allbinary.util.BasicArrayListD;
import org.allbinary.data.tables.TableMappingInterface;

interface PaymentGatewayInterface extends TableMappingInterface {
    function getEnable() : String;

    function getStoreName() : String;

    function getName() : String;

    function getPaymentMethod() : String;

    function getMode() : String;

    function getTestProtocol() : String;

    function getTestServer() : String;

    function getTestPort() : String;

    function getTestPath() : String;

    function getServerProtocol() : String;

    function getServer() : String;

    function getServerPort() : String;

    function getServerPath() : String;

    function getUserName() : String;

    function getPassword() : String;

    function getProxyProtocol() : String;

    function getProxyServer() : String;

    function getProxyPath() : String;

    function getProxyPort() : String;

    function getProxyUserName() : String;

    function getProxyPassword() : String;

    function getTimeout() : String;

    function getProxyTimeout() : String;

    function getSpecial1() : String;

    function getSpecial2() : String;

    function getSpecial3() : String;

    function getSpecial4() : String;

    function getSpecial5() : String;

    function getSpecial6() : String;

    function getSpecial7() : String;

    function getSpecial8() : String;

    function getSpecial9() : String;

    function getLastModified() : String;

    function getTimeEntered() : String;

    function setEnable(value : String) : Void;

    function setStoreName(value : String) : Void;

    function setName(value : String) : Void;

    function setPaymentMethod(value : String) : Void;

    function setMode(value : String) : Void;

    function setTestProtocol(value : String) : Void;

    function setTestServer(value : String) : Void;

    function setTestPort(value : String) : Void;

    function setTestPath(value : String) : Void;

    function setServerProtocol(value : String) : Void;

    function setServer(value : String) : Void;

    function setServerPort(value : String) : Void;

    function setServerPath(value : String) : Void;

    function setUserName(value : String) : Void;

    function setPassword(value : String) : Void;

    function setProxyProtocol(value : String) : Void;

    function setProxyServer(value : String) : Void;

    function setProxyPath(value : String) : Void;

    function setProxyPort(value : String) : Void;

    function setProxyUserName(value : String) : Void;

    function setProxyPassword(value : String) : Void;

    function setTimeout(value : String) : Void;

    function setProxyTimeout(value : String) : Void;

    function setSpecial1(value : String) : Void;

    function setSpecial2(value : String) : Void;

    function setSpecial3(value : String) : Void;

    function setSpecial4(value : String) : Void;

    function setSpecial5(value : String) : Void;

    function setSpecial6(value : String) : Void;

    function setSpecial7(value : String) : Void;

    function setSpecial8(value : String) : Void;

    function setSpecial9(value : String) : Void;

    function setLastModified(value : String) : Void;

    function setTimeEntered(value : String) : Void;

    // throws Exception
    function toHashMap(isEncrypted : Bool) : HashMap;

    function toVector(isEncrypted : Bool) : BasicArrayList;

}

