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
package org.allbinary.graphics.opengles;

//import javax.microedition.lcdui.Displayable;
import org.allbinary.J2MEUtil;
import org.allbinary.game.configuration.feature.Features;
import org.allbinary.game.displayable.canvas.AllBinaryGameCanvas;
import org.allbinary.game.displayable.canvas.DemoCanvas;
import org.allbinary.game.displayable.canvas.GameInputMappingCanvas;
import org.allbinary.game.displayable.canvas.GameInputMappingInstructionsCanvas;
import org.allbinary.game.displayable.canvas.GameRunnable;
import org.allbinary.game.displayable.canvas.NullDisplayable;
import org.allbinary.game.displayable.canvas.NullWaitGameRunnable;
import org.allbinary.game.layer.SWTUtil;
import org.allbinary.game.score.displayable.HighScoresCanvas;
import org.allbinary.graphics.GraphicsStrings;
import org.allbinary.graphics.displayable.CanvasStrings;
import org.allbinary.graphics.displayable.MyCanvas;
import org.allbinary.logic.communication.log.PreLogUtil;
import org.allbinary.logic.string.StringMaker;
import org.allbinary.logic.string.StringUtil;
import org.allbinary.string.CommonSeps;
import org.allbinary.string.CommonStrings;
import org.allbinary.thread.NullRunnable;
import org.allbinary.util.BasicArrayList;
import org.allbinary.util.BasicArrayListD;

class CurrentDisplayableFactory {
    private static final instance : CurrentDisplayableFactory = new CurrentDisplayableFactory();
    public static function getInstance() : CurrentDisplayableFactory {
        return CurrentDisplayableFactory.instance;
    }

    private final commonStrings : CommonStrings = CommonStrings.getInstance();
    private final canvasStrings : CanvasStrings = CanvasStrings.getInstance();
    private final stringUtil : StringUtil = StringUtil.getInstance();
    private final SET_DISPLAYABLE : String = "setDisplayable";
    private final SET_RUNNABLE : String = "setRunnable";
    private final CLEAR_RUNNABLE : String = "clearRunnable";
    private final SET_USED_RUNNABLE : String = "setUsedRunnable";
    private final RUNNABLE : String = "Runnable: ";
    private final RUNNABLE_WAS_ALREADY_IN_USE : String = "Runnable was already in use: ";
    public final DEFAULT_CHILD_NAME_LIST : BasicArrayList = new BasicArrayListD();
    private var displayable : Displayable = NullDisplayable.getInstance();
    private var openGlReadydisplayable : Displayable = NullDisplayable.getInstance();
    private var runnable : GameRunnable = NullWaitGameRunnable.getInstance();
    private var usedRunnable : GameRunnable = NullWaitGameRunnable.getInstance();
    public function new() {
        this.DEFAULT_CHILD_NAME_LIST.add(this.canvasStrings.ABOUT);
        this.DEFAULT_CHILD_NAME_LIST.add(this.canvasStrings.OPTIONS);
        this.DEFAULT_CHILD_NAME_LIST.add(GameInputMappingCanvas.NAME);
        this.DEFAULT_CHILD_NAME_LIST.add(GameInputMappingInstructionsCanvas.NAME);
        this.DEFAULT_CHILD_NAME_LIST.add(HighScoresCanvas.NAME);
    }

    public function setMyCanvas(displayable : MyCanvas) : Void {
        if (Std.isOfType(this.displayable, MyCanvas)) {
            if (displayable.hasChild((cast this.displayable : MyCanvas))) {
                PreLogUtil.put(new StringMaker().append("Child Displayable is already set for: ").append(this.stringUtil.toString(displayable)).toString(), this, this.SET_DISPLAYABLE);
                return;
            }
        }
        this.setDisplayable(displayable);
    }

    public function setDisplayable(displayable : Displayable) : Void {
        this.displayable = displayable;
        this.setOpenGlReadydisplayable(displayable);
    }

    public function setOpenGlReadydisplayable(openGlReadydisplayable : Displayable) : Void {
        this.openGlReadydisplayable = openGlReadydisplayable;
        this.update();
    }

    public function getOpenGlReadydisplayable() : Displayable {
        return this.openGlReadydisplayable;
    }

    public function setRunnable(runnable : GameRunnable) : Void {
        PreLogUtil.put(new StringMaker().append(this.RUNNABLE).append(this.stringUtil.toString(runnable)).toString(), this, this.SET_RUNNABLE);
        this.runnable = runnable;
        if (this.usedRunnable != this.runnable) {
            this.update();
        } else {
            PreLogUtil.put(new StringMaker().append(this.RUNNABLE_WAS_ALREADY_IN_USE).append(this.stringUtil.toString(runnable)).toString(), this, this.SET_RUNNABLE);
        }
    }

    public function clearRunnable() : Void {
        PreLogUtil.put(new StringMaker().append(this.RUNNABLE).append(this.stringUtil.toString(NullRunnable.getInstance())).toString(), this, this.CLEAR_RUNNABLE);
        this.setUsedRunnable(NullWaitGameRunnable.getInstance());
    }

    private function update() : Void {
        // synchronized (this)
        {
            final commonSeps : CommonSeps = CommonSeps.getInstance();
            final features : Features = Features.getInstance();
            final stringMaker : StringMaker = new StringMaker();
            stringMaker.append(this.stringUtil.toString(this.openGlReadydisplayable));
            if (SWTUtil.isSWT && !features.isDefault(OpenGLFeatureFactory.getInstance().OPENGL)) {
                PreLogUtil.put(stringMaker.append(commonSeps.SPACE).append(SWTUtil.SWT).append(commonSeps.SPACE).append(this.RUNNABLE).append(this.stringUtil.toString(NullRunnable.getInstance())).toString(), this, this.commonStrings.UPDATE);
                this.setUsedRunnable(NullWaitGameRunnable.getInstance());
            } else if (J2MEUtil.isHTML()) {
                PreLogUtil.put(stringMaker.append(commonSeps.SPACE).append(GraphicsStrings.getInstance().HTML).append(commonSeps.SPACE).append(this.RUNNABLE).append(this.stringUtil.toString(this.runnable)).toString(), this, this.commonStrings.UPDATE);
                this.setUsedRunnable(this.runnable);
            } else if (Std.isOfType(this.openGlReadydisplayable, DemoCanvas) || Std.isOfType(this.openGlReadydisplayable, AllBinaryGameCanvas) || features.isDefault(OpenGLFeatureFactory.getInstance().OPENGL)) {
                PreLogUtil.put(stringMaker.append(commonSeps.SPACE).append(OpenGLFeatureFactory.getInstance().OPENGL.toString()).append(commonSeps.SPACE).append(this.RUNNABLE).append(this.stringUtil.toString(this.runnable)).toString(), this, this.commonStrings.UPDATE);
                this.setUsedRunnable(this.runnable);
            } else {
                PreLogUtil.put(stringMaker.append(this.RUNNABLE).append(this.stringUtil.toString(NullRunnable.getInstance())).toString(), this, this.commonStrings.UPDATE);
                this.setUsedRunnable(NullWaitGameRunnable.getInstance());
            }
        }
    }

    public function getDisplayable() : Displayable {
        return this.displayable;
    }

    public function getUsedRunnable() : GameRunnable {
        return this.usedRunnable;
    }

    public function setUsedRunnable(usedRunnable : GameRunnable) : Void {
        PreLogUtil.put(new StringMaker().append(this.RUNNABLE).append(this.stringUtil.toString(this.runnable)).append(CommonSeps.getInstance().COLON_SEP).append(this.stringUtil.toString(usedRunnable)).toString(), this, this.SET_USED_RUNNABLE);
        this.usedRunnable = usedRunnable;
    }

}

