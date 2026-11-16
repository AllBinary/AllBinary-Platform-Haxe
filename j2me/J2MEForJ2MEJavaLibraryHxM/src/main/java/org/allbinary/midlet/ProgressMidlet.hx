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
package org.allbinary.midlet;

import org.allbinary.canvas.Processor;
import org.allbinary.logic.system.security.licensing.AbeClientInformationInterface;
import org.allbinary.logic.system.security.licensing.ClientInformationFactory;
import org.allbinary.thread.PrimaryThreadPool;
import org.allbinary.thread.ThreadPool;

//J2MEForJ2ME
class ProgressMidlet extends AllBinaryMidlet {
    public final abeClientInformation : AbeClientInformationInterface;
    public function new(clientInformationFactory : ClientInformationFactory) {
        super();
        this.preInit();
        this.abeClientInformation = clientInformationFactory.getInstanceFor();
    }

    public function preInit() : Void {
    }

    public function exitProgress(isProgress : Bool) : Void {
        final processor : Processor = MidletExitProcessorFactory.getInstance().getExitInstance(this);
        try {
            var primaryThreadPool : ThreadPool = PrimaryThreadPool.getInstance();
            var runnable : Runnable = new ExitRunnable(this, processor, isProgress);
            primaryThreadPool.runTask(runnable);
        } catch (e : haxe.Exception) {
            this.logUtil.put(this.commonStrings.EXCEPTION, this, "exit", e);
            try {
                processor.process();
            } catch (e2 : haxe.Exception) {
                this.logUtil.put(this.commonStrings.EXCEPTION, this, "exit", e);
            }
        }
    }

}

