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
package org.allbinary.logic.io.file.zip;

//import java.util.zip.ZipEntry;
//import java.util.zip.ZipInputStream;
//import java.util.zip.ZipOutputStream;
import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.logic.io.AbDataOutputStream;
import org.allbinary.logic.io.AbFileInputStream;
import org.allbinary.logic.io.AbFileOutputStream;
import org.allbinary.logic.io.DataOutputStreamFactory;
import org.allbinary.logic.io.StreamUtil;
import org.allbinary.logic.io.file.AbFile;
import org.allbinary.logic.io.file.FileUtil;
import org.allbinary.logic.string.StringMaker;
import org.allbinary.string.CommonStrings;
import org.allbinary.util.BasicArrayList;

class ZipFileUtil {
    public final logUtil : LogUtil = LogUtil.getInstance();
    private static final instance : ZipFileUtil = new ZipFileUtil();
    public static function getInstance() : ZipFileUtil {
        return ZipFileUtil.instance;
    }

    private final commonStrings : CommonStrings = CommonStrings.getInstance();
    public function create(outFilename : String, fileBasicArrayList : BasicArrayList) : Void {
        try {
            final zipFile : AbFile = AbFile.createAbFile(outFilename);
            if (zipFile.exists()) {
                zipFile.delete();
            }
            zipFile.createNewFile();
            final outputStream : ZipOutputStream = new ZipOutputStream(AbFileOutputStream.createFromAbFile(zipFile));
            final streamUtil : StreamUtil = StreamUtil.getInstance();
            final stringBuffer : StringMaker = new StringMaker();
            final byteArray : haxe.ds.Vector<Int> = haxe.ds.Vector.fromArrayCopy([for (index in 0...16384) 0]);
            var fileInputStream : AbFileInputStream = null;
            final size : Int = fileBasicArrayList.size();
            var current : Int = 0;
            for (i in 0...size) {
                var file : AbFile = (cast fileBasicArrayList.get(i) : AbFile);
                if (file.isDirectory()) {
                } else if (file.isFile()) {
                    stringBuffer.delete(0, stringBuffer.length());
                    stringBuffer.appendint(current);
                    stringBuffer.append(" Creating Zip File Entry: ");
                    stringBuffer.append(file.getPath());
                    this.logUtil.putF(Std.string(stringBuffer), this, "create()");
                    try {
                        fileInputStream = AbFileInputStream.createFromAbFile(file);
                        outputStream.putNextEntry(new ZipEntry(file.getPath()));
                        streamUtil.get(fileInputStream, outputStream, byteArray);
                        outputStream.closeEntry();
                        streamUtil.close(fileInputStream);
                    } catch (e : haxe.Exception) {
                        this.logUtil.putF("Skipping File (Probably Local): " + file.getPath(), this, "create()");
                    }
                }
                current++;
            }
            streamUtil.close(outputStream);
        } catch (e : haxe.Exception) {
            this.logUtil.put(this.commonStrings.EXCEPTION, this, "create", e);
        }
    }

    // throws Exception
    public function unzip(path : String, zipFile : AbFile, fileName : String) : Void {
        var buffer : haxe.ds.Vector<Int> = haxe.ds.Vector.fromArrayCopy([for (index in 0...16384) 0]);
        var inputStream : ZipInputStream = null;
        try {
            inputStream = new ZipInputStream(AbFileInputStream.createFromAbFile(zipFile));
            var zipEntry : ZipEntry = null;
            final stringBuffer : StringMaker = new StringMaker();
            final fileUtil : FileUtil = FileUtil.getInstance();
            while (((zipEntry = inputStream.getNextEntry())) != null) {
                var entryName : String = zipEntry.getName();
                if (zipEntry.isDirectory()) {
                } else {
                    var entryFile : AbFile = AbFile.createAbFile(path + entryName);
                    stringBuffer.delete(0, stringBuffer.length());
                    stringBuffer.append("ZipEntry Name: ");
                    stringBuffer.append(entryName);
                    stringBuffer.append(" isFile: ");
                    stringBuffer.appendboolean(entryFile.isFile());
                    stringBuffer.append(" isDirectory: ");
                    stringBuffer.appendboolean(entryFile.isDirectory());
                    stringBuffer.append(" getParent: ");
                    stringBuffer.append(entryFile.getParent());
                    this.logUtil.putF(Std.string(stringBuffer), this, "unzip");
                    var dataOutputStream : AbDataOutputStream = DataOutputStreamFactory.getInstance().getInstanceForAbFile(entryFile);
                    fileUtil.write(inputStream, dataOutputStream, buffer);
                }
                inputStream.closeEntry();
            }
        }
        // Java finally: Haxe has no finally so this always runs after the try
        {
            StreamUtil.getInstance().close(inputStream);
        }
    }

    public function new() {
    }
}

