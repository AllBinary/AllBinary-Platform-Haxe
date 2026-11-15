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
package org.allbinary.string;

//import jsinterop.annotations.JsType;
import org.allbinary.logic.string.StringMaker;
//import jsinterop.annotations.JsMethod;
//import jsinterop.annotations.JsProperty;

class CommonSeps {
    private static final instance : CommonSeps = new CommonSeps();
    public static function getInstance() : CommonSeps {
        return CommonSeps.instance;
    }

    public final NEW_LINE : String = "\n";
    public final SEMICOLON : String = ";";
    public final EQUALS : String = "=";
    public final SPACE : String = " ";
    public final COMMA : String = ",";
    public final COLON : String = ":";
    public final PERIOD : String = ".";
    public final UNDERSCORE : String = "_";
    public final COLON_SEP : String;
    public final COMMA_SEP : String;
    public final PARENTHESIS_OPEN : String = "(";
    public final PARENTHESIS_CLOSE : String = ")";
    public final BRACE_OPEN : String = "{";
    public final BRACE_CLOSE : String = "}";
    public final BRACKET_OPEN : String = "[";
    public final BRACKET_CLOSE : String = "]";
    public final DASH : String = "-";
    public final PERCENT : String = "%";
    public final AMPERSAND : String = "&";
    public final FORWARD_SLASH : String = "/";
    public final BACK_SLASH : String = "\\";
    public final QUESTION : String = "?";
    public final QUOTE : String = "\"";
    public final QUOTE_END : String = "\",";
    public final COMMENT : String = "//";
    public final INDENT : String = "    ";
    public function new() {
        this.COLON_SEP = Std.string(new StringMaker().append(this.COLON).append(this.SPACE));
        this.COMMA_SEP = Std.string(new StringMaker().append(this.COMMA).append(this.SPACE));
    }
}

