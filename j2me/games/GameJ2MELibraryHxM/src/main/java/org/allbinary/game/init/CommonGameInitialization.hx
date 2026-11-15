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
package org.allbinary.game.init;

import javax.microedition.lcdui.CommandListener;
import org.allbinary.game.resource.ResourceInitialization;
import org.allbinary.game.resource.ResourceLoadingLevelFactory;
import org.allbinary.graphics.PointFactory;
import org.allbinary.graphics.canvas.transition.progress.ProgressCanvas;
import org.allbinary.graphics.canvas.transition.progress.ProgressCanvasFactory;
import org.allbinary.logic.math.SmallIntegerSingletonFactory;
import org.allbinary.logic.system.security.licensing.AbeClientInformationInterface;
import org.allbinary.math.AngleFactory;
import org.allbinary.string.CommonStrings;

class CommonGameInitialization extends BaseGameInitialization {
    public final commonStrings : CommonStrings = CommonStrings.getInstance();
    public function new(resourceInitializationArray : haxe.ds.Vector<ResourceInitialization>, portion : Int) {
        super(resourceInitializationArray, portion);
    }

    // throws Exception
    public override function init(abeClientInformation : AbeClientInformationInterface, commandListener : CommandListener, level : Int) : Void {
        super.init(abeClientInformation, commandListener, level);
        final resourceLoadingLevelFactory : ResourceLoadingLevelFactory = ResourceLoadingLevelFactory.getInstance();
        if (!this.isGameInitialized() && level == resourceLoadingLevelFactory.LOAD_ALL.getLevel()) {
            this.setGameInitialized(true);
            final progressCanvas : ProgressCanvas = ProgressCanvasFactory.getInstance();
            SmallIntegerSingletonFactory.getInstance().init();
            progressCanvas.addNormalPortion(50, "Integers");
            PointFactory.getInstance().init();
            progressCanvas.addNormalPortion(50, "Points");
            AngleFactory.getInstance();
            progressCanvas.addNormalPortion(50, "Angles");
            this.initGame();
            this.resourceInitializationArray[this.GAME_RESOURCES].init();
        }
        super.resourceInitialization(level);
    }

    // throws Exception
    public function initGame() : Void {
        throw new jre.lang.JavaException(this.commonStrings.NOT_IMPLEMENTED);
    }

}

