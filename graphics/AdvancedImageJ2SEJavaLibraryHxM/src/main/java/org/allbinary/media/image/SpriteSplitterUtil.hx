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
package org.allbinary.media.image;

//import java.awt.image.BufferedImage;
import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.logic.string.StringMaker;
import org.allbinary.string.CommonSeps;
import org.allbinary.string.CommonStrings;

class SpriteSplitterUtil {
    public final logUtil : LogUtil = LogUtil.getInstance();
    private static final instance : SpriteSplitterUtil = new SpriteSplitterUtil();
    public static function getInstance() : SpriteSplitterUtil {
        return SpriteSplitterUtil.instance;
    }

    private final commonSeps : CommonSeps = CommonSeps.getInstance();
    private final commonStrings : CommonStrings = CommonStrings.getInstance();
    public final ANIMATIONS_LABELS : haxe.ds.Vector<String> = haxe.ds.Vector.fromArrayCopy(["Row Total:", "Column Total:", "Column Total:", "Row Total:", "Column Total:", "Row Total:"]);
    public final DIRECTIONAL_ANIMATIONS : String = "Directional DLRU";
    public final HORIZONTAL_ANIMATIONS : String = "Horizontal Animations";
    public final HORIZONTAL_SPRITE : String = "Horizontal A=R=Y F=C=X";
    private final ROW_NAME : haxe.ds.Vector<String> = haxe.ds.Vector.fromArrayCopy(["idle", "walk", "attack", "defeat"]);
    private final _ROW : String = "_row";
    // throws Exception
    public function process(imageProcessorInput : ImageProcessorInput, totalFrames : Int, totalAnimations : Int, widthReduction : Int, heightReduction : Int, increaseWidth : Int, increaseHeight : Int, spriteType : String, visitor : ImageProcessedVisitor) : Void {
        var bufferedImage : BufferedImage = null;
        var generatedBufferedImageArray : haxe.ds.Vector<haxe.ds.Vector<BufferedImage>> = null;
        final bufferedImageArray : haxe.ds.Vector<BufferedImage> = imageProcessorInput.getBufferedImageArray();
        for (index in 0...bufferedImageArray.length) {
            bufferedImage = bufferedImageArray[index];
            this.logUtil.putF(spriteType, this, this.commonStrings.RUN);
            if (spriteType == this.HORIZONTAL_SPRITE) {
                final cellHeight : Int = bufferedImage.getHeight() / totalAnimations;
                final cellWidth : Int = bufferedImage.getWidth() / totalFrames;
                final columns : Int = totalFrames;
                final rows : Int = totalAnimations;
                generatedBufferedImageArray = haxe.ds.Vector.fromArrayCopy([for (index in 0...rows) haxe.ds.Vector.fromArrayCopy([for (index2 in 0...columns) null])]);
                this.logUtil.putF("Processing Individual Cells columns: " + columns + " rows: " + rows, this, this.commonStrings.RUN);
                this.logUtil.putF("Processing Individual Cells cellHeight: " + cellHeight + " cellWidth: " + cellWidth, this, this.commonStrings.RUN);
                final imageUtil : ImageUtil = ImageUtil.getInstance();
                var nameEnding : String = null;
                var x : Int = 0;
                var y : Int = 0;
                for (index2 in 0...rows) {
                    y = cellHeight * index2;
                    for (index3 in 0...columns) {
                        x = cellWidth * index3;
                        generatedBufferedImageArray[index2][index3] = bufferedImage.getSubimage(x + widthReduction, y + heightReduction, cellWidth - (widthReduction * 2), cellHeight - (heightReduction * 2));
                        if (increaseWidth != 0 || increaseHeight != 0) {
                            generatedBufferedImageArray[index2][index3] = imageUtil.createBufferedImageAllowTranslate(generatedBufferedImageArray[index2][index3], cellWidth + increaseWidth, cellHeight + increaseHeight, false, true);
                        }
                        nameEnding = new StringMaker().appendint(index2).append(this.commonSeps.UNDERSCORE).appendint(index3).toString();
                        visitor.visit(generatedBufferedImageArray[index2][index3], nameEnding, index);
                    }
                }
                this.logUtil.putF("Processing Rows from Cells", this, this.commonStrings.RUN);
                final imageUnifierProperties : ImageUnifierProperties = new ImageUnifierProperties();
                imageUnifierProperties.setRows(Std.string(1));
                imageUnifierProperties.setColumns(Std.string(columns));
                final imageUnifierCell : ImageUnifierCell = new ImageUnifierCell(Std.string(cellWidth - (2 * widthReduction)), Std.string(cellHeight - (2 * heightReduction)));
                imageUnifierProperties.setImageUnifierCell(imageUnifierCell);
                for (index2 in 0...rows) {
                    y = cellHeight * index2;
                    final tempBufferedImageArray : haxe.ds.Vector<BufferedImage> = haxe.ds.Vector.fromArrayCopy([for (index in 0...columns) null]);
                    for (index3 in 0...columns) {
                        tempBufferedImageArray[index3] = generatedBufferedImageArray[index2][index3];
                        nameEnding = new StringMaker().appendint(index2).append(this.commonSeps.UNDERSCORE).appendint(1).append(this._ROW).toString();
                    }
                    final generatedBufferedImage : BufferedImage = ImageUnifierUtil.getInstance().getImage(tempBufferedImageArray, imageUnifierProperties);
                    visitor.visit(generatedBufferedImage, nameEnding, index);
                }
            } else if (spriteType == HORIZONTAL_ANIMATIONS) {
            } else if (spriteType == this.DIRECTIONAL_ANIMATIONS) {
                final totalFrames2 : Int = 4;
                final cellHeight : Int = bufferedImage.getHeight() / totalFrames2;
                final cellWidth : Int = bufferedImage.getWidth() / totalAnimations;
                final columns : Int = totalAnimations;
                final rows : Int = totalFrames2;
                generatedBufferedImageArray = haxe.ds.Vector.fromArrayCopy([for (index in 0...rows) haxe.ds.Vector.fromArrayCopy([for (index2 in 0...columns) null])]);
                this.logUtil.putF("Processing Individual Cells for each Direction", this, this.commonStrings.RUN);
                var nameEnding : String = null;
                var x : Int = 0;
                var y : Int = 0;
                for (index2 in 0...rows) {
                    y = cellHeight * index2;
                    for (index3 in 0...columns) {
                        x = cellWidth * index3;
                        generatedBufferedImageArray[index2][index3] = bufferedImage.getSubimage(x + widthReduction, y + heightReduction, cellWidth - (widthReduction * 2), cellHeight - (heightReduction * 2));
                        if (increaseWidth != 0 || increaseHeight != 0) {
                            generatedBufferedImageArray[index2][index3] = ImageUtil.getInstance().createBufferedImageAllowTranslate(generatedBufferedImageArray[index2][index3], cellWidth + increaseWidth, cellHeight + increaseHeight, false, true);
                        }
                        nameEnding = new StringMaker().append(this.commonStrings.DIRECTION_NAME[index2]).append(this.commonSeps.UNDERSCORE).appendint(index3).toString();
                        visitor.visit(generatedBufferedImageArray[index2][index3], nameEnding, index);
                    }
                }
                final imageUnifierProperties : ImageUnifierProperties = new ImageUnifierProperties();
                imageUnifierProperties.setRows(Std.string(1));
                imageUnifierProperties.setColumns(Std.string(columns));
                final imageUnifierCell : ImageUnifierCell = new ImageUnifierCell(Std.string(cellWidth - (2 * widthReduction)) + increaseWidth, Std.string(cellHeight - (2 * heightReduction) + increaseHeight));
                imageUnifierProperties.setImageUnifierCell(imageUnifierCell);
                this.logUtil.putF("Processing Rows from Cells for each Direction", this, this.commonStrings.RUN);
                for (index2 in 0...rows) {
                    y = cellHeight * index2;
                    final tempBufferedImageArray : haxe.ds.Vector<BufferedImage> = haxe.ds.Vector.fromArrayCopy([for (index in 0...columns) null]);
                    for (index3 in 0...columns) {
                        tempBufferedImageArray[index3] = generatedBufferedImageArray[index2][index3];
                        nameEnding = new StringMaker().append(this.commonStrings.DIRECTION_NAME[index2]).append(this.commonSeps.UNDERSCORE).appendint(1).append(this._ROW).toString();
                    }
                    final generatedBufferedImage : BufferedImage = ImageUnifierUtil.getInstance().getImage(tempBufferedImageArray, imageUnifierProperties);
                    visitor.visit(generatedBufferedImage, nameEnding, index);
                }
            }
        }
    }

    public function new() {
    }
}

