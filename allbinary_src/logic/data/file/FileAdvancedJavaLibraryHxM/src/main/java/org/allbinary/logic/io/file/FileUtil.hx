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
package org.allbinary.logic.io.file;

import jre.io.InputStream;
import jre.io.OutputStream;
import org.allbinary.globals.URLGLOBALS;
import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.logic.communication.log.PreLogUtil;
import org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory;
import org.allbinary.logic.io.AbDataOutputStream;
import org.allbinary.logic.io.AbFileInputStream;
import org.allbinary.logic.io.AbFileLocalInputStream;
import org.allbinary.logic.io.AbIOSystem;
import org.allbinary.logic.io.DataOutputStreamFactory;
import org.allbinary.logic.io.FileStreamFactory;
import org.allbinary.logic.io.StreamUtil;
import org.allbinary.logic.io.file.directory.Directory;
import org.allbinary.logic.io.path.AbPath;
import org.allbinary.logic.io.path.AbPathData;
import org.allbinary.logic.string.StringMaker;
import org.allbinary.logic.string.StringUtil;
import org.allbinary.string.CommonLabels;
import org.allbinary.string.CommonStrings;
import org.allbinary.util.BasicArrayList;

//data/init/views/TestStore/template/type/genericTemplateObjectConfig.xml
class FileUtil {
    public final logUtil : LogUtil = LogUtil.getInstance();
    private static final instance : FileUtil = new FileUtil();
    public static function getInstance() : FileUtil {
        return FileUtil.instance;
    }

    private final directory : Directory = Directory.getInstance();
    private final logConfigTypeFactory : LogConfigTypeFactory = LogConfigTypeFactory.getInstance();
    private final commonStrings : CommonStrings = CommonStrings.getInstance();
    private final streamUtil : StreamUtil = StreamUtil.getInstance();
    public function new() {
    }

    public function write(...args : Dynamic) : Dynamic {
        if (args.length == 2 && Std.isOfType(args[0], InputStream) && Std.isOfType(args[0], AbFile)) {
            this.write_InputStream_AbFile(args[0], args[1]);
            return null;
        }
        if (args.length == 2 && Std.isOfType(args[0], InputStream) && Std.isOfType(args[0], AbDataOutputStream)) {
            this.write_InputStream_AbDataOutputStream(args[0], args[1]);
            return null;
        }
        if (args.length == 3) {
            this.write_InputStream_AbDataOutputStream_byteArray(args[0], args[1], args[2]);
            return null;
        }
        if (args.length == 2) {
            this.write_String_String(args[0], args[1]);
            return null;
        }
        throw new jre.lang.IllegalArgumentException("No matching overload: write");
    }

    // throws Exception
    public function write_InputStream_AbFile(inputStream : InputStream, file : AbFile) : Void {
        var dataOutputStream : AbDataOutputStream = DataOutputStreamFactory.getInstance().getInstanceForAbFile(file);
        this.write(inputStream, dataOutputStream);
    }

    // throws Exception
    public function write_InputStream_AbDataOutputStream(inputStream : InputStream, dataOutputStream : AbDataOutputStream) : Void {
        try {
            dataOutputStream = (cast StreamUtil.getInstance().get(inputStream, dataOutputStream, haxe.ds.Vector.fromArrayCopy([for (index in 0...16384) 0])) : AbDataOutputStream);
            dataOutputStream.flush();
        }
        // Java finally: Haxe has no finally so this always runs after the try
        {
            StreamUtil.getInstance().close(dataOutputStream);
        }
    }

    // throws Exception
    public function write_InputStream_AbDataOutputStream_byteArray(inputStream : InputStream, dataOutputStream : AbDataOutputStream, buffer : haxe.ds.Vector<Int>) : Void {
        try {
            dataOutputStream = (cast StreamUtil.getInstance().get(inputStream, dataOutputStream, buffer) : AbDataOutputStream);
            dataOutputStream.flush();
        }
        // Java finally: Haxe has no finally so this always runs after the try
        {
            StreamUtil.getInstance().close(dataOutputStream);
        }
    }

    public function copy(...args : Dynamic) : Dynamic {
        if (args.length == 2 && Std.isOfType(args[0], AbFileInputStream) && Std.isOfType(args[0], AbDataOutputStream)) {
            this.copy_AbFileInputStream_AbDataOutputStream(args[0], args[1]);
            return null;
        }
        if (args.length == 2) {
            return this.copy_AbPath_AbPath(args[0], args[1]);
        }
        throw new jre.lang.IllegalArgumentException("No matching overload: copy");
    }

    // throws Exception
    private function copy_AbFileInputStream_AbDataOutputStream(dataInputStream : AbFileInputStream, dataOutputStream : AbDataOutputStream) : Void {
        try {
            dataOutputStream = (cast StreamUtil.getInstance().get(dataInputStream, dataOutputStream, haxe.ds.Vector.fromArrayCopy([for (index in 0...16384) 0])) : AbDataOutputStream);
            dataOutputStream.flush();
        }
        // Java finally: Haxe has no finally so this always runs after the try
        {
            StreamUtil.getInstance().close(dataOutputStream);
            StreamUtil.getInstance().close(dataInputStream);
        }
    }

    // throws Exception
    private function fixPath(file : AbFile, path : AbPath, realPath : AbPath, cloud : String) : AbPath {
        var beginIndex : Int = file.getPath().indexOf(cloud) + cloud.length;
        var endIndex : Int = file.getPath().indexOf(file.getName());
        var fixedPathString : String = realPath.toFileSystemString() + file.getPath().substring(beginIndex, endIndex);
        var fixedPath : AbPath = new AbPath(fixedPathString, StringUtil.getInstance().EMPTY_STRING);
        this.directory.create(fixedPath);
        final string : String = fixedPath.toFileSystemString();
        if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(this.logConfigTypeFactory.FILE)) {
            this.logUtil.putF(string, this, "fixPath");
        }
        var outPath : AbPath = new AbPath(string, file.getName());
        return outPath;
    }

    public function copyToCloud(...args : Dynamic) : Dynamic {
        if (args.length == 4 && Std.isOfType(args[0], AbFile) && Std.isOfType(args[0], AbPath) && Std.isOfType(args[0], AbPath) && Std.isOfType(args[0], String)) {
            this.copyToCloud_AbFile_AbPath_AbPath_String(args[0], args[1], args[2], args[3]);
            return null;
        }
        if (args.length == 6) {
            this.copyToCloud_AbFile_AbPath_AbPath_String_boolean_boolean(args[0], args[1], args[2], args[3], args[4], args[5]);
            return null;
        }
        if (args.length == 2) {
            this.copyToCloud_AbFile_AbFile(args[0], args[1]);
            return null;
        }
        if (args.length == 4) {
            this.copyToCloud_AbFile_AbFile_boolean_boolean(args[0], args[1], args[2], args[3]);
            return null;
        }
        throw new jre.lang.IllegalArgumentException("No matching overload: copyToCloud");
    }

    // throws Exception
    public function copyToCloud_AbFile_AbPath_AbPath_String(file : AbFile, path : AbPath, realPath : AbPath, cloud : String) : Void {
        this.copyToCloud(file, path, realPath, cloud, false, false);
    }

    // throws Exception
    public function copyToCloud_AbFile_AbPath_AbPath_String_boolean_boolean(file : AbFile, path : AbPath, realPath : AbPath, cloud : String, overwriteNewer : Bool, overwriteAll : Bool) : Void {
        try {
            var outPath : AbPath = this.fixPath(file, path, realPath, cloud);
            var outFile : AbFile = AbFile.createAbFileFromAbPath(outPath);
            if (!this.copyPrepare(file, outFile, overwriteNewer, overwriteAll)) {
                return;
            } else {
                if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(this.logConfigTypeFactory.FILE)) {
                    var stringBuffer : StringMaker = new StringMaker();
                    stringBuffer.append("Out File: ");
                    stringBuffer.append(outFile.getPath());
                    stringBuffer.append(" In File: ");
                    stringBuffer.append(file.getPath());
                    stringBuffer.append(" to cloud.");
                    this.logUtil.putF(Std.string(stringBuffer), getInstance(), "copyToCloud");
                }
            }
            var dataOutputStream : AbDataOutputStream = DataOutputStreamFactory.getInstance().getInstanceForAbFile(outFile);
            var fileInputStream : AbFileInputStream = new AbFileLocalInputStream(file);
            this.copy(fileInputStream, dataOutputStream);
        } catch (e : haxe.Exception) {
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(this.logConfigTypeFactory.FILEERROR)) {
                var stringBuffer : StringMaker = new StringMaker();
                stringBuffer.append("Error Copying File File: ");
                stringBuffer.append(Std.string(file));
                stringBuffer.append(" to cloud.");
                this.logUtil.put(Std.string(stringBuffer), getInstance(), "copyToCloud", e);
            }
            throw e;
        }
    }

    // throws Exception
    public function copyToCloud_AbFile_AbFile(file : AbFile, outFile : AbFile) : Void {
        this.copyToCloud(file, outFile, false, false);
    }

    // throws Exception
    public function copyToCloud_AbFile_AbFile_boolean_boolean(file : AbFile, outFile : AbFile, overwriteNewer : Bool, overwriteAll : Bool) : Void {
        try {
            var stringBuffer : StringMaker = new StringMaker();
            if (!this.copyPrepare(file, outFile, overwriteNewer, overwriteAll)) {
                return;
            } else {
                if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(this.logConfigTypeFactory.FILE)) {
                    stringBuffer.delete(0, stringBuffer.length());
                    stringBuffer.append("Out File: ");
                    stringBuffer.append(outFile.getPath());
                    stringBuffer.append(" In File: ");
                    stringBuffer.append(file.getPath());
                    stringBuffer.append(" to cloud.");
                    this.logUtil.putF(Std.string(stringBuffer), getInstance(), "copyToCloud");
                }
            }
            var dataOutputStream : AbDataOutputStream = DataOutputStreamFactory.getInstance().getInstanceForAbFile(outFile);
            var fileInputStream : AbFileInputStream = new AbFileLocalInputStream(file);
            this.copy(fileInputStream, dataOutputStream);
        } catch (e : haxe.Exception) {
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(this.logConfigTypeFactory.FILEERROR)) {
                var stringBuffer : StringMaker = new StringMaker();
                stringBuffer.append("Error Copying File File: ");
                stringBuffer.append(Std.string(file));
                stringBuffer.append(" to cloud.");
                this.logUtil.put(Std.string(stringBuffer), getInstance(), "copyToCloud", e);
            }
            throw e;
        }
    }

    // throws Exception
    private function copyPrepare(fromFile : AbFile, toFile : AbFile, overwriteNewer : Bool, overwriteAll : Bool) : Bool {
        if (toFile.exists()) {
            var stringBuffer : StringMaker = new StringMaker();
            if (overwriteAll) {
                if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(this.logConfigTypeFactory.FILE)) {
                    stringBuffer.delete(0, stringBuffer.length());
                    stringBuffer.append("Overwriting File: ");
                    stringBuffer.append(toFile.getPath());
                    this.logUtil.putF(Std.string(stringBuffer), getInstance(), "copyFile");
                }
                toFile.delete();
                toFile.createNewFile();
            } else if (toFile.lastModified() < fromFile.lastModified() && overwriteNewer) {
                if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(this.logConfigTypeFactory.FILE)) {
                    stringBuffer.delete(0, stringBuffer.length());
                    stringBuffer.append("Newer by: ");
                    stringBuffer.appendlong(haxe.Int64.ofInt(fromFile.lastModified() - toFile.lastModified()));
                    stringBuffer.append("ms ");
                    stringBuffer.append("Copying File: ");
                    stringBuffer.append(toFile.getPath());
                    this.logUtil.putF(Std.string(stringBuffer), getInstance(), "copyFile");
                }
                toFile.delete();
                toFile.createNewFile();
            } else {
                if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(this.logConfigTypeFactory.FILE)) {
                    stringBuffer.delete(0, stringBuffer.length());
                    stringBuffer.append("File Already Exists");
                    if (overwriteNewer) {
                        stringBuffer.append(" And Is Not Older");
                    } else {
                        stringBuffer.append(" And Not A In Overwrite Mode");
                    }
                    stringBuffer.append(CommonLabels.getInstance().COLON_SEP);
                    stringBuffer.append(toFile.getPath());
                    this.logUtil.putF(Std.string(stringBuffer), getInstance(), "copyFile");
                }
                return false;
            }
        } else {
            toFile.createNewFile();
        }
        return true;
    }

    private function copyFile(...args : Dynamic) : Dynamic {
        if (args.length == 2) {
            this.copyFile_AbFile_AbFile(args[0], args[1]);
            return null;
        }
        if (args.length == 4) {
            this.copyFile_AbFile_AbFile_boolean_boolean(args[0], args[1], args[2], args[3]);
            return null;
        }
        throw new jre.lang.IllegalArgumentException("No matching overload: copyFile");
    }

    // throws Exception
    private function copyFile_AbFile_AbFile(fromFile : AbFile, toFile : AbFile) : Void {
        this.copyFile(fromFile, toFile, false, false);
    }

    // throws Exception
    private function copyFile_AbFile_AbFile_boolean_boolean(fromFile : AbFile, toFile : AbFile, overwriteNewer : Bool, overwriteAll : Bool) : Void {
        try {
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(this.logConfigTypeFactory.FILE)) {
                var stringBuffer : StringMaker = new StringMaker();
                stringBuffer.append("Copying ");
                stringBuffer.appendlong(haxe.Int64.ofInt(fromFile.length()));
                stringBuffer.append(" bytes from File: ");
                stringBuffer.append(fromFile.getPath());
                stringBuffer.append(" to: ");
                stringBuffer.append(toFile.getPath());
                this.logUtil.putF(Std.string(stringBuffer), getInstance(), "copyFile");
            }
            if (!this.copyPrepare(fromFile, toFile, overwriteNewer, overwriteAll)) {
                return;
            }
            var dataOutputStream : AbDataOutputStream = DataOutputStreamFactory.getInstance().getInstanceForAbFile(toFile);
            var fileInputStream : AbFileInputStream = AbFileInputStream.createFromAbFile(fromFile);
            this.copy(fileInputStream, dataOutputStream);
        } catch (e : haxe.Exception) {
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(this.logConfigTypeFactory.FILEERROR)) {
                var stringBuffer : StringMaker = new StringMaker();
                stringBuffer.append("Error Copying File fromFile: ");
                stringBuffer.append(Std.string(fromFile));
                stringBuffer.append(" to: ");
                stringBuffer.append(Std.string(toFile));
                this.logUtil.put(Std.string(stringBuffer), getInstance(), "copyFile", e);
            }
            throw e;
        }
    }

    private static function getNewDirectory(fromFile : AbFile) : String {
        var newDirectory : String = fromFile.getPath();
        var separatorChar : String = FilePathData.getInstance().PATH_START;
        if (AbIOSystem.getInstance().isType("com.vobject.appengine.java.io")) {
            separatorChar = AbPathData.getInstance().SEPARATOR;
        }
        var lastIndex : Int = newDirectory.lastIndexOf(separatorChar);
        if (lastIndex >= newDirectory.length) {
            newDirectory = newDirectory.substring(0, newDirectory.length - 1);
            lastIndex = newDirectory.lastIndexOf(separatorChar);
        }
        return newDirectory.substring(lastIndex, newDirectory.length);
    }

    // throws Exception
    public function copyDirectoryPortion(fromDirectoryAbPath : AbPath, toDirectoryAbPath : AbPath, overwriteNewer : Bool, overwriteAll : Bool, current : Int, total : Int) : Void {
        final file : AbFile = AbFile.createAbFileFromAbPath(fromDirectoryAbPath);
        if (!file.isDirectory()) {
            throw new jre.lang.JavaException("Not a directory: " + file.getPath());
        }
        final fileList : BasicArrayList = this.directory.search(file, true);
        final size : Int = fileList.size();
        final stringBuffer : StringMaker = new StringMaker();
        stringBuffer.append("Searched: ");
        stringBuffer.append(file.getPath());
        stringBuffer.append(" Total: ");
        stringBuffer.appendint(size);
        final portion : Int = Std.int(size / total) + 1;
        final start : Int = portion * current;
        var end : Int = start + portion;
        if (end > size) {
            end = size;
        }
        stringBuffer.append(" Section: ");
        stringBuffer.appendint(start);
        stringBuffer.append(" - ");
        stringBuffer.appendint(end);
        if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(this.logConfigTypeFactory.FILE)) {
            this.logUtil.putF(Std.string(stringBuffer), getInstance(), "copySomeFilesToDirectory()");
        }
        var nextFile : AbFile = null;
        for (index in start...end) {
            nextFile = (cast fileList.get(index) : AbFile);
            if (nextFile.isDirectory()) {
            } else {
                var path : String = new AbPath(nextFile.getPath(), StringUtil.getInstance().EMPTY_STRING).getPath();
                var beginIndex : Int = fromDirectoryAbPath.getPath().length();
                if (path.indexOf(URLGLOBALS.getWebappPath()) < 0) {
                    beginIndex -= new AbPath(URLGLOBALS.getWebappPath(), StringUtil.getInstance().EMPTY_STRING).getPath().length();
                }
                var newPath : String = toDirectoryAbPath.toFileSystemString() + path.substring(beginIndex);
                var toFile : AbFile = AbFile.createAbFileFromAbPath(new AbPath(newPath, StringUtil.getInstance().EMPTY_STRING));
                this.copyFile(nextFile, toFile, overwriteNewer, overwriteAll);
            }
        }
    }

    // throws Exception
    private function copyDirectory(fromFile : AbFile, to : AbFile) : Void {
        try {
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(this.logConfigTypeFactory.FILE)) {
                final stringBuffer : StringMaker = new StringMaker();
                stringBuffer.append("Copying Directory from: ");
                stringBuffer.append(fromFile.getPath());
                stringBuffer.append(" to: ");
                stringBuffer.append(to.getPath());
                this.logUtil.putF(Std.string(stringBuffer), getInstance(), "copyDirectory");
            }
            final newDirectory : String = FileUtil.getNewDirectory(fromFile);
            final newDirectoryAbPath : AbPath = new AbPath(to.getPath() + AbPathData.getInstance().SEPARATOR + newDirectory, StringUtil.getInstance().EMPTY_STRING);
            if (!this.directory.create(newDirectoryAbPath)) {
                throw new jre.lang.JavaException("Failed to create directory: " + newDirectoryAbPath);
            }
            final fileArray : haxe.ds.Vector<AbFile> = FileWrapperUtil.wrapFiles(fromFile.listFiles());
            final size : Int = fileArray.length;
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(this.logConfigTypeFactory.FILE)) {
                final stringBuffer : StringMaker = new StringMaker();
                stringBuffer.append("Copying ");
                stringBuffer.appendint(size);
                stringBuffer.append(" files from: ");
                stringBuffer.append(fromFile.getPath());
                stringBuffer.append(" to: ");
                stringBuffer.append(to.getPath());
                this.logUtil.putF(Std.string(stringBuffer), getInstance(), "copyDirectory");
            }
            var file : AbFile = null;
            for (index in 0...size) {
                file = fileArray[index];
                if (file.isFile()) {
                    this.copyFile(file, AbFile.createAbFilePathAndName(Std.string(newDirectoryAbPath), file.getName()));
                } else if (file.isDirectory()) {
                    this.copyDirectory(file, AbFile.createAbFileFromAbPath(newDirectoryAbPath));
                } else {
                    throw new jre.lang.JavaException("File Copy Error");
                }
            }
        } catch (e : haxe.Exception) {
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(this.logConfigTypeFactory.FILEERROR)) {
                final stringBuffer : StringMaker = new StringMaker();
                stringBuffer.append("Error Copying Directory fromFile: ");
                stringBuffer.append(Std.string(fromFile));
                stringBuffer.append(" to: ");
                stringBuffer.append(Std.string(to));
                this.logUtil.put(Std.string(stringBuffer), getInstance(), "copyDirectory", e);
            }
            throw e;
        }
    }

    // throws Exception
    // synchronized
    public function copy_AbPath_AbPath(fromAbPath : AbPath, to : AbPath) : Bool {
        final COPY : String = "copy";
        try {
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(this.logConfigTypeFactory.FILE)) {
                final stringBuffer : StringMaker = new StringMaker();
                stringBuffer.append("Copying AbPaths from: ");
                stringBuffer.append(Std.string(fromAbPath));
                stringBuffer.append(" to: ");
                stringBuffer.append(Std.string(to));
                this.logUtil.putF(Std.string(stringBuffer), getInstance(), COPY);
            }
            if (fromAbPath == null) {
                throw new jre.lang.JavaException("Cannot Copy From A Null Location");
            }
            if (to == null) {
                throw new jre.lang.JavaException("Cannot Copy To A Null Location");
            }
            final fromLocationFile : AbFile = AbFile.createAbFileFromAbPath(fromAbPath);
            final toLocationFile : AbFile = AbFile.createAbFileFromAbPath(to);
            if (fromLocationFile.isFile()) {
                if (toLocationFile.isDirectory()) {
                    var file : AbFile = AbFile.createAbFileWithChild(toLocationFile, fromLocationFile.getName());
                    this.copyFile(fromLocationFile, file);
                    if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(this.logConfigTypeFactory.FILE)) {
                        var stringBuffer : StringMaker = new StringMaker();
                        stringBuffer.append("Copied file=");
                        stringBuffer.append(fromLocationFile.getName());
                        stringBuffer.append(" from: ");
                        stringBuffer.append(fromLocationFile.getPath());
                        stringBuffer.append(" to: ");
                        stringBuffer.append(toLocationFile.getPath());
                        this.logUtil.putF(Std.string(stringBuffer), getInstance(), COPY);
                    }
                } else {
                    this.copyFile(fromLocationFile, toLocationFile);
                    if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(this.logConfigTypeFactory.FILE)) {
                        var stringBuffer : StringMaker = new StringMaker();
                        stringBuffer.append("Copied file with new name ");
                        stringBuffer.append(" from: ");
                        stringBuffer.append(fromLocationFile.getPath());
                        stringBuffer.append(" to: ");
                        stringBuffer.append(toLocationFile.getPath());
                        this.logUtil.putF(Std.string(stringBuffer), getInstance(), COPY);
                    }
                }
            } else if (fromLocationFile.isDirectory() && toLocationFile.isDirectory()) {
                if (fromAbPath.toFileSystemString().charAt(fromAbPath.toFileSystemString().length() - 1) == jre.io.File.separatorChar) {
                    if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(this.logConfigTypeFactory.FILE)) {
                        this.logUtil.putF("Copying subdirectories", getInstance(), COPY);
                    }
                    var fileArray : haxe.ds.Vector<AbFile> = FileWrapperUtil.wrapFiles(fromLocationFile.listFiles());
                    for (index in 0...fileArray.length) {
                        var file : AbFile = fileArray[index];
                        if (file.isFile()) {
                            var aFile : AbFile = AbFile.createAbFileWithChild(toLocationFile, file.getName());
                            this.copyFile(file, aFile);
                        } else if (file.isDirectory()) {
                            this.copyDirectory(file, toLocationFile);
                        } else {
                            throw new jre.lang.JavaException("File Copy Error");
                        }
                    }
                    if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(this.logConfigTypeFactory.FILE)) {
                        this.logUtil.putF("Copied subdirectories", getInstance(), COPY);
                    }
                } else {
                    if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(this.logConfigTypeFactory.FILE)) {
                        this.logUtil.putF("Copyinhg directory", getInstance(), COPY);
                    }
                    this.copyDirectory(fromLocationFile, toLocationFile);
                    if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(this.logConfigTypeFactory.FILE)) {
                        this.logUtil.putF("Copied directory", getInstance(), COPY);
                    }
                }
            }
            return true;
        } catch (e : haxe.Exception) {
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(this.logConfigTypeFactory.FILEERROR)) {
                final stringBuffer : StringMaker = new StringMaker();
                stringBuffer.append("Error Copying fromAbPath: ");
                stringBuffer.append(Std.string(fromAbPath));
                stringBuffer.append(" to: ");
                stringBuffer.append(Std.string(to));
                this.logUtil.put(Std.string(stringBuffer), getInstance(), COPY, e);
            }
            throw e;
        }
    }

    public function shouldSkip(file : AbFile, skipFiles : haxe.ds.Vector<String>) : Bool {
        final size : Int = skipFiles.length;
        var skipFile : String = null;
        for (index in 0...size) {
            skipFile = skipFiles[index];
            if (file.getPath().compareTo(skipFile) == 0) {
                return true;
            }
        }
        return false;
    }

    private final WRITE_LABEL : String = "Write file: ";
    private final DATA_LABEL : String = " data: ";
    private final WRITE_METHOD : String = "write";
    // throws Exception
    public function write_String_String(filePath : String, string : String) : Void {
        var dataOutputStream : AbDataOutputStream = null;
        try {
            PreLogUtil.put(Std.string(new StringMaker().append(this.WRITE_LABEL).append(filePath).append(this.DATA_LABEL).append(string)), this, this.WRITE_METHOD);
            final fileInputStreamFactory : FileStreamFactory = FileStreamFactory.getInstance();
            final fileOutputStream : OutputStream = fileInputStreamFactory.getFileOutputStreamInstance(StringUtil.getInstance().EMPTY_STRING, filePath);
            dataOutputStream = new AbDataOutputStream(fileOutputStream);
            dataOutputStream.write(haxe.io.Bytes.ofString(string), 0, string.length);
            dataOutputStream.flush();
        }
        // Java finally: Haxe has no finally so this always runs after the try
        {
            StreamUtil.getInstance().close(dataOutputStream);
        }
    }

    public function loadFileAsList(file : AbFile, max : Int, byteArray1 : haxe.ds.Vector<Int>) : BasicArrayList {
        return FileUtil2.getInstance().loadFileAsList(file, max, byteArray1);
    }

}

