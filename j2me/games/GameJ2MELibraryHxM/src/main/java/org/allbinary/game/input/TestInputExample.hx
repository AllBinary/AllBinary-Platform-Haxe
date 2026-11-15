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
package org.allbinary.game.input;

//import javax.microedition.lcdui.Graphics;

class TestInputExample implements TestInputInterface {
    private var testValue : Int = 0;
    public function up() : Void {
    }

    public function down() : Void {
    }

    public function left() : Void {
        this.testValue++;
    }

    public function right() : Void {
        this.testValue--;
    }

    public function strafeLeft() : Void {
    }

    public function strafeRight() : Void {
    }

    public function paint(graphics : Graphics) : Void {
    }

    public function paintThreed(graphics : Graphics) : Void {
    }

    public function new() {
    }
}

