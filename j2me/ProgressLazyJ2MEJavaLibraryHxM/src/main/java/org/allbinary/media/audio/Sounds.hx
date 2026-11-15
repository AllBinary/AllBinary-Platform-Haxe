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
package org.allbinary.media.audio;

//import javax.microedition.media.Player;
import org.allbinary.string.CommonStrings;
import org.allbinary.logic.string.StringMaker;
import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.graphics.canvas.transition.progress.ProgressCanvas;
import org.allbinary.graphics.canvas.transition.progress.ProgressCanvasFactory;
import org.allbinary.string.CommonLabels;
import org.allbinary.logic.math.SmallIntegerSingletonFactory;

class Sounds {
    public final logUtil : LogUtil = LogUtil.getInstance();
    private final commonStrings : CommonStrings = CommonStrings.getInstance();
    private final soundStrings : SoundStrings = SoundStrings.getInstance();
    private final soundsFactoryInterface : SoundsFactoryInterface;
    public function new(soundsFactoryInterface : SoundsFactoryInterface) {
        this.soundsFactoryInterface = soundsFactoryInterface;
    }

    // throws Exception
    public function init() : Void {
        this.logUtil.putF(this.commonStrings.START, this, this.commonStrings.INIT);
        final commonLabels : CommonLabels = CommonLabels.getInstance();
        final progressCanvas : ProgressCanvas = ProgressCanvasFactory.getInstance();
        this.soundsFactoryInterface.init();
        final soundInterfaceArray : haxe.ds.Vector<Sound> = this.soundsFactoryInterface.getSoundInterfaceArray();
        final smallIntegerSingletonFactory : SmallIntegerSingletonFactory = SmallIntegerSingletonFactory.getInstance();
        var indexInteger : Null<Int> = null;
        var indexString : String = null;
        final stringBuffer : StringMaker = new StringMaker();
        for (i in 0...soundInterfaceArray.length) {
            final soundInterface : Sound = soundInterfaceArray[i];
            if (soundInterface != null) {
                indexInteger = smallIntegerSingletonFactory.getAt(i);
                indexString = indexInteger.toString();
                stringBuffer.delete(0, stringBuffer.length());
                stringBuffer.append(commonLabels.INDEX_LABEL);
                stringBuffer.append(indexString);
                stringBuffer.append(this.soundStrings.SOUND);
                stringBuffer.append(Type.getClassName(Type.getClass(soundInterface)));
                this.logUtil.putF(stringBuffer.toString(), this, this.commonStrings.INIT);
                soundInterface.init();
                progressCanvas.addNormalPortion(100, new StringMaker().append(this.soundStrings.INIT_SOUND).append(indexString).toString());
            }
        }
        this.soundsFactoryInterface.setInitialized(true);
        this.logUtil.putF(this.commonStrings.END, this, this.commonStrings.INIT);
    }

    // throws Exception
    public function stopAll() : Void {
        this.logUtil.putF(this.commonStrings.START, this, this.soundStrings.STOP_ALL);
        final soundInterfaceArray : haxe.ds.Vector<Sound> = this.soundsFactoryInterface.getSoundInterfaceArray();
        final progressCanvas : ProgressCanvas = ProgressCanvasFactory.getInstance();
        var player : Player = null;
        for (index in 0...soundInterfaceArray.length) {
            if (soundInterfaceArray[index] != null) {
                player = soundInterfaceArray[index].getPlayerP();
                if (player != null) {
                    player.stop();
                    progressCanvas.addPortion(100, this.soundStrings.STOPPING_SOUND, index);
                }
            }
        }
    }

    // throws Exception
    public function closeAll() : Void {
        this.logUtil.putF(this.commonStrings.START, this, this.soundStrings.CLOSE_ALL);
        final soundInterfaceArray : haxe.ds.Vector<Sound> = this.soundsFactoryInterface.getSoundInterfaceArray();
        final progressCanvas : ProgressCanvas = ProgressCanvasFactory.getInstance();
        var player : Player = null;
        for (index in 0...soundInterfaceArray.length) {
            if (soundInterfaceArray[index] != null) {
                player = soundInterfaceArray[index].getPlayerP();
                if (player != null) {
                    player.close();
                    progressCanvas.addPortion(100, this.soundStrings.CLOSING_SOUND, index);
                }
            }
        }
    }

}

