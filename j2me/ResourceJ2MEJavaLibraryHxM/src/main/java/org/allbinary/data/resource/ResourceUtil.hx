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
package org.allbinary.data.resource;

//import java.io.InputStream;
import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.logic.string.StringMaker;
import org.allbinary.string.CommonSeps;
import org.allbinary.string.CommonStrings;

//J2ME
class ResourceUtil {
    private static var instance : ResourceUtil = new ResourceUtil();
    public static function getInstance() : ResourceUtil {
        return ResourceUtil.instance;
    }

    public final logUtil : LogUtil = LogUtil.getInstance();
    public function new() {
    }

    public function setLoadingPaths(path : String, ext : String) : Void {
        this.logUtil.putF(CommonStrings.getInstance().NOT_IMPLEMENTED, this, "setLoadingPaths");
    }

    // throws Exception
    public function getResourceAsStream(resource : String) : InputStream {
        var inputStream : InputStream = Type.getClass(resource).getResourceAsStream(resource);
        if (inputStream == null) {
            inputStream = this.getResourceAsStreamAtStart(resource, 2);
            if (inputStream == null) {
                inputStream = this.getResourceAsStreamAtStart(resource, 1);
                if (inputStream == null) {
                    final stringMaker : StringMaker = new StringMaker();
                    final index : Int = resource.lastIndexOf("/".code);
                    var resourcePath : String = resource.substring(index + 1);
                    inputStream = Type.getClass(resource).getResourceAsStream(resourcePath);
                    if (inputStream == null) {
                        resourcePath = resource.substring(index);
                        inputStream = Type.getClass(resource).getResourceAsStream(resourcePath);
                        if (inputStream == null) {
                            final RES : String = "res";
                            resourcePath = stringMaker.append(RES).append(resource.substring(index)).toString();
                            inputStream = Type.getClass(resource).getResourceAsStream(resourcePath);
                            if (inputStream == null) {
                                stringMaker.delete(0, stringMaker.length());
                                resourcePath = stringMaker.append("/").append(RES).append(resource.substring(index)).toString();
                                inputStream = Type.getClass(resource).getResourceAsStream(resourcePath);
                                final COLON : String = CommonSeps.getInstance().COLON;
                                if (inputStream == null) {
                                    stringMaker.delete(0, stringMaker.length());
                                    resourcePath = stringMaker.append(RES).append(COLON).append(resource.substring(index)).toString();
                                    inputStream = Type.getClass(resource).getResourceAsStream(resourcePath);
                                    if (inputStream == null) {
                                        stringMaker.delete(0, stringMaker.length());
                                        resourcePath = stringMaker.append(RES).append(COLON).append(resource.substring(index + 1)).toString();
                                        inputStream = Type.getClass(resource).getResourceAsStream(resourcePath);
                                        if (inputStream == null) {
                                            final RESOURCE_STRING : String = "resource";
                                            stringMaker.delete(0, stringMaker.length());
                                            resourcePath = stringMaker.append(RESOURCE_STRING).append(COLON).append(resource.substring(index)).toString();
                                            inputStream = Type.getClass(resource).getResourceAsStream(resourcePath);
                                            if (inputStream == null) {
                                                stringMaker.delete(0, stringMaker.length());
                                                resourcePath = stringMaker.append(RESOURCE_STRING).append(COLON).append(resource.substring(index + 1)).toString();
                                                inputStream = Type.getClass(resource).getResourceAsStream(resourcePath);
                                                if (inputStream == null) {
                                                    stringMaker.delete(0, stringMaker.length());
                                                    throw new haxe.Exception(stringMaker.append("Unable to obtain: ").append(resource).toString());
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
        return inputStream;
    }

    // throws Exception
    private function getResourceAsStreamAtStart(resource : String, startIndex : Int) : InputStream {
        final stringMaker : StringMaker = new StringMaker();
        var index : Int = resource.indexOf(CommonSeps.getInstance().COLON);
        final resourcePath : String = resource.substring(index + startIndex);
        final inputStream : InputStream = Type.getClass(resource).getResourceAsStream(resourcePath);
        if (inputStream != null) {
            return inputStream;
        }
        return inputStream;
    }

    public function addResource(resource : String, value : Null<Int>) : Void {
    }

}

