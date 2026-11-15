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
package org.allbinary.logic.string.regex.replace;

//import java.util.HashMap;
import org.allbinary.J2SEUtil;
import org.allbinary.globals.AppUrlGlobals;
import org.allbinary.globals.URLGLOBALS;
import org.allbinary.logic.StdUtil;
import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.logic.string.StringMaker;
import org.allbinary.logic.string.StringUtil;
import org.allbinary.logic.communication.log.config.type.LogConfigTypes;

class Replace {
    private final logUtil : LogUtil = LogUtil.getInstance();
    private final j2seUtil : J2SEUtil = J2SEUtil.getInstance();
    private final REPLACERS_ : String = "Replacers: ";
    private final ALL : String = "all";
    private final FOUND_KEY : String = "found key total: ";
    private final hashMap : HashMap;
    public function new(key : String, value : String) {
        this.hashMap = StdUtil.getInstance().createHashMap();
        this.hashMap.put(haxe.ds.Vector.fromArrayCopy([key]), haxe.ds.Vector.fromArrayCopy([value]));
    }

    // Java overloaded constructor: Haxe allows one constructor
    public function new(keys : haxe.ds.Vector<String>, values : haxe.ds.Vector<String>) {
        this.hashMap = StdUtil.getInstance().createHashMap();
        this.hashMap.put(keys, values);
    }

    // Java overloaded constructor: Haxe allows one constructor
    public function new(hashMap : HashMap) {
        this.hashMap = hashMap;
    }

    public function all(replace : String) : String {
        return this.upTo(replace, Integer.MIN_VALUE);
    }

    public function upTo(replace : String, total : Int) : String {
        final newStringBuffer : StringMaker = new StringMaker();
        var totalNumberOfReplaces : Int = 0;
        var keys : haxe.ds.Vector<String> = null;
        var values : haxe.ds.Vector<String> = null;
        final keyArray : haxe.ds.Vector<Any> = this.j2seUtil.getHashMapAsArray(this.hashMap);
        final size : Int = keyArray.length;
        for (index2 in 0...size) {
            keys = (cast keyArray[index2] : haxe.ds.Vector<String>);
            values = (cast this.hashMap.get(keys) : haxe.ds.Vector<String>);
            var foundTotal : haxe.Int64 = 0;
            var index : Int = 0;
            var nextKey : String = null;
            var end : Int = 0;
            var nextSecondKey : String = null;
            var begin2 : Int = 0;
            while (index < replace.length) {
                final begin : Int = replace.indexOf(keys[0], index);
                if (begin != -1) {
                    foundTotal++;
                    if (foundTotal % 100 == haxe.Int64.ofInt(0)) {
                        trace(this.FOUND_KEY + foundTotal);
                    }
                    nextKey = keys[0];
                    end = begin + nextKey.length;
                    newStringBuffer.delete(0, newStringBuffer.length());
                    newStringBuffer.append(replace.substring(0, begin));
                    newStringBuffer.append(values[0]);
                    index = newStringBuffer.length();
                    newStringBuffer.append(replace.substring(end, replace.length));
                    replace = newStringBuffer.toString();
                    if (keys.length > 1) {
                        nextSecondKey = keys[1];
                        begin2 = replace.indexOf(nextSecondKey, index);
                        if (begin2 != -1) {
                            final end2 : Int = begin2 + nextSecondKey.length;
                            newStringBuffer.delete(0, newStringBuffer.length());
                            newStringBuffer.append(replace.substring(0, begin2));
                            newStringBuffer.append(values[1]);
                            index = newStringBuffer.length();
                            newStringBuffer.append(replace.substring(end2, replace.length));
                            replace = newStringBuffer.toString();
                        }
                    }
                    totalNumberOfReplaces++;
                    if (total != Integer.MIN_VALUE && totalNumberOfReplaces >= total) {
                        break;
                    }
                } else {
                    break;
                }
            }
        }
        if (totalNumberOfReplaces > 0) {
            if (LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().REPLACE)) {
                this.logUtil.putF("Total Number Of Replaces: " + totalNumberOfReplaces, this, this.ALL);
            }
        }
        return replace;
    }

    public function line(replace : String) : String {
        final newStringBuffer : StringMaker = new StringMaker();
        var totalNumberOfReplaces : Int = 0;
        var key : String = null;
        var value : String = null;
        final keyArray : haxe.ds.Vector<Any> = this.j2seUtil.getHashMapAsArray(this.hashMap);
        final size : Int = keyArray.length;
        for (index2 in 0...size) {
            key = (cast keyArray[index2] : String);
            value = (cast this.hashMap.get(key) : String);
            var index : Int = 0;
            while (index < replace.length) {
                newStringBuffer.delete(0, newStringBuffer.length());
                final begin : Int = replace.indexOf(key, index);
                if (begin != -1) {
                    trace(this.FOUND_KEY);
                    final end : Int = replace.indexOf("\n".code, begin + key.length) + 1;
                    if (end >= 0) {
                        newStringBuffer.append(replace.substring(0, begin));
                        index = newStringBuffer.length();
                        newStringBuffer.append(replace.substring(end, replace.length));
                        replace = newStringBuffer.toString();
                        totalNumberOfReplaces++;
                    }
                } else {
                    break;
                }
            }
        }
        if (LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().REPLACE)) {
            this.logUtil.putF("Total Number Of Replaces: " + totalNumberOfReplaces, this, this.ALL);
        }
        return replace;
    }

    public static function main(args : haxe.ds.Vector<String>) : Void {
        try {
            final stringUtil : StringUtil = StringUtil.getInstance();
            var appUrlGlobals : AppUrlGlobals = new AppUrlGlobals();
            appUrlGlobals.setWebappPath("G:/mnt/bc/mydev/work/allbinary_src/ToolsJavaLibrary/tools");
            URLGLOBALS.init(appUrlGlobals);
            var testString : String = "\"super gun\" big tank \"goodgunriflegun";
            var replace : Replace = new Replace("gun", "abcdefghijklmnopqrstuxwxyzabcdefghijklmnopqrstuxwxyz");
            trace("Old String: " + testString);
            testString = replace.all(testString);
            trace("New String: " + testString);
            var replaceCat : Replace = new Replace("abcdefghijklmnopqrstuxwxyzabcdefghijklmnopqrstuxwxyz", stringUtil.EMPTY_STRING);
            testString = replaceCat.all(testString);
            trace("New String: " + testString);
        } catch (e : haxe.Exception) {
        }
    }

}

