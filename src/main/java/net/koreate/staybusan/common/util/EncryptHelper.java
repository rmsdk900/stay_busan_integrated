package net.koreate.staybusan.common.util;

public interface EncryptHelper {
	String encrypt(String password);
	boolean isMatch(String password, String hashed);
}
