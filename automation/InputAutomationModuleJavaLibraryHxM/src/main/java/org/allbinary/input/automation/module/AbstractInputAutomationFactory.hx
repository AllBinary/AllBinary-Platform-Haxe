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
package org.allbinary.input.automation.module;

//import java.net.URL;
//import javax.help.HelpSet;
//import javax.swing.*;
import org.allbinary.logic.java.help.JavaHelpUtil;

class AbstractInputAutomationFactory extends InputAutomationModuleFactoryInterface {
    private var name : String;
    private var jPanel : JPanel;
    private var helpSet : HelpSet;
    public function new(name : String, jPanel : JPanel, helpSet : HelpSet) {
        super();
        this.name = name;
        this.jPanel = jPanel;
        this.helpSet = helpSet;
    }

    // Java overloaded constructor: Haxe allows one constructor
    public function new(name : String, jPanel : JPanel) {
        super();
        this.name = name;
        this.jPanel = jPanel;
        var url : URL = Type.getClass(this).getResource("/help/Help.hs");
        this.helpSet = JavaHelpUtil.getInstance().getHelpSet(url);
    }

    public function getName() : String {
        return this.name;
    }

    public function getConfigurationJPanel() : JPanel {
        return this.jPanel;
    }

    public function getHelpSet() : HelpSet {
        return this.helpSet;
    }

}

