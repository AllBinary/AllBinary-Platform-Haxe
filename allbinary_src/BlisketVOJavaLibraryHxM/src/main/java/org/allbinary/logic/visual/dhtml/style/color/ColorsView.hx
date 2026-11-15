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
package org.allbinary.logic.visual.dhtml.style.color;

import org.allbinary.data.tree.dom.DomNodeInterface;
import org.allbinary.data.tree.dom.ModDomHelper;
import org.allbinary.logic.string.StringMaker;
import org.allbinary.string.CommonPhoneStrings;
import org.w3c.dom.Document;
import org.w3c.dom.Node;

class ColorsView implements DomNodeInterface {
    private final commonPhoneStrings : CommonPhoneStrings = CommonPhoneStrings.getInstance();
    private final HEXRADIX : Int = 16;
    private final MAX : Int = 255;
    public final delta : Int = 20;
    public function new() {
    }

    // throws Exception
    public function getColorNode(document : Document, redIndex : Int, greenIndex : Int, blueIndex : Int) : Node {
        var hexColorStringBuffer : StringMaker = new StringMaker();
        if (redIndex < this.HEXRADIX) {
            hexColorStringBuffer.append(this.commonPhoneStrings.ZERO);
        }
        hexColorStringBuffer.append(Integer.toString(redIndex, HEXRADIX));
        if (greenIndex < this.HEXRADIX) {
            hexColorStringBuffer.append(this.commonPhoneStrings.ZERO);
        }
        hexColorStringBuffer.append(Integer.toString(greenIndex, HEXRADIX));
        if (blueIndex < this.HEXRADIX) {
            hexColorStringBuffer.append(this.commonPhoneStrings.ZERO);
        }
        hexColorStringBuffer.append(Integer.toString(blueIndex, HEXRADIX));
        var colorNode : Node = ModDomHelper.createNameValueNodes(document, ColorData.getInstance().NAME, hexColorStringBuffer.toString());
        return colorNode;
    }

    // throws Exception
    public function toXmlNode(document : Document) : Node {
        var node : Node = ModDomHelper.createNameValueNodes(document, ColorsData.getInstance().NAME, "RGB Colors In Hex");
        var blackNode : Node = ModDomHelper.createNameValueNodes(document, ColorData.getInstance().NAME, "000000");
        node.appendChild(blackNode);
        {
            var index : Int = 0;
            while (index < this.MAX) {
            var hexColorStringBuffer : StringMaker = new StringMaker();
            if (index < this.HEXRADIX) {
                hexColorStringBuffer.append(this.commonPhoneStrings.ZERO);
            }
            hexColorStringBuffer.append(Integer.toString(index, HEXRADIX));
            if (index < this.HEXRADIX) {
                hexColorStringBuffer.append(this.commonPhoneStrings.ZERO);
            }
            hexColorStringBuffer.append(Integer.toString(index, HEXRADIX));
            if (index < this.HEXRADIX) {
                hexColorStringBuffer.append(this.commonPhoneStrings.ZERO);
            }
            hexColorStringBuffer.append(Integer.toString(index, HEXRADIX));
            var colorNode : Node = ModDomHelper.createNameValueNodes(document, ColorData.getInstance().NAME, hexColorStringBuffer.toString());
            node.appendChild(colorNode);
                index += this.delta;
            }
        }
        var whiteNode : Node = ModDomHelper.createNameValueNodes(document, ColorData.getInstance().NAME, "FFFFFF");
        node.appendChild(whiteNode);
        {
            var blueIndex : Int = Std.int(this.MAX / 2);
            while (blueIndex < this.MAX) {
            {
                var greenIndex : Int = 0;
                while (greenIndex < Std.int(this.MAX / 2)) {
                {
                    var redIndex : Int = 0;
                    while (redIndex < Std.int(this.MAX / 2)) {
                    node.appendChild(this.getColorNode(document, redIndex, greenIndex, blueIndex));
                        redIndex += this.delta;
                    }
                }
                    greenIndex += this.delta;
                }
            }
                blueIndex += this.delta;
            }
        }
        {
            var redIndex : Int = Std.int(this.MAX / 2);
            while (redIndex < this.MAX) {
            {
                var greenIndex : Int = 0;
                while (greenIndex < Std.int(this.MAX / 2)) {
                {
                    var blueIndex : Int = 0;
                    while (blueIndex < Std.int(this.MAX / 2)) {
                    node.appendChild(this.getColorNode(document, redIndex, greenIndex, blueIndex));
                        blueIndex += this.delta;
                    }
                }
                    greenIndex += this.delta;
                }
            }
                redIndex += this.delta;
            }
        }
        {
            var greenIndex : Int = Std.int(this.MAX / 2);
            while (greenIndex < this.MAX) {
            {
                var redIndex : Int = 0;
                while (redIndex < Std.int(this.MAX / 2)) {
                {
                    var blueIndex : Int = 0;
                    while (blueIndex < Std.int(this.MAX / 2)) {
                    node.appendChild(this.getColorNode(document, redIndex, greenIndex, blueIndex));
                        blueIndex += this.delta;
                    }
                }
                    redIndex += this.delta;
                }
            }
                greenIndex += this.delta;
            }
        }
        {
            var greenIndex : Int = 0;
            while (greenIndex < this.MAX) {
            {
                var redIndex : Int = 0;
                while (redIndex < this.MAX) {
                {
                    var blueIndex : Int = 0;
                    while (blueIndex < this.MAX) {
                    node.appendChild(this.getColorNode(document, redIndex, greenIndex, blueIndex));
                        blueIndex += 2 * this.delta;
                    }
                }
                    redIndex += 2 * this.delta;
                }
            }
                greenIndex += 2 * this.delta;
            }
        }
        return node;
    }

}

