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
package org.allbinary.input.motion.gesture.configuration;

import org.allbinary.game.input.CompleteMotionGestureInputEvent;
import org.allbinary.graphics.color.BasicColor;
import org.allbinary.graphics.color.BasicColorFactory;
import org.allbinary.input.motion.gesture.MotionGestureToMotionGestureActionAssociation;
import org.allbinary.logic.string.StringUtil;
import org.allbinary.util.BasicArrayList;
import org.allbinary.util.BasicArrayListD;

class MotionGestureConfiguration {
    private var diagonalMotionGestureAllowed : Bool = true;
    private var diagonalTolerance : Int = 7;
    private var minimumMotionGesture : Int = 9;
    private var button : String = StringUtil.getInstance().EMPTY_STRING;
    private var color : BasicColor = BasicColorFactory.getInstance().BLUE;
    private var executingActions : Bool = true;
    private var mouseButtonMask : Int = 0;
    private var activeCommands : BasicArrayList = new BasicArrayListD();
    public function new() {
    }

    public function addMotionGestureAction(list : BasicArrayList, commandAction : CompleteMotionGestureInputEvent) : Void {
        this.activeCommands.add(new MotionGestureToMotionGestureActionAssociation(list, commandAction));
    }

    public function clearMotionGestureAction() : Void {
        this.activeCommands.clear();
    }

    public function getAssociateCommandActionsList() : BasicArrayList {
        return this.activeCommands;
    }

    public function isDiagonalMotionGestureAllowed() : Bool {
        return this.diagonalMotionGestureAllowed;
    }

    public function isExecutingActionsAllowed() : Bool {
        return this.executingActions;
    }

    public function setExecutingActionsAllowed(executingActionAllowed : Bool) : Void {
        this.executingActions = executingActionAllowed;
    }

    public function setDiagonalMotionGestureAllowed(diagonalMotionGestureAllowed : Bool) : Void {
        this.diagonalMotionGestureAllowed = diagonalMotionGestureAllowed;
    }

    public function getDiagonalTolerance() : Int {
        return this.diagonalTolerance;
    }

    public function setDiagonalTolerance(diagonalTolerance : Int) : Void {
        this.diagonalTolerance = diagonalTolerance;
    }

    public function getMinimumMotionGesture() : Int {
        return this.minimumMotionGesture;
    }

    public function setMinimumMotionGesture(minimumMotionGesture : Int) : Void {
        this.minimumMotionGesture = minimumMotionGesture;
    }

    public function getButton() : String {
        return this.button;
    }

    public function setButton(button : String) : Void {
        this.button = button;
    }

    public function getColor() : BasicColor {
        return this.color;
    }

    public function setColor(color : BasicColor) : Void {
        this.color = color;
    }

    public function getMouseButtonMask() : Int {
        return this.mouseButtonMask;
    }

    public function setMouseButtonMask(mouseButtonMask : Int) : Void {
        this.mouseButtonMask = mouseButtonMask;
    }

}

