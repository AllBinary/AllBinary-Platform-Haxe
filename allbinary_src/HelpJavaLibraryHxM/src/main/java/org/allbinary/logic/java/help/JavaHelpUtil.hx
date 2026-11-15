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
package org.allbinary.logic.java.help;

//import java.awt.*;
//import java.awt.event.ActionEvent;
//import java.io.File;
//import java.net.URI;
//import java.net.URL;
//import javax.help.CSH;
//import javax.help.HelpBroker;
//import javax.help.HelpSet;
//import javax.swing.*;
import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.string.CommonStrings;

class JavaHelpUtil {
    public final logUtil : LogUtil = LogUtil.getInstance();
    private static final instance : JavaHelpUtil = new JavaHelpUtil();
    public static function getInstance() : JavaHelpUtil {
        return JavaHelpUtil.instance;
    }

    private final point : Point = new Point(0, 0);
    private final dimension : Dimension = new Dimension(640, 480);
    private var contextSensitiveHelpActionEvent : ActionEvent = new ActionEvent(new JLabel(), ActionEvent.ACTION_FIRST, null);
    public final commonStrings : CommonStrings = CommonStrings.getInstance();
    public function new() {
    }

    public function getHelpSet(filePath : String) : HelpSet {
        try {
            var helpSetURI : URI = new File(filePath).toURI();
            var helpSetURL : URL = helpSetURI.toURL();
            return this.getHelpSet(helpSetURL);
        } catch (e : haxe.Exception) {
            this.logUtil.put(this.commonStrings.EXCEPTION, getInstance(), "set", e);
            return null;
        }
    }

    public function getHelpSet(url : URL) : HelpSet {
        try {
            return new HelpSet(null, url);
        } catch (e : haxe.Exception) {
            this.logUtil.put(this.commonStrings.EXCEPTION, getInstance(), "set", e);
            return null;
        }
    }

    public function show(helpSet : HelpSet) : Void {
        try {
            var helpBroker : HelpBroker = helpSet.createHelpBroker();
            helpBroker.setLocation(this.point);
            helpBroker.setSize(this.dimension);
            new CSH.DisplayHelpFromSource(helpBroker).actionPerformed(this.contextSensitiveHelpActionEvent);
            this.logUtil.putF("CSH Action", getInstance(), "show");
        } catch (e : haxe.Exception) {
            this.logUtil.put(this.commonStrings.EXCEPTION, getInstance(), "show", e);
        }
    }

    public static function main(args : haxe.ds.Vector<String>) : Void {
        try {
            var javaHelpUtil : JavaHelpUtil = JavaHelpUtil.getInstance();
            javaHelpUtil.show(javaHelpUtil.getHelpSet("G:/mnt/bc/mydev/working/automation/InputAutomationJavaApplication/AllBinaryInputAutomationHelp/AllBinaryInputAutomation.hs"));
        } catch (e : haxe.Exception) {
        }
    }

}

