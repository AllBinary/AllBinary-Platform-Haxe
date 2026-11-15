// Generated Code Do Not Modify
package org.allbinary.logic.system.os.env;

//import java.io.BufferedReader;
//import java.io.InputStreamReader;
//import java.util.Properties;
import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.logic.system.os.GenericOperatingSystem;
import org.allbinary.logic.system.os.OperatingSystemFactory;
import org.allbinary.logic.system.os.OperatingSystems;
import org.allbinary.string.CommonStrings;

class RuntimeEnvironmentVariables {
    public final logUtil : LogUtil = LogUtil.getInstance();
    public final commonStrings : CommonStrings = CommonStrings.getInstance();
    public function new() {
    }

    public function getTest1() : String {
        return System.getProperty("java.java.home");
    }

    public function getVariable(var_ : String) : String {
        var environmentVariables : Properties = this.get();
        return environmentVariables.getProperty(var_);
    }

    public function get() : Properties {
        try {
            var process : Process = null;
            var environmentVariables : Properties = new Properties();
            var operatingSystemInterface : GenericOperatingSystem = OperatingSystemFactory.getInstance().getOperatingSystemInstance();
            var osName : String = operatingSystemInterface.getName();
            var linuxCommand : String = "env";
            var windowsCommand : String = "cmd.exe /c set";
            var solarisCommand : String = linuxCommand;
            var operatingSystems : OperatingSystems = OperatingSystems.getInstance();
            if (Reflect.compare(osName, operatingSystems.LINUX) == 0) {
                process = Runtime.getRuntime().exec(linuxCommand);
            } else if (osName.indexOf(operatingSystems.WINDOWS) >= 0) {
                process = Runtime.getRuntime().exec(windowsCommand);
            } else if (Reflect.compare(osName, operatingSystems.SOLARIS) == 0) {
                process = Runtime.getRuntime().exec(solarisCommand);
            } else {
                throw new haxe.Exception();
            }
            var processInputStreamReader : InputStreamReader = new InputStreamReader(process.getInputStream());
            var bufferedReader : BufferedReader = new BufferedReader(processInputStreamReader);
            var keyValuePair : String = null;
            while (((keyValuePair = bufferedReader.readLine())) != null) {
                var index : Int = keyValuePair.indexOf("=".code);
                var key : String = keyValuePair.substring(0, index);
                var value : String = keyValuePair.substring(index + 1);
                environmentVariables.put(key, value);
            }
            return environmentVariables;
        } catch (e : haxe.Exception) {
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().OSERROR)) {
                this.logUtil.put(this.commonStrings.EXCEPTION, this, "get()", e);
            }
            return null;
        }
    }

    public function getTempDir() : String {
        try {
            return System.getProperty("java.io.tmpdir");
        } catch (e : haxe.Exception) {
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().OSERROR)) {
                this.logUtil.put(this.commonStrings.EXCEPTION, this, "getTempDir()", e);
            }
            return null;
        }
    }

    public function getLibraryPath() : String {
        try {
            return System.getProperty("java.library.path");
        } catch (e : haxe.Exception) {
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().OSERROR)) {
                this.logUtil.put(this.commonStrings.EXCEPTION, this, "getLibraryPath()", e);
            }
            return null;
        }
    }

    public function getClassPath() : String {
        try {
            return System.getProperty("java.class.path");
        } catch (e : haxe.Exception) {
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().OSERROR)) {
                this.logUtil.put(this.commonStrings.EXCEPTION, this, "getClassPath()", e);
            }
            return null;
        }
    }

    public function updateLibraryPath(libPath : String) : Void {
        try {
            var existingPath : String = this.getLibraryPath();
            System.setProperty("java.library.path", libPath + ":" + existingPath);
        } catch (e : haxe.Exception) {
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().OSERROR)) {
                this.logUtil.put(this.commonStrings.EXCEPTION, this, "updateLibraryPath()", e);
            }
        }
    }

    public function getUserHome() : String {
        try {
            return System.getProperty("user.home");
        } catch (e : haxe.Exception) {
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().OSERROR)) {
                this.logUtil.put(this.commonStrings.EXCEPTION, this, "getUserHome()", e);
            }
            return null;
        }
    }

    public function getUserDir() : String {
        try {
            return System.getProperty("user.dir");
        } catch (e : haxe.Exception) {
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().OSERROR)) {
                this.logUtil.put(this.commonStrings.EXCEPTION, this, "getUserDir()", e);
            }
            return null;
        }
    }

    public function set() : Void {
        try {
        } catch (e : haxe.Exception) {
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().OSERROR)) {
                this.logUtil.put(this.commonStrings.EXCEPTION, this, "get()", e);
            }
        }
    }

    public function setVariable(var_ : String, val : String) : Void {
        try {
            var process : Process = null;
            var operatingSystemInterface : GenericOperatingSystem = OperatingSystemFactory.getInstance().getOperatingSystemInstance();
            var operatingSystems : OperatingSystems = OperatingSystems.getInstance();
            var osName : String = operatingSystemInterface.getName();
            var windowsCommand : String = "cmd.exe /c set" + var_ + "=" + val;
            if (Reflect.compare(osName, operatingSystems.LINUX) == 0) {
                throw new haxe.Exception();
            } else if (osName.indexOf(operatingSystems.WINDOWS) >= 0) {
                process = Runtime.getRuntime().exec(windowsCommand);
            } else if (Reflect.compare(osName, operatingSystems.SOLARIS) == 0) {
                throw new haxe.Exception();
            } else {
                throw new haxe.Exception();
            }
        } catch (e : haxe.Exception) {
            if (org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING.contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory.getInstance().OSERROR)) {
                this.logUtil.put(this.commonStrings.EXCEPTION, this, "setVariable()", e);
            }
        }
    }

}

