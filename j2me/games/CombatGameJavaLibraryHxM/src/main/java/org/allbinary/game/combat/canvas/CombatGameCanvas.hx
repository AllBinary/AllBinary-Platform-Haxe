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
package org.allbinary.game.combat.canvas;

//import javax.microedition.lcdui.CommandListener;
import org.allbinary.game.combat.destroy.DestroyedLayerProcessor;
import org.allbinary.game.combat.destroy.event.DestroyEventCircularStaticPool;
import org.allbinary.game.combat.destroy.event.DestroyedEventHandler;
import org.allbinary.game.configuration.feature.Features;
import org.allbinary.game.configuration.feature.GameFeatureFactory;
import org.allbinary.game.displayable.canvas.AllBinaryGameCanvas;
import org.allbinary.game.init.BasicBuildGameInitializerFactory;
import org.allbinary.game.layer.AllBinaryGameLayerManager;
import org.allbinary.game.layer.drop.DropLayerProcessor;
import org.allbinary.game.layer.identification.GroupLayerManagerListener;
import org.allbinary.game.score.HighScoresFactoryInterface;
import org.allbinary.graphics.canvas.transition.progress.ProgressCanvasFactory;
import org.allbinary.layer.BasicLayerProcessor;
import org.allbinary.logic.system.security.licensing.AbeClientInformationInterface;

class CombatGameCanvas extends AllBinaryGameCanvas {
    public static var basicLayerProcessor : haxe.ds.Vector<BasicLayerProcessor> = haxe.ds.Vector.fromArrayCopy([for (index in 0...0) null]);
    public function new(cmdListener : CommandListener, gameLayerManager : AllBinaryGameLayerManager, highScoresFactoryInterface : HighScoresFactoryInterface, gameInitializationInterfaceFactoryInterface : BasicBuildGameInitializerFactory, buffered : Bool) {
        super(cmdListener, gameLayerManager, highScoresFactoryInterface, gameInitializationInterfaceFactoryInterface, buffered);
    }

    private function CombatGameCanvas_init() : Void {
        DestroyEventCircularStaticPool.getInstance().init(this);
        ProgressCanvasFactory.getInstance().addNormalPortion(50, "Destroy Events");
    }

    // throws Exception
    public override function initApp(abeClientInformation : AbeClientInformationInterface) : Void {
        this.CombatGameCanvas_init();
        super.initApp(abeClientInformation);
    }

    public function initConfigurablePortion(portion : Int) : Void {
        DestroyedLayerProcessor.init();
        ProgressCanvasFactory.getInstance().addNormalPortion(portion, "Basic Processors");
        final features : Features = Features.getInstance();
        final gameFeatureFactory : GameFeatureFactory = GameFeatureFactory.getInstance();
        if (features.isFeature(gameFeatureFactory.DROPPED_ITEMS) && features.isFeature(gameFeatureFactory.DROPPED_ITEMS_FROM_DEATH)) {
            CombatGameCanvas.basicLayerProcessor = haxe.ds.Vector.fromArrayCopy([for (index in 0...2) null]);
            CombatGameCanvas.basicLayerProcessor[0] = DestroyedLayerProcessor.getInstance();
            CombatGameCanvas.basicLayerProcessor[1] = DropLayerProcessor.getInstance();
        } else {
            CombatGameCanvas.basicLayerProcessor = haxe.ds.Vector.fromArrayCopy([for (index in 0...1) null]);
            CombatGameCanvas.basicLayerProcessor[0] = DestroyedLayerProcessor.getInstance();
        }
    }

    // throws Exception
    public override function processPlayingGame() : Void {
        super.processPlayingGame();
        {
            var index : Int = CombatGameCanvas.basicLayerProcessor.length;
            while (--index >= 0) {
            CombatGameCanvas.basicLayerProcessor[index].process(this.gameLayerManager);
            }
        }
    }

    // throws Exception
    public override function cleanupGame() : Void {
        super.cleanupGame();
        {
            var index : Int = CombatGameCanvas.basicLayerProcessor.length;
            while (--index >= 0) {
            CombatGameCanvas.basicLayerProcessor[index].getList().clear();
            }
        }
        GroupLayerManagerListener.getInstance().clear();
        GroupLayerManagerListener.getInstance().log();
        DestroyedEventHandler.getInstance().removeAllListeners();
        this.cleanupManager();
    }

    // throws Exception
    public function cleanupManager() : Void {
        this.gameLayerManager.cleanup();
    }

}

