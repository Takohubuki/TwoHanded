package com.zdh.service;

import javax.servlet.ServletContext;
import java.util.List;

public interface ItemKindService {
    List<String> getAllKind(ServletContext servletContext);
}
