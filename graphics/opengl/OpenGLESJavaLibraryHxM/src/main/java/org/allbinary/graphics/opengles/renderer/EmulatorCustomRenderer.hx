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
package org.allbinary.graphics.opengles.renderer;

//import javax.microedition.khronos.egl.EGLConfig;
//import javax.microedition.khronos.opengles.GL10;
import org.allbinary.emulator.InitEmulatorFactory;
import org.allbinary.string.CommonStrings;
import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.logic.communication.log.PreLogUtil;

class EmulatorCustomRenderer {
    public final logUtil : LogUtil = LogUtil.getInstance();
    public final commonStrings : CommonStrings = CommonStrings.getInstance();
    public final renderStrings : RendererStrings = RendererStrings.getInstance();
    public function onSurfaceCreated(gl : GL10, eglConfig : EGLConfig) : Void {
        this.logUtil.putF(this.commonStrings.START, this, this.renderStrings.ON_SURFACE_CREATED);
        final initEmulatorFactory : InitEmulatorFactory = InitEmulatorFactory.getInstance();
        if (!initEmulatorFactory.isInitEmulator()) {
            try {
                final WAIT_FOR_EMULATOR : String = "Waiting on Emulator Initialization";
                while (!initEmulatorFactory.isInitEmulator()) {
                    PreLogUtil.put(WAIT_FOR_EMULATOR, this, this.renderStrings.ON_SURFACE_CREATED);
                    Sys.sleep(haxe.Int64.toInt(180) / 1000);
                }
            } catch (e : haxe.Exception) {
                this.logUtil.put(this.commonStrings.EXCEPTION, this, this.renderStrings.ON_SURFACE_CREATED, e);
            }
        }
    }

    public function new() {
    }
}

