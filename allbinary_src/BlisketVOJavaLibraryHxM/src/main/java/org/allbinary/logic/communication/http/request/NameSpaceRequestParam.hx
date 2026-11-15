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
package org.allbinary.logic.communication.http.request;

//import java.util.HashMap;
import org.allbinary.logic.StdUtil;
import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.logic.string.StringUtil;
import org.allbinary.logic.string.tokens.Tokenizer;
import org.allbinary.logic.visual.dhtml.html.name.HtmlNameMathData;
import org.allbinary.util.BasicArrayList;
import org.allbinary.util.BasicArrayListD;

class NameSpaceRequestParam {
    public final logUtil : LogUtil = LogUtil.getInstance();
    private var nameSpaceVector : BasicArrayList;
    private var nameSpacePropertiesHashMap : HashMap;
    private var value : String;
    public function new(nameSpace : String, value : String) {
        this.nameSpaceVector = new BasicArrayListD();
        this.nameSpacePropertiesHashMap = StdUtil.getInstance().createHashMap();
        this.value = value;
        var beginIndex : Int = nameSpace.indexOf(NameSpaceRequestParamData.NAME);
        if (beginIndex < 0) {
            throw new haxe.Exception("Not a NameSpaceRequest");
        }
        var packages : String = nameSpace.substring(beginIndex + NameSpaceRequestParamData.NAME.length() + NameSpaceRequestParamData.SEP.length());
        var sepTokenizer : Tokenizer = new Tokenizer(NameSpaceRequestParamData.SEP);
        var nameSpaceWithPropertiesVector : BasicArrayList = sepTokenizer.getTokensFromString(packages, new BasicArrayListD());
        if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().HTTPREQUEST)) {
            this.logUtil.putF("\nSep Tokens: " + nameSpaceWithPropertiesVector.toString(), this, "NameSpaceRequestParam()");
        }
        var nameSpaceAndPropertiesTokenizer : Tokenizer = new Tokenizer(NameSpaceRequestParamData.PROPERTIES);
        var packageIndex : Int = 0;
        final list : BasicArrayList = new BasicArrayListD();
        var index : Int = 0;
        var size : Int = nameSpaceWithPropertiesVector.size();
        while (index < size) {
            var nameSpaceWithProperties : String = (cast nameSpaceWithPropertiesVector.get(index++) : String);
            list.clear();
            var nameSpaceAndPropertiesVector : BasicArrayList = nameSpaceAndPropertiesTokenizer.getTokensFromString(nameSpaceWithProperties, list);
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().HTTPREQUEST)) {
                this.logUtil.putF("\nPackageName and PackageName Properties Tokens: " + nameSpaceAndPropertiesVector.toString(), this, "NameSpaceRequestParam()");
            }
            if (nameSpaceAndPropertiesVector.size() > 0) {
                var packageName : String = (cast nameSpaceAndPropertiesVector.get(0) : String);
                if (packageName == null) {
                    throw new haxe.Exception("Package Name Is Null");
                }
                this.nameSpaceVector.add(packageName);
                if (nameSpaceAndPropertiesVector.size() > 1) {
                    var properties : String = (cast nameSpaceAndPropertiesVector.get(1) : String);
                    var packagePropertiesHashMap : HashMap = this.generatePackagePropertiesHashMap(properties);
                    this.nameSpacePropertiesHashMap.put(Std.string(packageIndex), packagePropertiesHashMap);
                }
                packageIndex++;
            }
        }
        if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().HTTPREQUEST)) {
            this.logUtil.putF("NameSpace: " + this.nameSpaceVector.toString(), this, "NameSpaceRequestParam()");
        }
    }

    public function getPackages() : BasicArrayList {
        if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().HTTPREQUEST)) {
            this.logUtil.putF("NameSpace: " + this.nameSpaceVector.toString(), this, "getPackages()");
        }
        return this.nameSpaceVector;
    }

    public function getPackageProperties(packageIndex : Int) : HashMap {
        var packagePropertiesHashMap : HashMap = (cast this.nameSpacePropertiesHashMap.get(Std.string(packageIndex)) : HashMap);
        if (packagePropertiesHashMap == null) {
            packagePropertiesHashMap = StdUtil.getInstance().createHashMap();
        }
        if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().HTTPREQUEST)) {
            this.logUtil.putF("Package Properties: " + packagePropertiesHashMap.toString(), this, "getPackagesProperties()");
        }
        return packagePropertiesHashMap;
    }

    public function getValue() : String {
        if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().HTTPREQUEST)) {
            this.logUtil.putF("\nValue: " + this.value, this, "getValue()");
        }
        return this.value;
    }

    // throws Exception
    private function generatePackagePropertiesHashMap(properties : String) : HashMap {
        var propertiesTokenizer : Tokenizer = new Tokenizer(NameSpaceRequestParamData.PROPERTIESSEPARATOR);
        var packagePropertiesHashMap : HashMap = StdUtil.getInstance().createHashMap();
        var propertyVector : BasicArrayList = propertiesTokenizer.getTokensFromString(properties, new BasicArrayListD());
        final list : BasicArrayList = new BasicArrayListD();
        final propertyTokenizer : Tokenizer = new Tokenizer(HtmlNameMathData.getInstance().EQUALS);
        var index : Int = 0;
        var size : Int = propertyVector.size();
        while (index < size) {
            var property : String = (cast propertyVector.get(index) : String);
            list.clear();
            var propertyNameValueVector : BasicArrayList = propertyTokenizer.getTokensFromString(property, list);
            var index2 : Int = 0;
            while (index2 < propertyNameValueVector.size()) {
                var propertyName : String = (cast propertyNameValueVector.get(index2++) : String);
                if (propertyNameValueVector.size() > 1) {
                    var propertyValue : String = (cast propertyNameValueVector.get(index2++) : String);
                    if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().HTTPREQUEST)) {
                        this.logUtil.putF("\nProperty Name: " + propertyName + "\nProperty Value: " + propertyValue, this, "generatePackagePropertiesHashMap()");
                    }
                    packagePropertiesHashMap.put(propertyName, propertyValue);
                } else {
                    packagePropertiesHashMap.put(propertyName, StringUtil.getInstance().EMPTY_STRING);
                }
            }
        }
        return packagePropertiesHashMap;
    }

}

