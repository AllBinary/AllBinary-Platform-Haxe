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
package org.allbinary.input.automation.robot.osgi;

import bundle.input.automation.robot.InputAutomationRobotServiceInterface;
import org.allbinary.input.automation.robot.InputRobotFactory;
import org.allbinary.input.automation.robot.InputRobotInterface;
import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.osgi.OSGIServiceInterface;
import org.allbinary.osgi.OSGIServiceVisitorInterface;
import org.allbinary.string.CommonStrings;

class InputAutomationRobotOSGIServiceVisitor implements OSGIServiceVisitorInterface {
    public final logUtil : LogUtil = LogUtil.getInstance();
    public final commonStrings : CommonStrings = CommonStrings.getInstance();
    public function new() {
    }

    public function visit(anyType : Any) : Any {
        return this.visit((cast anyType : OSGIServiceInterface));
    }

    public function visit(osgiServiceInterface : OSGIServiceInterface) : Null<Bool> {
        try {
            this.logUtil.putF(this.commonStrings.START, this, "visit");
            final inputAutomationRobotServiceInterface : InputAutomationRobotServiceInterface = (cast osgiServiceInterface : InputAutomationRobotServiceInterface);
            final inputRobotInterfaceArray : haxe.ds.Vector<InputRobotInterface> = inputAutomationRobotServiceInterface.getInputRobotInterfaceArray();
            for (index in 0...inputRobotInterfaceArray.length) {
                this.logUtil.putF("Adding: " + inputRobotInterfaceArray[index].getName(), this, "visit");
                InputRobotFactory.getInstance().add(inputRobotInterfaceArray[index]);
            }
            return true;
        } catch (e : haxe.Exception) {
            this.logUtil.put(this.commonStrings.EXCEPTION, this, "visit", e);
            return false;
        }
    }

}

