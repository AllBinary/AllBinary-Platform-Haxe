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

import javax.microedition.lcdui.Canvas;
import org.allbinary.game.configuration.feature.Features;
import org.allbinary.graphics.displayable.DisplayInfoSingleton;
import org.allbinary.graphics.opengles.OpenGLFeatureFactory;
import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.string.CommonStrings;
import org.allbinary.thread.NullRunnable;

class RepaintBehavior {
    public final logUtil : LogUtil = LogUtil.getInstance();
    private static final instance : RepaintBehavior = new RepaintBehavior();
    public static function getInstance() : RepaintBehavior {
        return RepaintBehavior.instance;
    }

    public function repaint(canvas : Canvas) : Void {
    }

    private final NAME : String = "RepaintBehavior";
    public function onChangeRepaint(canvas : Canvas) : Void {
        final features : Features = Features.getInstance();
        final openGLFeatureFactory : OpenGLFeatureFactory = OpenGLFeatureFactory.getInstance();
        if (features.isFeature(openGLFeatureFactory.OPENGL)) {
            DisplayInfoSingleton.getInstance().process();
        } else {
            final thread : Thread = new Thread(new RepaintRunnable(canvas), this.NAME);
            thread.start();
        }
    }

    public function new() {
    }
}

