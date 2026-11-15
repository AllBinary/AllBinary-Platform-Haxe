/*
 * 
 * AllBinary Open License Version 1 
 * Copyright (c) 2022 AllBinary 
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
package org.allbinary.game.displayable;

import org.allbinary.thread.ARunnable;
//import javax.microedition.lcdui.Canvas;
import org.allbinary.game.configuration.feature.Features;
import org.allbinary.graphics.displayable.DisplayInfoSingleton;
import org.allbinary.graphics.opengles.OpenGLFeatureFactory;
import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.string.CommonStrings;
import org.allbinary.thread.NullRunnable;

class AlwaysRepaintBehavior extends RepaintBehavior {
    private static final instanceC : AlwaysRepaintBehavior = new AlwaysRepaintBehavior();
    public static function getInstance() : AlwaysRepaintBehavior {
        return AlwaysRepaintBehavior.instanceC;
    }

    private final NAME : String = "AlwaysRepaintBehavior";
    public override function repaint(canvas : Canvas) : Void {
        final features : Features = Features.getInstance();
        final openGLFeatureFactory : OpenGLFeatureFactory = OpenGLFeatureFactory.getInstance();
        if (features.isFeature(openGLFeatureFactory.OPENGL)) {
            DisplayInfoSingleton.getInstance().process();
        } else {
            final thread : Thread = new Thread(/* anonymous class body:
                public function run() : Void {
                    try {
                        canvas.repaint();
                        DisplayInfoSingleton.getInstance().process();
                    } catch (e : haxe.Exception) {
                        final commonStrings : CommonStrings = CommonStrings.getInstance();
                        final logUtil : LogUtil = LogUtil.getInstance();
                        logUtil.put(commonStrings.EXCEPTION, this, commonStrings.RUN, e);
                    }
                }

*/ new ARunnable(), this.NAME);
            thread.start();
        }
    }

    public override function onChangeRepaint(canvas : Canvas) : Void {
    }

    public function new() {
        super();
    }
}

