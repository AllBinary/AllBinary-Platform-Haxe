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
package org.allbinary.logic.communication.log;

//import java.awt.*;
//import javax.swing.*;
import org.allbinary.string.CommonStrings;

class GuiLog {
    private static final instance : GuiLog = new GuiLog();
    public static function getInstance() : GuiLog {
        return GuiLog.instance;
    }

    private final logFormatUtil : LogFormatUtil = LogFormatUtil.getInstance();
    private final commonStrings : CommonStrings = CommonStrings.getInstance();
    public function new() {
    }

    // synchronized
    public function showDialog(msg : String) : Void {
        var error : JDialog = new JDialog();
        var size : Int = msg.length * 9;
        var x : Int = size;
        if (x > 550) {
            x = 550;
        }
        error.getContentPane().setLayout(new GridLayout(1, 1));
        if (size > 255) {
            var y : Int = 550;
            error.setSize(x, y);
            error.getContentPane().add(new javax.swing.JScrollPane(new javax.swing.JTextArea(msg)));
        } else if (size > 0) {
            var y : Int = 50;
            error.setSize(x, y);
            error.getContentPane().add(new javax.swing.JScrollPane(new javax.swing.JLabel(msg)));
        }
        error.show();
    }

    // synchronized
    public function put(specialMessage : String, anyType : Any, functionName : String) : String {
        return this.put(specialMessage, anyType, functionName, null);
    }

    // synchronized
    public function put(specialMessage : String, anyType : Any, functionName : String, exception : haxe.Exception) : String {
        try {
            var data : String = this.logFormatUtil.get(specialMessage, Type.getClassName(Type.getClass(anyType)), functionName, exception);
            this.showDialog(data);
            trace(data);
            return data;
        } catch (e : haxe.Exception) {
            PreLogUtil.putOE(this.commonStrings.EXCEPTION, this, "put", e);
            return "Logging Error";
        }
    }

    // synchronized
    public function put(specialMessage : String, className : String, functionName : String) : String {
        return this.put(specialMessage, className, functionName, null);
    }

    // synchronized
    public function put(specialMessage : String, className : String, functionName : String, exception : haxe.Exception) : String {
        try {
            var data : String = this.logFormatUtil.get(specialMessage, className, functionName, exception);
            this.showDialog(data);
            trace(data);
            return data;
        } catch (e : haxe.Exception) {
            PreLogUtil.putOE(this.commonStrings.EXCEPTION, this, "put", e);
            return "Logging Error";
        }
    }

}

