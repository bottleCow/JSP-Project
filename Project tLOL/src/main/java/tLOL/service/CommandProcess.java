package tLOL.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.rithms.riot.api.RiotApiException;

public interface CommandProcess {

	String requestPro(HttpServletRequest request, HttpServletResponse response) throws RiotApiException;

}
