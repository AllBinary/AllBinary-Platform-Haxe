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
package org.allbinary.input.automation.module.game.test;

//import javax.swing.*;
import org.allbinary.input.automation.module.AbstractInputAutomationFactory;
import org.allbinary.input.automation.module.InputAutomationModuleData;
import org.allbinary.input.automation.module.configuration.BlankModuleConfigurationJPanel;
import org.allbinary.thread.RunnableInterface;

class TestModuleFactory extends AbstractInputAutomationFactory {
    private static var NAME : String = "Test New Game" + InputAutomationModuleData.MODULE_NAME_END;
    private var blankModuleConfigurationJPanel : BlankModuleConfigurationJPanel = null;
    public function new() {
        super(NAME, new BlankModuleConfigurationJPanel());
    }

    public function getName() : String {
        return TestModuleFactory.NAME;
    }

    public function getConfigurationJPanel() : JPanel {
        return this.blankModuleConfigurationJPanel;
    }

    // throws Exception
    // synchronized
    public function getInstance() : RunnableInterface {
        return null;
    }

}

