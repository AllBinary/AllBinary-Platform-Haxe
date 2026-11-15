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
package org.allbinary.graphics.j2me.workarea;

import org.w3c.dom.Document;

interface WorkAreaJPanelInterface extends java.awt.event.KeyListener {
    function getName() : String;

    function deselect() : Void;

    function select() : Void;

    function changeZoom(factor : Int) : Void;

    function explodeAll() : Void;

    // throws Exception
    function autoRotate(increments : Int, totalAngle : Int) : Void;

    // throws Exception
    function autoExplode(numberOfFrames : Int, explodeType : Int) : Void;

    // throws Exception
    function autoMirror() : Void;

    function play() : Void;

    function stop() : Void;

    function isPlaying() : Bool;

    // throws Exception
    function toDocument() : Document;

}

